/*
 *
 */

package itarator;

import java.text.DecimalFormat;

/**
 *
 * @author Gabriel
 */

public class Musica {
    private String nome;
    private double duracao;

    public Musica(String nome, double duracao) {
        this.nome = nome;
        this.duracao = duracao;
    }

    public String getMusica() {
        DecimalFormat duasCasas = new DecimalFormat("#.##");
        return this.nome + " - Duração: " + duasCasas.format(this.duracao);
    }
    
}
