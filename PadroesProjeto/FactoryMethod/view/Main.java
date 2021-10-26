/*
 *
 */

package view;


import produto.Produto;
import fabricas.Fabrica;
import fabricas.Adidas;
import fabricas.Kappa;
import fabricas.Nike;
import fabricas.Puma;
import fabricas.Umbro;
import java.util.Scanner;


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
        
        
        
        System.out.println("Escolha uma Fabrica: \n" + 
                           "1 - Nike\n" +
                           "2 - Adidas\n" +
                           "3 - Puma\n" +
                           "4 - Umbro\n" +
                           "5 - Kappa\n\n" +
                           "Fabrica: ");
        
        int fabrica = scan.nextInt();
        
        System.out.println("--------------------------");
        
        
        
        Fabrica gerar= escolherFabrica(fabrica);
        
        if(gerar != null) {
            Produto product = gerar.factoryMethod();
            product.camisaEsportiva(gerar.getClass().getSimpleName());
            
        } else
            System.out.println("Opção inválida! Fábrica não existe");
    }

    private static Fabrica escolherFabrica(int fabrica) {
        switch(fabrica){
            case 1:
                return new Nike();
            case 2:
                return new Adidas();
            case 3:
                return new Puma();
            case 4:
                return new Umbro();
            case 5:
                return new Kappa();
            default:
                return null;
        }
    }

}

