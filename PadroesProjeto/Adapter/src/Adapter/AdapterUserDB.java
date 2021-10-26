/*
 *
 */

package Adapter;

import db.DBConnection;
import usersp.Users;

/**
 *
 * @author gabri
 */

public class AdapterUserDB implements Conect{
    
    private Users user;

    public AdapterUserDB(Users user) {
        this.user = user;
    }
    
    @Override
    public void powerOnConnection(DBConnection db) {
        if(db != null){
            System.out.println("Usuário: " + user.getUserName());
            db.onConnection();
        }
    }
    
    @Override
    public void powerOffConnection(DBConnection db) {
        if(db != null){
            db.offConnection();
        }
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

}
