/*
 *
 */

package produto;

/**
 *
 * @author gabri
 */

public class CamisaEsportiva implements Produto{

    private String time;
    
    public CamisaEsportiva(String time){
        this.time = time;
    }
    
    @Override
    public void camisaEsportiva(String fabrica) {
        System.out.println("Você escolheu a fabrica "+ fabrica +" que produz camisas esportivas do " + this.time);
    }

}
