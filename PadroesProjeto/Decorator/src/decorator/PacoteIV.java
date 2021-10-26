/*
 *
 */

package decorator;

import interfaces.IAssinatura;

/**
 *
 * @author gabri
 */

public class PacoteIV extends Pacote{

    public PacoteIV(IAssinatura pacote) {
        super(pacote);
    }

    @Override
    public String getServico() {
        return super.getServico() + "\nPacote 4";
    }

    @Override
    public double getPrice() {
        return super.getPrice() + 49.99;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + "\n - Cartão de crédito Platinum.";
    }
    
}