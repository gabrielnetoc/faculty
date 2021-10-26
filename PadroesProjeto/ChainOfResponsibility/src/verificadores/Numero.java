/*
 *
 */

package verificadores;

import login.Login;

/**
 *
 * @author Laranja
 */

public class Numero extends Verificador{

    public Numero() {
        super("\\d");
    }
    
    @Override
    public Login handle(Login login) {
        if(match(login.getPassword())){
            super.handle(login);
            return login;
        }
        
        System.out.println("É obrigatorio o uso de número na senha!");
        return super.handle(login);
    }
    
}