/*
 *
 */

package agencia;

/**
 *
 * @author gabri
 */

public class Pagamento {
    private String formaPagamento;

    public Pagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }
    
  
    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }
}