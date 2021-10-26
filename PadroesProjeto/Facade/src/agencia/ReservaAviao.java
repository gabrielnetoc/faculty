/*
 *
 */

package agencia;


/**
 *
 * @author gabri
 */

public class ReservaAviao extends Reserva{
    private String nomeCompanhia;

    public ReservaAviao(String data) {
        super(data, 122);
        this.nomeCompanhia = "GOL";
    }
    
     @Override
    public String toString() {
        return "\nDADOS DO VÔO \nAgência:" + this.getNomeCompanhia()+ " \nValor da Passagem: " + this.getValor();
    }

    public String getNomeCompanhia() {
        return nomeCompanhia;
    }

    public void setNomeCompanhia(String nomeCompanhia) {
        this.nomeCompanhia = nomeCompanhia;
    }
}