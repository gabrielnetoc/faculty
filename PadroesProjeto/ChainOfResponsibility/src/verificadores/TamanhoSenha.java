/*
 *
 */

package verificadores;

import login.Login;

/**
 *
 * @author gabri
 */

public class TamanhoSenha extends Verificador{

    @Override
    public Login handle(Login login) {
        String senha = login.getPassword();
        
        if(senha.length() >= 8 && senha.length() <= 16){
            super.handle(login);
            return login;
        }
        
        System.out.println("A senha é maior que 16 digitos e/ou menor que 8 digitos!");
        return super.handle(login);
    }
    
}