/*
 *
 */

package builder;

import interfaces.Builder;

/**
 *
 * @author gabri
 */

public class Director {
    
    private static Builder builder = new ConcreteBuilder();
    
    public static Builder constructClassico(){
        Director.builder.onViolao("O violão clássico é um modelo acústico e funciona com seis cordas (na maioria das vezes, feitas de nylon).","Classico", "Nylon", 27.5, "Aberta", "Madeira", 856.66 );
        return builder;
    }
    
   public static Builder constructFolk(){
        Director.builder.onViolao("Com o corpo maior e mais “acinturado”, os violões do tipo folk também são bastante populares entre os músicos.","Folk", "Aço", 29.5, "Blindadas", "Madeira", 1659.99);
        return builder;
    }
    
    public static Builder constructFlet(){
        Director.builder.onViolao(" A palavra flat, do inglês, pode significar “plano” ou “liso”. É justamente essa a principal característica desse tipo de violão: sua caixa acústica é bastante fina! .","Flet", "Nylon", 25, "Com trava", "Madeira", 1999.66 );
        return builder;
    }
    
    public static Builder constructJumbo(){
        Director.builder.onViolao("O violão jumbo ficou famoso nas mãos de Elvis Presley, mas, apesar de ser bem parecido com o tipo clássico, a grande diferença está em seu corpo mais largo e na base mais arredondada. .","Jumbo", "Aço", 27.5, "Com trava", "Madeira", 23365.96 );
        return builder;
    }
    
    public static Builder constructSeteCordas(){
        Director.builder.onViolao("onhecido como o violão brasileiro, já que é indicado para acompanhar gêneros como o choro e o samba, esse tipo de violão não apresenta diferenças na sua estrutura quando comparado ao violão clássico..","7 Cordas", "Aço", 27.5, "Blindadas", "Madeira", 5698.66);
        return builder;
    }

    public static Builder constructDozeCordas(){
        Director.builder.onViolao("Outro tipo de violão que também não apresenta diferenças na estrutura, o violão 12 cordas traz o dobro de cordas do que o clássico. Essas são agrupadas em duplas (metade delas afinadas com uma oitava acima). ","12 Cordas", "Aço", 27.5, "Blindadas", "Madeira", 6985.66 );
        return builder;
    }
    
    public static Builder constructZero(){
        Director.builder.onViolao("Esses tipos de violões são categorizados como Parlor, com estruturas menores e sendo mais indicado para uso casual e não tanto profissional. Entre os três tipos, o violão zero é o menor, com uma estrutura confortável para tocar por bastante tempo. ","Zero", "Aço", 27.5, "Aberta", "Madeira", 1265.54);
        return builder;
    }
    
    public static Builder constructDuploZero(){
        Director.builder.onViolao("Esses tipos de violões são categorizados como Parlor, com estruturas menores e sendo mais indicado para uso casual e não tanto profissional. Entre os três tipos, o violão  duplo zero é um pouco maior, apresentando uma boa sonoridade e sendo indicado para técnicas de fingerstyle.  ","Zero Duplo", "Aço", 27.5, "Aberta", "Madeira", 1865.54);
        return builder;
    }
    
    public static Builder constructTriploZero(){
        Director.builder.onViolao("Esses tipos de violões são categorizados como Parlor, com estruturas menores e sendo mais indicado para uso casual e não tanto profissional. Entre os três tipos, o violão  triplo zero possui tamanho intermediário e gera um timbre mais peculiar.","Zero Triplo", "Aço", 27.5, "Aberta", "Madeira", 2565.54);
        return builder;
    }
}
