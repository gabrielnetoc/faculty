/*
 *
 */

package cliente;

import classes.Streaming;
import classes.User;

/**
 *
 * @author gabri
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Streaming service = new Streaming();
       
        
        User userOne = new  User ("User1", "user1@hot.com"); 
        User user2 = new  User ("User2", "user2@hot.com"); 
        User user3 = new  User ("User3", "user3@hot.com"); 
        User user4 = new  User ("User4", "user4@hot.com"); 
        User user5 = new  User ("User5", "user5@hot.com"); 
        
        
        service.subscribe(user5);
        service.subscribe(user4);
        service.subscribe(user3);
        service.subscribe(user2);
        service.subscribe(userOne);
        
        service.upContent("Filme: Guerra Mundial Z");
        userOne.setNotify();
        System.out.println("User3: "+user3.getService().getName());
        service.unsubscribe(user2);
        
        
        
    }
}