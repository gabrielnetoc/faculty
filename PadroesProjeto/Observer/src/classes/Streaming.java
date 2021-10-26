/*
 *
 */

package classes;

import interfaces.Observable;
import interfaces.Observer;
import java.util.ArrayList;

/**
 *
 * @author gabri
 */

public class Streaming implements Observable<Observer>{
    private String name;
    private ArrayList<String> content = new ArrayList();
    private ArrayList<Observer> users = new ArrayList();

    public Streaming() {
        this.name = "Netflix+";
    }
    
    public String getName() {
        return name;
    }

    @Override
    public void subscribe(Observer user) {
        users.add(user);
        user.subscriptionService(this);
    }

    @Override
    public void unsubscribe(Observer user) {
        users.remove(user);
        user.deleteSubscriptionService();
    }
    
    @Override
    public void upContent(String conteudo) {
        this.content.add(conteudo);
        this.notification();
    }

    @Override
    public void notification() {
        int index = this.content.size() - 1;
        users.forEach( user -> {
            if(user.getNotify()) 
                user.update(this.content.get(index));
        });
    }
    
    
    
    
}
