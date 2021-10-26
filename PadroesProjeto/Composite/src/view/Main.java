/*
 Desenvolva uma aplicação para uma loja de quadrinhos que promove para seus clientes uma caixa de assinatura com diversos itens, 
de acordo com o nível desse cliente.

- Bronze: 3 itens

- Prata: 5 itens

- Ouro: 7 itens

- Platina: 10 itens

Os itens que podem ser incluídos na caixa são: quadrinhos(R$ 15,00), chaveiros(R$ 5,00), bustos(R$ 10,00), adesivos(R$ 1,00), 
posters(R$ 25,00), camisetas(R$ 25,00), canetas(R$ 3,00), miniaturas(R$ 20,00).

Cada caixa pode ter 1 ou mais itens de um mesmo tipo, até o limite de itens de cada caixa de acordo com a categoria do cliente. 
Cada item possui um valor. e são colocados na caixa de maneira aleatória.

Deve ser apresentado os itens presentes em uma caixa, assim como o valor total da caixa.
 */

package view;

import cliente.Cliente;
import cliente.TipoCliente;
import java.util.ArrayList;
import java.util.Random;
import produtos.Produto;

/**
 *
 * @author gabri
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ArrayList<Produto> produtos = new ArrayList<>();
        itens(produtos);
        ArrayList<Cliente> clientes = new ArrayList();
        
        
        //tipos de clientes
        clientes.add(TipoCliente.BRONZE.getCriator());
        clientes.add(TipoCliente.PRATA.getCriator());
        clientes.add(TipoCliente.OURO.getCriator());
        clientes.add(TipoCliente.PLATINA.getCriator());
        
        
        //saida
        clientes.forEach(cliente ->{
           System.out.println("----------------------------------------");
           System.out.println("Cliente Nível: " + cliente.getPlano());
           cliente.getBox().setChildren( 
                escolherItensBox(cliente.getQtdItens(), produtos));
        
            System.out.println("Abrindo box para visualizar a coleção. ");
            cliente.getBox().abrirBox();
            
            System.out.println("\n Valor total do box: " + cliente.getBox().getPrice());
            System.out.println("----------------------------------------\n");
        });         
    }
    
    
    
    //valor de cada item
    private static void itens(ArrayList<Produto> produtos){ 
        
        produtos.add(new Produto("Quadrinhos", 15));
        produtos.add(new Produto("Chaveiros", 5));
        produtos.add(new Produto("Bustos", 10));
        produtos.add(new Produto("Adesivos", 1));
        produtos.add(new Produto("Posters", 25));
        produtos.add(new Produto("Camisetas", 25));
        produtos.add(new Produto("Miniaturas", 20));
        
    }
    
    
    //gerador ramdomico para escolha de itens
    
    private static ArrayList escolherItensBox(int numeroItens, ArrayList produtos){
        Random random = new Random();
        ArrayList array = new ArrayList();
        
        while(numeroItens > 0){
            int item = random.nextInt(7);
            array.add(produtos.get(item));
            numeroItens--;
        }
        
        return array;
    }

}
