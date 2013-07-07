/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sysnot.modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.sql.SQLException;


import com.sysnot.db.DBManager;
import com.sysnot.modelo.common.Listado;
import com.sysnot.modelo.dto.ClienteDTO;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClientesManager {

    public Listado getClientes(ClienteDTO cliente, int page, int limit, String sidx, String sord) {
        Connection connection;
        connection = DBManager.getConnection();
        CallableStatement cstmt = null;
        List<ClienteDTO> clientes = new ArrayList<ClienteDTO>();
        int total = 0, totalPages = 0;
        try {
            CallableStatement cs = connection.prepareCall("{CALL clientes_listar(?,?,?,?,?,?,?)}");
            cs.setString("p_nombre", cliente.getNombres());
            cs.setInt("p_page", page);
            cs.setInt("p_limit", limit);
            cs.setString("p_sidx", sidx);
            cs.setString("p_sord", sord);
            cs.registerOutParameter(6, java.sql.Types.INTEGER);
            cs.registerOutParameter(7, java.sql.Types.INTEGER);            
            boolean isResultSet = cs.execute();
            if (isResultSet) {
                ResultSet resultSet = cs.getResultSet();
                while (resultSet.next()) {
                    clientes.add(new ClienteDTO(resultSet.getInt("idcliente"), resultSet.getString("regimenfiscal"), resultSet.getString("razonsocial"), resultSet.getString("siglas"), resultSet.getString("trtamiento"), resultSet.getString("nombres"), resultSet.getString("apaterno"), resultSet.getString("amaterno"), resultSet.getString("otronombre"), resultSet.getString("nombreactmat"), resultSet.getString("nombreotrosdocs"), resultSet.getString("sexo"), resultSet.getString("rfc"), resultSet.getString("curp"), resultSet.getString("nss"), resultSet.getString("edocivil"), resultSet.getString("regimenmat"), resultSet.getString("folioactmat"), resultSet.getString("actamat"), resultSet.getInt("libroactamat"), resultSet.getDate("fechaactamat"), resultSet.getString("lugaractamat"), resultSet.getString("ciudadnac"), resultSet.getString("estadonac"), resultSet.getString("paisnac"), resultSet.getDate("fechanac")));
                }
                resultSet.close();
            }
            total = cs.getInt("size");
            totalPages = cs.getInt("totalpages");
            cs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClientesManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new Listado(clientes, total, totalPages);
    }

    public String registrar(ClienteDTO cliente) {
        Connection connection;
        connection = DBManager.getConnection();
        String sql = "{CALL clientes_guardar(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)} ";
        ResultSet resultSet = null;
        CallableStatement cstmt = null;
        try {
            cstmt = connection.prepareCall(sql);
            cstmt.setInt(1, cliente.getIdcliente());
            cstmt.setString(2, cliente.getRegimenfiscal());
            cstmt.setString(3, cliente.getRazonsocial());
            cstmt.setString(4, cliente.getSiglas());
            cstmt.setString(5, cliente.getTrtamiento());
            cstmt.setString(6, cliente.getNombres());
            cstmt.setString(7, cliente.getApaterno());
            cstmt.setString(8, cliente.getAmaterno());
            cstmt.setString(9, cliente.getOtronombre());
            cstmt.setString(10, cliente.getNombreactmat());
            cstmt.setString(11, cliente.getNombreotrosdocs());
            cstmt.setString(12, cliente.getSexo());
            cstmt.setString(13, cliente.getRfc());
            cstmt.setString(14, cliente.getCurp());
            cstmt.setString(15, cliente.getNss());
            cstmt.setString(16, cliente.getEdocivil());
            cstmt.setString(17, cliente.getRegimenmat());
            cstmt.setString(18, cliente.getFolioactmat());
            cstmt.setString(19, cliente.getActamat());
            cstmt.setInt(20, cliente.getLibroactamat() == null ? 0 : cliente.getLibroactamat());
            cstmt.setDate(21, new java.sql.Date(cliente.getFechaactamat().getTime()));
            cstmt.setString(22, cliente.getLugaractamat());
            cstmt.setString(23, cliente.getCiudadnac());
            cstmt.setString(24, cliente.getEstadonac());
            cstmt.setString(25, cliente.getPaisnac());
            cstmt.setDate(26, new java.sql.Date(cliente.getFechanac().getTime()));
            cstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return "";
    }
}
