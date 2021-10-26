/*
 *
 */

package instrumento;


/**
 *
 * @author gabri
 */

public class Violao{
    
    private String descricao;
    private String modeloViolao;
    private String tipoCorda;
    private double tamanhoBraco;
    private String tipoTarraxa;
    private String tipoMaterial;
    private double preco;
    
    //Getters

    public String getDescricao() {
        return descricao;
    }

    public String getModeloViolao() {
        return modeloViolao;
    }

    public String getTipoCorda() {
        return tipoCorda;
    }

    public double getTamanhoBraco() {
        return tamanhoBraco;
    }

    public String getTipoTarraxa() {
        return tipoTarraxa;
    }

    public String getTipoMaterial() {
        return tipoMaterial;
    }

    public double getPreco() {
        return preco;
    }
    
    //Setters

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setModeloViolao(String modeloViolao) {
        this.modeloViolao = modeloViolao;
    }

    public void setTipoCorda(String tipoCorda) {
        this.tipoCorda = tipoCorda;
    }

    public void setTamanhoBraco(double tamanhoBraco) {
        this.tamanhoBraco = tamanhoBraco;
    }

    public void setTipoTarraxa(String tipoTarraxa) {
        this.tipoTarraxa = tipoTarraxa;
    }

    public void setTipoMaterial(String tipoMaterial) {
        this.tipoMaterial = tipoMaterial;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }
    
    
    
    //Construtor

    public Violao(String descricao, String modeloViolao, String tipoCorda, double tamanhoBraco, String tipoTarraxa, String tipoMaterial, double preco) {
        this.descricao = descricao;
        this.modeloViolao = modeloViolao;
        this.tipoCorda = tipoCorda;
        this.tamanhoBraco = tamanhoBraco;
        this.tipoTarraxa = tipoTarraxa;
        this.tipoMaterial = tipoMaterial;
        this.preco = preco;
    }
    
    //Construtor Vazio 

    public Violao() {
    }
    
    
    
    public String detalhesProduto() {
        return "\nDescrição: "+this.descricao+ 
                "\nModelo do Violao: "+ this.modeloViolao +
                "\nTipo corda: " + this.tipoCorda + 
                "\nTamanho do braço: " + this.tamanhoBraco + 
                "\nTipo de Taraxa: " + this.tipoTarraxa+ 
                "\nMaterial Corpo: " + this.tipoMaterial+ 
                "\nValor Produto: " + this.preco;
    }

  
}
