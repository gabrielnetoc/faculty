package cliente;

import fabricaInstrumentos.Violao;
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
        Scanner scanner = new Scanner(System.in);
        
        int violao;
        
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
    
        System.out.print("Violão: ");
        violao = scanner.nextInt();
        
        if(violao > 9 || violao < 1){
            System.out.println("Opção inválida!");
            System.exit(0);
        }
        
        Violao violaoClassico = new Violao("Classico", "O violão clássico é um modelo acústico e funciona com seis cordas (na maioria das vezes, feitas de nylon). Além da facilidade em encontrar esse modelo, ele possui um custo mais baixo quando comparado aos outros tipos, e também é indicado para iniciantes graças à sua leveza e maciez.");
        Violao clone = violaoClassico.clone();
        
        switch(violao){
            case 1:
              //O clone é de um violao classico em primeiro momento, então n é necessário   
               break;
            case 2: 
                clone.setTipoViolao("Folk");
                clone.setDescricao("Com o corpo maior e mais “acinturado”, os violões do tipo folk também são bastante populares entre os músicos. A maioria dos modelos desse tipo de violão funciona com a utilização de cordas de aço, podendo ser elétricos ou eletroacústicos. Esse tipo de violão é o mais indicado para gêneros como pop e rock, já que gera um som mais encorpado, com timbre diferenciado.");
                break;
            case 3: 
                clone.setTipoViolao("Flet");
                clone.setDescricao("A palavra flat, do inglês, pode significar “plano” ou “liso”. É justamente essa a principal característica desse tipo de violão: sua caixa acústica é bastante fina! O violão flet é muito utilizado por músicos profissionais e na maioria dos casos é tocado com cordas de nylon. O timbre gerado por esse tipo de violão é mais suave. Vale lembrar que, por ser encontrado quase sempre em modelos elétricos, precisa de amplificação.");
                break;
            case 4:
                clone.setTipoViolao("Jumbo");
                clone.setDescricao("O violão jumbo ficou famoso nas mãos de Elvis Presley, mas, apesar de ser bem parecido com o tipo clássico, a grande diferença está em seu corpo mais largo e na base mais arredondada. É mais fácil de encontrar modelos eletroacústicos e com cordas de aço. O som gerado pelo violão jumbo é mais grave e encorpado.");
                break;
            case 5:
                clone.setTipoViolao("7 Cordas");
                clone.setDescricao("Conhecido como o violão brasileiro, já que é indicado para acompanhar gêneros como o choro e o samba, esse tipo de violão não apresenta diferenças na sua estrutura quando comparado ao violão clássico. Porém seu diferencial está na sétima corda, que costuma ser afinada de maneira mais grave que as outras seis. Isso exige um conhecimento do músico que for tocá-lo.");
                break;
            case 6:
                clone.setTipoViolao("12 Cordas");
                clone.setDescricao("Outro tipo de violão que também não apresenta diferenças na estrutura, o violão 12 cordas traz o dobro de cordas do que o clássico. Essas são agrupadas em duplas (metade delas afinadas com uma oitava acima). Esse tipo apresenta ressonância plena e exige técnica e prática para poder pressionar duas cordas simultaneamente.");
                break;
            case 7, 8, 9:
              //Independe de qual seja o tipo de violão zero escolhido ele vai receber esse trecho da descrição  
                clone.setDescricao("Categorizado como Parlor, com estruturas menores e sendo mais indicado para uso casual e não tanto profissional.");
                
                if(violao == 7){
                    clone.setTipoViolao("Zero");
                    clone.setDescricao(clone.getDescricao() + " O violão zero é o menor, com uma estrutura confortável para tocar por bastante tempo");
                } else if(violao == 8){
                    clone.setTipoViolao("Duplo Zero");
                    clone.setDescricao(clone.getDescricao() + " O duplo zero é um pouco maior, apresentando uma boa sonoridade e sendo indicado para técnicas de fingerstyle");
                } else if(violao == 9){
                    clone.setTipoViolao("Triplo Zero");
                    clone.setDescricao(clone.getDescricao() + " O triplo zero possui tamanho intermediário e gera um timbre mais peculiar.");
                }
                break;
        }
        
        System.out.println(clone.toString()); 
    }
}
