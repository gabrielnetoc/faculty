/*
 *
 */

package fabricaInstrumentos;

import interfaces.CloneViolao;


/**
 *
 * @author gabri
 */

public class Violao implements CloneViolao{
    
    private String tipoViolao;
    private String descricao;;

    public Violao(String tipoViolao, String descricao) {
        this.tipoViolao = tipoViolao;
        this.descricao = descricao;
    }    
    
    public Violao(Violao violao) {
        this.tipoViolao = violao.tipoViolao;
        this.descricao = violao.descricao;
    }
    
    @Override
    public Violao clone(){
        return new Violao(this);
    }

    @Override
    public String toString() {
        return "Violão: " + this.tipoViolao + "\nDescrição: " + this.descricao;
    }
  
    public String getTipoViolao() {
        return tipoViolao;
    }

    public void setTipoViolao(String tipoViolao) {
        this.tipoViolao = tipoViolao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
   
    
}