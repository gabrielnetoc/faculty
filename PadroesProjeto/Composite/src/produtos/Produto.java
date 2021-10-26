/*
 *
 */

package produtos;

/**
 *
 * @author gabri
 */

public class Produto implements Composite{
    private String name;
    private double valor;

    public Produto(String name, double valor) {
        this.name = name;
        this.valor = valor;
    }
    
    @Override
    public double getPrice() {
        return this.valor;
    }
    

    public String getName() {
        return this.name;
    }
}
