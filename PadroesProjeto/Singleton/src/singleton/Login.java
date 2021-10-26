/*
 *
 */

package singleton;

/**
 *
 * @author gabri
 */

public class Login {
    private static String nickaname;
    private static String password;
    private static Login unique;
    private boolean loginState;
    
    
    //instancia de limitação de uma unico login
    
    public static Login getInstace(String nickaname, String password){ 
        if(unique == null){
            synchronized (Login.class){
                if(unique == null){
                    unique = new Login();
                    Login.nickaname = nickaname;
                    Login.password = password;
                }
            }

        }
        
        return unique;
    }
    
    //função de login
    
    public String logar (String nickaname, String senha){
        boolean user = (this.nickaname.equals(nickaname) && this.password.equals(senha));
        if(user && !loginState){
            setStatus();
            return "Login sucess";
        } else if(user && loginState){
            return "login já em execução";
        }
        return "Senha e/ou usuario incorretos";
    }
    
    public void logout(){
        setStatus();
    }
    
    private void setStatus(){
        loginState = !loginState;
    }
}
