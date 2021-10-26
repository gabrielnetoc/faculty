/* 
 *
 */

package interfaces;

/**
 *
 * @author gabri
 */
public interface Observable <O> {
    public void subscribe(O user);
    public void unsubscribe(O user);
    public void notification();
    
    public void upContent(String conteudo);
}
