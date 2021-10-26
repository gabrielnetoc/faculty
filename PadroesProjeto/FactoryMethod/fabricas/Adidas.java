/*
 *
 */

package fabricas;

import produto.CamisaEsportiva;
import produto.Produto;

/**
 *
 * @author gabri
 */

public class Adidas implements Fabrica{

    @Override
    public Produto factoryMethod() {
        return new CamisaEsportiva("Flamengo");
    }
}
