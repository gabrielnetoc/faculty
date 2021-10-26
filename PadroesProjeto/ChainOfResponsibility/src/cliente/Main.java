/*
 *
 */

package cliente;

import java.util.ArrayList;
import java.util.Scanner;
import login.Login;
import verificadores.CaractereEspecial;
import verificadores.Maiusculo;
import verificadores.LoginCadastrado;
import verificadores.Minusculo;
import verificadores.NumerosConsecutivos;
import verificadores.Numero;
import verificadores.TamanhoSenha;

/**
 *
 * @author gabri
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        ArrayList logins = new ArrayList<>();
        
        logins.add(new Login("gabriel@gmail.com", "45ga@Ggaa"));
        logins.add(new Login("gabriel@gmail.com", "45gaGgaa"));
        logins.add(new Login("gabriel@gmail.com", "45gaaaaaaaaa"));
        logins.add(new Login("gabriel@gmail.com", "45ga"));
        
        
        Scanner scan = new Scanner(System.in);
        String email, password;
        
//credencias
        System.out.print("E-mail: ");
        email = scan.next();
        System.out.print("Senha: ");
        password = scan.next();
        
        Login login = new Login(email, password);
        
        LoginCadastrado verificarLogin = new LoginCadastrado(logins);
        verificarLogin
                .setNextHandler(new TamanhoSenha())
                .setNextHandler(new Maiusculo())
                .setNextHandler(new Minusculo())
                .setNextHandler(new Numero())
                .setNextHandler(new NumerosConsecutivos())
                .setNextHandler(new CaractereEspecial());

        
        
        
        
       Login verificado = verificarLogin.handle(login);
        if(verificado != null)
            System.out.println("Login verificado: " + verificado.getEmail());
    }
}


/*logins.add(new Login("email", "senha"));*/