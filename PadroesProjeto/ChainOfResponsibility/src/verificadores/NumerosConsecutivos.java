/*
 *
 */

package verificadores;

import login.Login;

/**
 *
 * @author gabri
 */

public class NumerosConsecutivos extends Verificador{

    public NumerosConsecutivos() {
        super("\\d{3,}");
    }

    @Override
    public Login handle(Login login) {
        if(!match(login.getPassword())){
            super.handle(login);
            return login;
        }
        
        System.out.println("A senha não pode ter mais de 3 números consecutivos!");
        return super.handle(login);
    }
}