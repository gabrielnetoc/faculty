/*
 *
 */

package agencia;

/**
 *
 * @author Laranja
 */

public class AluguelCarro {
    private String modelo;
    private double valorDiaria;

    public AluguelCarro() {
        this.modelo = "Jeep Renegade";
        this.valorDiaria = 400;
    }

    @Override
    public String toString() {
        return "DADOS DA LOCAÇÃO\nModelo: " + this.modelo + "\nValor diaria: " + this.valorDiaria ;
    }
    
  
    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public double getValorDiaria() {
        return valorDiaria;
    }

    public void setValorDiaria(double valorDiaria) {
        this.valorDiaria = valorDiaria;
    }   
    
    /* public AluguelCarroSimples() {
        this.modelo = "BMW V8";
        this.valorDiaria = 542;
    }
     
     
      public AluguelCarroPrata() {
        this.modelo = "UNO";
        this.valorDiaria = 300;
    }
      
      
       public AluguelCarroGold() {
        this.modelo = "FERRARI";
        this.valorDiaria = 2000;
    }*/
}