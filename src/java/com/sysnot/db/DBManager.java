/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sysnot.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author sderan
 */
public class DBManager {
    private static InitialContext initialContext;
     private static Context context;
     private static DataSource dataSourcePool;
     private static Connection connection;
     
     private static void init(){
         try {
             initialContext = new InitialContext();
             context = (Context) initialContext.lookup("java:comp/env");
             dataSourcePool = (DataSource) context.lookup("connpool");
             try {
                 connection = dataSourcePool.getConnection();
             } catch (SQLException ex) {
                 Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
             }
             
         } catch (NamingException ex) {
             Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
         }         
     }
     
     public static Connection getConnection(){
         init();
         return connection;
     }
     
     public static void closeConnection(){
         if(connection!=null){
             try {
                 connection.close();
             } catch (SQLException ex) {
                 Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
             }
         }
     }

}
