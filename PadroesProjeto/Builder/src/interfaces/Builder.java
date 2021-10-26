/* 
 *
 */

package interfaces;

import instrumento.Violao;

/**
 *
 * @author gabri
 */
public interface Builder {
    public Violao onViolao(String descricao, String modeloViolao, String tipoCorda, double tamanhoBraco, String tipoTarraxa, String tipoMaterial, double preco);
    public Violao getViolao();
}
