/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sysnot.modelo;

import com.sysnot.db.DBManager;
import com.sysnot.modelo.common.Listado;
import com.sysnot.modelo.dto.MenuDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author zderan
 */
public class MenuManager {
    public Listado getMenuUsuario(Integer idUsuario){
        Connection connection;
        connection = DBManager.getConnection();
        CallableStatement cstmt = null;
        List<MenuDTO> lstMenu = new ArrayList<MenuDTO>();
        int total = 0, totalPages = 0;
        try {
            CallableStatement cs = connection.prepareCall("{CALL menu_listar(?)}");
            cs.setInt("p_usuario", idUsuario);
            Boolean isResultSet = cs.execute();
            if (isResultSet) {
                ResultSet resultSet = cs.getResultSet();
                while (resultSet.next()) {
                    lstMenu.add(new MenuDTO(resultSet.getInt("idMenu"),
                    resultSet.getString("titulo"),
                    resultSet.getInt("nivel"),
                    resultSet.getInt("idPadre"),
                    resultSet.getString("rutaIcono"),
                    resultSet.getString("url"),
                    resultSet.getInt("orden"),
                    resultSet.getInt("idAccion"),
                    resultSet.getString("habilitado")));
                }
                resultSet.close();
            }            
            cs.close();
        } catch (SQLException ex) {
            Logger.getLogger(MenuManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new Listado(lstMenu, total, totalPages);
    }
}
