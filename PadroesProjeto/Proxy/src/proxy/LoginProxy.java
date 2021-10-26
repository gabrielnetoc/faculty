/*
 *
 */

package proxy;

import interfaces.ILogin;
import real.Login;

/**
 *
 * @author gabri
 */

public class LoginProxy implements ILogin<String>{
    private String email;
    private String password;
    private Login realLogin = null;

    public LoginProxy(String email, String password) {
        this.email = email;
        this.password = password;
    }
    
    private Login createLogin(){
        return new Login(this.email, this.password);
    }

    @Override
    public String display() {
        if(this.realLogin == null){
            this.realLogin = this.createLogin();
        }
        
        return this.realLogin.display();
    }
}
