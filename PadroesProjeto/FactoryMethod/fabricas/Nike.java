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

public class Nike implements Fabrica{

    @Override
    public Produto factoryMethod() {
        return new CamisaEsportiva("Brasil");
    }

}
