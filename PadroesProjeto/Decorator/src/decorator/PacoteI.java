/*
 *
 */

package decorator;

import interfaces.IAssinatura;

/**
 *
 * @author gabri
 */

public class PacoteI extends Pacote{

    public PacoteI(IAssinatura iPrduct) {
        super(iPrduct);
    }

    @Override
    public String getServico() {
        return super.getServico() + "\nPacote 1";
    }

    @Override
    public double getPrice() {
        return super.getPrice() + 19.99;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + "\n - Vídeos em vários dispositivos.";
    }

}