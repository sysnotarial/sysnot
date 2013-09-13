package com;

import com.sysnot.db.DBManager;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServiceDispatch extends HttpServlet {

    private PrintWriter writer;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        writer = response.getWriter();
        HashMap<String, String[]> params = (HashMap) request.getParameterMap();
        executeService(request.getParameter("serviceName"), params);
    }

    protected void executeService(String serviceName, HashMap serviceparameters) throws ServletException, IOException {

        Connection conn = DBManager.getConnection();
        int totalparams = 0;
        String SQL1 = "select count(*) totalparams FROM information_schema.parameters WHERE SPECIFIC_SCHEMA='sysnot' AND SPECIFIC_NAME = '" + serviceName + "'";
        String SQL2 = "SELECT * FROM information_schema.parameters WHERE SPECIFIC_SCHEMA='sysnot' AND SPECIFIC_NAME = '" + serviceName + "'";
        try {
            ResultSet rs1 = conn.createStatement().executeQuery(SQL1);
            if (rs1.first()) {
                totalparams = rs1.getInt("totalparams");
            }
            String params = "";
            for (int i = 0; i < totalparams; i++) {
                params += "?,";
            }
            params = params.substring(0, params.length() - 1);
            CallableStatement prepareCall = conn.prepareCall("{call " + serviceName + "(" + params + ")}");

            ResultSet rs2 = conn.createStatement().executeQuery(SQL2);
            String nombreparam;
            boolean outparameter = false;
            while (rs2.next()) {
                outparameter = false;
                nombreparam = rs2.getString("PARAMETER_NAME");
                if (rs2.getString("PARAMETER_MODE").equals("OUT")) {
                    outparameter = true;
                };
                if (serviceparameters.containsKey(nombreparam) || outparameter) {
                    switch (rs2.getString("DATA_TYPE")) {
                        case "varchar":
                            if (outparameter) {
                                prepareCall.registerOutParameter(nombreparam, Types.VARCHAR);
                            } else {
                                if (((String[]) serviceparameters.get(nombreparam)).length > 0) {
                                    prepareCall.setString(nombreparam, ((String[]) serviceparameters.get(nombreparam))[0].toString());
                                }
                            }
                            break;
                        case "int":
                            if (outparameter) {
                                prepareCall.registerOutParameter(nombreparam, Types.INTEGER);
                            } else {
                                if (((String[]) serviceparameters.get(nombreparam)).length > 0) {
                                    prepareCall.setInt(nombreparam, Integer.parseInt(((String[]) serviceparameters.get(nombreparam))[0]));
                                }
                            }
                            break;
                    }
                } else {
                    prepareCall.setNull(nombreparam, Types.NULL);
                }
            }
            ResultSet rs = prepareCall.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            writer.write("[");
            if(rs.next()){
                Map<String,Object> row=new HashMap();                
                for (int i = 1; i < rsmd.getColumnCount(); i++) {
                    int type = rsmd.getColumnType(i);
                    if (type == Types.VARCHAR || type == Types.CHAR) {
                        row.put(rsmd.getColumnName(i),rs.getString(i));
                    } else {
                        row.put(rsmd.getColumnName(i),Long.toString(rs.getLong(i)));
                    }
                }
                Gson json=new Gson();
                writer.write(json.toJson(row));                
            }
            while (rs.next()) {
                writer.write(",");
                Map<String,Object> row=new HashMap();
                for (int i = 1; i < rsmd.getColumnCount(); i++) {
                    int type = rsmd.getColumnType(i);
                    if (type == Types.VARCHAR || type == Types.CHAR) {
                        row.put(rsmd.getColumnName(i),rs.getString(i));
                    } else {
                        row.put(rsmd.getColumnName(i),Long.toString(rs.getLong(i)));
                    }
                }
                Gson json=new Gson();
                writer.write(json.toJson(row));
            }
            writer.write("]");
        } catch (SQLException ex) {
            String message = ex.getMessage();
        }
    }
}
