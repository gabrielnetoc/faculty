/*
 *
 */

package builder;

import instrumento.Violao;
import interfaces.Builder;

/**
 *
 * @author gabri
 */

public class ConcreteBuilder implements Builder{

    protected Violao violao = new Violao();
    
    @Override
    public Violao onViolao(String descricao, String modeloViolao, String tipoCorda, double tamanhoBraco, String tipoTarraxa, String tipoMaterial, double preco) {
        this.violao = new Violao(descricao, modeloViolao, tipoCorda, tamanhoBraco, tipoTarraxa, tipoMaterial, preco);
        return this.violao;
    }

    
    @Override
    public Violao getViolao() {
        return violao;
    }
}
