/*
 *
 */

package db;

import java.sql.Connection;

/**
 *
 * @author gabri
 */

public class Paradox extends DBConnection {

    public Paradox(){
       super("root", "", "url", "com.hxtt.sql.paradox.ParadoxDriver");
    }

    @Override
    public void offConnection() {
        //super.closeConnection(); //To change body of generated methods, choose Tools | Templates.
    
        System.out.println("Conexão encerrada com Paradox!");
    }

    @Override
    public Connection onConnection() {
        //return super.getConnection(); //To change body of generated methods, choose Tools | Templates.
        System.out.println("Conexão iniciada com Paradox!");
        return null;
    }
   
   
}
