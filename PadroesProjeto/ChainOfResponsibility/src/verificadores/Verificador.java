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

public abstract class Verificador {
 
    protected Verificador nextHandler = null;
    protected Pattern regex;

   
    public Verificador(String  regex) {
        this.regex = Pattern.compile(regex);
    }

    public Verificador() {
    
    }
    
  
    public Verificador setNextHandler(Verificador handler) {
        this.nextHandler = handler;
        return handler;
    }
  
    public Login handle(Login login){
       if(this.nextHandler != null){
           return this.nextHandler.handle(login);
       }
       
       return login;
   }
    
    protected boolean match(String value){
        Matcher match = regex.matcher(value);
        return match.find();
    }
}