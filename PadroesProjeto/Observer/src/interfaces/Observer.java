/* 
 *
 */

package interfaces;

/**
 *
 * @author gabri
 */
public interface Observer <O> {
    public void update(String up);
    public void subscriptionService(O service);
    public boolean getNotify();
    
    public void deleteSubscriptionService();
}
