/*
 *
 */

package servicos;

import interfaces.IAssinatura;

/**
 *
 * @author gabri
 */

public class Assinatura implements IAssinatura{

    private String name;
    private double price;
    private String descricao;
    
    public Assinatura() {
        this.name = "Assinatura Base";
        this.price = 9.99;
        this.descricao = " - Assistir vídeos num único dispositivo";
    }
    
    @Override
    public double getPrice() {
        return this.price;
    }

    @Override
    public String getServico() {
        return this.name;
    }    

    @Override
    public String getDescricao() {
        return this.descricao;
    }

    @Override
    public String toString() {
        return this.name + "\nR$" + this.price + "\n" + this.descricao;
    }
    
}