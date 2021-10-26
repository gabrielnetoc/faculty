/*
 *
 */

package decorator;

import interfaces.IAssinatura;
import java.text.DecimalFormat;

/**
 *
 * @author gabri
 */

public abstract class Pacote implements IAssinatura{

    private IAssinatura pacote;

    public Pacote(IAssinatura pacote) {
        this.pacote = pacote;
    }
    
    @Override
    public double getPrice() {
        return this.pacote.getPrice();
    }

    @Override
    public String getServico() {
        return this.pacote.getServico();
    }

    @Override
    public String getDescricao() {
        return this.pacote.getDescricao();
    }

    @Override
    public String toString() {
        DecimalFormat dF = new DecimalFormat("#.##");
        
        return "Serviços \n" + this.getServico() + " \nPreço: " + dF.format(this.getPrice()) + "\nDescrição: \n" + this.getDescricao();
    }
    
}