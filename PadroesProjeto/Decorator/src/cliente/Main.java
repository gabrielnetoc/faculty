/*
 *
 */

package cliente;

import decorator.Pacote;
import decorator.PacoteI;
import decorator.PacoteII;
import decorator.PacoteIII;
import decorator.PacoteIV;
import java.util.Scanner;
import servicos.Assinatura;
import interfaces.IAssinatura;


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
      
        Pacote pacote = null;
        int escolha;
        
        System.out.println("Deseja fazer assinatura?"
                + "\n0 - Não"
                + "\n1 - Sim");
        System.out.print("escolha: ");
        escolha = scan.nextInt();
        
        if(escolha != 1) System.exit(0);
        
        Assinatura assinatura = new Assinatura();
        
        System.out.println("\n----------------------------");
        System.out.println(assinatura.toString());
        System.out.println("----------------------------\n");
        
        System.out.println("Deseja fazer adesão de pacote? "
                + "\n0 - Não"
                + "\n1 - Sim");
        System.out.print("escolha: ");
        escolha = scan.nextInt();
        
        while(escolha != 0){
            
            System.out.println("Pacotes: "
                + "\n1 - Pacote I - Assistir vídeos em vários dispositivos R$19,99."
                + "\n2 - Pacote II - Frete Grátis em produtos R$9,99."
                + "\n3 - Pacote III - Caixa surpresa com produtos relacionados a filmes e séries R$29,99."
                + "\n4 - Pacote IV - Cartão de crédito Platinum R$49,99.");
            System.out.print("Pacote: ");
            int intPacote = scan.nextInt();
            
            
            if(intPacote > 0 && intPacote < 5){
                if(pacote == null) pacote = escolherPacote(intPacote, assinatura);
                else pacote = escolherPacote(intPacote, pacote);
            }

            System.out.println("\n-------------------------------\n");
            
            System.out.println("Deseja fazer adesão de pacote? "
                + "\n0 - Não"
                + "\n1 - Sim");
            System.out.print("escolha: ");
            escolha = scan.nextInt();
        }
        
        if(pacote != null){
            System.out.println("Seus pacotes esoolhidos\n");
            System.out.println(pacote.toString());
        }
    }
    
    private static Pacote escolherPacote(int pacote, IAssinatura assinatura){
        switch(pacote){
            case 1:
                return new PacoteI(assinatura);
            case 2:
                return new PacoteII(assinatura);
            case 3:
                return new PacoteIII(assinatura);
            case 4:
                return new PacoteIV(assinatura);
        }
        
        return null;
    }

}