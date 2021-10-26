/*
 *
 */

package singleton;

/**
 *
 * @author gabri
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
       Login user = Login.getInstace("admin", "admin");
        System.out.println(user.logar("admin", "admin"));
        
        Login user2 = Login.getInstace("admin", "admin");
        System.out.println(user2.logar("admin", "admin"));
        
        
        Login user3 = Login.getInstace("vovo", "1234");
        System.out.println(user.logar("vovo", "1234"));
        
                
              

}
}
