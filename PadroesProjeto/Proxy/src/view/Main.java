/*
 *
 */

package view;

import interfaces.ILogin;
import proxy.LoginProxy;

/**
 *
 * @author gabri
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        ILogin inLogin = new LoginProxy("admin","admin");
        
        System.out.println(inLogin.display());
        
        
    }

}
