/*
 *
 */

package db;

import java.sql.Connection;


/**
 *
 * @author gabri
 */

public class MySql extends DBConnection{

    public MySql() {
        super("root", "", "url", "com.mysql.jdbc.Driver");
    }    

    @Override
    public void offConnection() {
        //super.closeConnection(); //To change body of generated methods, choose Tools | Templates.
        System.out.println("Conexão encerrada com MySQL! ");
    }

    @Override
    public Connection onConnection() {
        //return super.getConnection(); //To change body of generated methods, choose Tools | Templates.
        System.out.println("Conexão iniciada com MySQL!");
        return null;
    }
    
    
}
