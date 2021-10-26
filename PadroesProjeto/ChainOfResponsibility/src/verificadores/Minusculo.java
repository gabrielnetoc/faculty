/*
 *
 */

package verificadores;

import java.util.function.IntPredicate;
import login.Login;

/**
 *
 * @author gabri
 */

public class Minusculo extends Verificador{

    public Minusculo() {
        super("[a-z]");
    }
    
    public Login handle(Login login) {

        if(match(login.getPassword())){
            super.handle(login);
            return login;
        }
        
        System.out.println("A senha deve possuir letras minusculas!");
        return super.handle(login);
    }
}