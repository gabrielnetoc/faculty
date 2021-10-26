/*
 *
 */

package verificadores;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import login.Login;

/**
 *
 * @author gabri
 */

public class Maiusculo extends Verificador{

    public Maiusculo() {
        super("[A-Z]");
    }
    
    @Override
    public Login handle(Login login) {
        if(match(login.getPassword())){
            super.handle(login);
            return login;
        }
        
        System.out.println("A senah deve conter letras maiúsculas!");
        return super.handle(login);
    }
}