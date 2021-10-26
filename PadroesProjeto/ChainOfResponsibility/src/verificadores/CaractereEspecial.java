/*
 *
 */

package verificadores;

import login.Login;

/**
 *
 * @author gabri
 */

public class CaractereEspecial extends Verificador{

    public CaractereEspecial() {
        super("[\\W]");
    }

    @Override
    public Login handle(Login login) {
        if(match(login.getPassword())){
            super.handle(login); 
            return login;
        }
        
        System.out.println("Utilize caractere especial na senha!");
        return super.handle(login);
    }
    
}
