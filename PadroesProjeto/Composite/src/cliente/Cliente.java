/*
 *
 */

package cliente;

import produtos.Box;

/**
 *
 * @author gabri
 */

public class Cliente {
    private String plano;
    private int qtdItens;
    private Box box = new Box();
    
    public Cliente(String plano, int qtdItens) {
        this.plano = plano;
        this.qtdItens = qtdItens;
    }
    

    public String getPlano() {
        return plano;
    }

    public int getQtdItens() {
        return qtdItens;
    }

    public Box getBox() {
        return box;
    }
}