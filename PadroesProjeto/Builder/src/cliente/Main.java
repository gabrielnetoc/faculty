package cliente;

import builder.ConcreteBuilder;
import builder.Director;
import instrumento.Violao;
import interfaces.Builder;
import java.util.Scanner;

/*
 *
 */

/**
 *
 * @author gabri
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int escolhaTipo;
        
        System.out.println("Escolha um violão:"
                + "\n1 - Violão Clássico"
                + "\n2 - Violão Folk"
                + "\n3 - Violão Flet"
                + "\n4 - Violao Jumbo"
                + "\n5 - Violão 7 Cordas"
                + "\n6 - Violão 12 Cordas"
                + "\n7 - Violão Zero"
                + "\n8 - Violão Duplo Zero"
                + "\n9 - Violão Triplo Zero");
    
        System.out.print("Escolha um violão: ");
        escolhaTipo = scan.nextInt();
        
        Violao violao = escolherViolao(escolhaTipo);
        
        if(violao == null){
            System.out.println("Opção invalida!");
            System.exit(0);
        }
        
        System.out.println("\n----------------------DETALHES DO PRODUTO----------------------");
        System.out.println(violao.detalhesProduto());
        System.out.println("---------------------------------------------------------------\n");
        
        
        
        
    }
    
    
    //Função privada
    
    private static Violao escolherViolao(int tipoViolao){
        Builder builder;
        
        switch(tipoViolao){
            case 1:
                builder = Director.constructClassico();
                return builder.getViolao();
            case 2: 
                builder = Director.constructFolk();
                return builder.getViolao();
            case 3: 
                builder = Director.constructFlet();
                return builder.getViolao();
            case 4: 
                builder = Director.constructJumbo();
                return builder.getViolao();
            case 5: 
                builder = Director.constructSeteCordas();
                return builder.getViolao();
            case 6:
                builder = Director.constructDozeCordas();
                return builder.getViolao();
            case 7:
                builder = Director.constructZero();
                return builder.getViolao();
            case 8:
                builder = Director.constructDuploZero();
                return builder.getViolao();
            case 9: 
                builder = Director.constructTriploZero();
                return builder.getViolao();
        }
        
        return null;
    }
}
