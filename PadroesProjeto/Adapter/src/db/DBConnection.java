/*
 * O código a seguir mostra de forma simples e rápida como efetuar uma conexão com banco de dados 
 * usando a linguagem de programação Java.
 */

package db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author gabri
 */

public class DBConnection {
    private Connection conect = null;

    private String userNameDB;
    private String passwordDB;
    private String url;
    private String jdbcDriver;

    public DBConnection(String userNameDB, String passwordDB, String url, String jdbcDriver) {
        this.userNameDB = userNameDB;
        this.passwordDB = passwordDB;
        this.url = url;
        this.jdbcDriver = jdbcDriver;
    }
    
    public DBConnection(){
        
    }
    
    public Connection onConnection() {
        try {
          if (conect == null) {
            Class.forName(jdbcDriver);
            conect = DriverManager.getConnection(url, userNameDB, passwordDB);
          } else if (conect.isClosed()) {
            conect = null;
            return onConnection();
          }
        } catch (ClassNotFoundException e) {

      //TODO: use um sistema de log apropriado.

             e.printStackTrace();
        } catch (Exception e) {

      //TODO: use um sistema de log apropriado.

          e.printStackTrace();
        }
        
        return conect;
    }
    
    public void offConnection() {
        if (conect != null) {
            try {
                conect.close();
            } catch (Exception e) {
            //TODO: use um sistema de log apropriado.
                 e.printStackTrace();
            }
        }
    }
}
