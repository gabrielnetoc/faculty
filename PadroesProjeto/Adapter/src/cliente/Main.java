/*
 *
 */

package cliente;

import Adapter.AdapterUserDB;
import db.DBConnection;
import db.Firebird;
import db.MySql;
import db.Paradox;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import usersp.MultiUser;
import usersp.MultiUserMulti;
import usersp.SingleUser;
import usersp.Users;
import Adapter.Conect;

/**
 *
 * @author gabri*/
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        ArrayList<Users> users = new ArrayList<>();
        Map<String, DBConnection> mapDB = new HashMap<String, DBConnection>();
        
        //usuarios
        
        users.add(new SingleUser("admin", "admin"));
        users.add(new MultiUser("admin2", "admim2"));
        users.add(new MultiUserMulti("admin3", "admin3"));
        
        
        //bd
        mapDB.put(SingleUser.class.toString(), new Paradox());
        mapDB.put(MultiUser.class.toString(), new Firebird());
        mapDB.put(MultiUserMulti.class.toString(), new MySql());
        
        
        
        users.forEach(user -> {
            Conect adapter = new AdapterUserDB(user);
            DBConnection db = mapDB.get(user.getClass().toString());
            
            System.out.println("\n----------------------------");
            
            if(adapter != null){
                adapter.powerOnConnection(db);
                adapter.powerOffConnection(db);
            }
            
            System.out.println("----------------------------");
        });
    }

}
