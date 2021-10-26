/*
 *
 */

package agencia;


/**
 *
 * @author gabri
 */

public class ReservaHotel extends Reserva{
    private String nomeHotel;
    private int qtdDias;

    public ReservaHotel(String data, int qtdDias) {
        super(data, 365);
        this.nomeHotel = "RIO PLAZA RESORTS";
        this.qtdDias = qtdDias;
    }

    @Override
    public String toString() {
        return "\nDADOS DA HOSPEDAGEM\nNome do Hotel:" + this.getNomeHotel() + " \nQuantidade dias: " + this.getQtdDias() + " \nValor da diaria: " + this.getValor();
    }

  
    public String getNomeHotel() {
        return nomeHotel;
    }

    public void setNomeHotel(String nomeHotel) {
        this.nomeHotel = nomeHotel;
    }

    public int getQtdDias() {
        return qtdDias;
    }

    public void setQtdDias(int qtdDias) {
        this.qtdDias = qtdDias;
    }

    
   /* public void calculaDias(){
        calcular o valor total da reserva
    }*/
    
}
