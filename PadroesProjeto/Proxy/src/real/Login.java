/*
 *
 */

package real;

import interfaces.ILogin;

/**
 *
 * @author gabri
 */

public class Login implements ILogin<String>{
    private String email;
    private String password;

    public Login(String email, String password) {
        this.email = email;
        this.password = password;
    }

    @Override
    public String display() {
        return "Login on: " + this.email;
    }
}