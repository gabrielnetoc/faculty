/*
 *
 */

package db;

import java.sql.Connection;

/**
 *
 * @author gabri
 */

public class Firebird extends DBConnection{

    public Firebird() {
        super("root", "", "url", "org.firebirdsql.jdbc.FBDriver");
    }

    @Override
    public void offConnection() {
        //super.closeConnection(); //To change body of generated methods, choose Tools | Templates.
        System.out.println("Conexão encerrada com o Firebird!");
    }

    @Override
    public Connection onConnection() {
        //return super.getConnection(); //To change body of generated methods, choose Tools | Templates.
        System.out.println("Conexão iniciada com o Firebird!");
        return null;
    }
}
