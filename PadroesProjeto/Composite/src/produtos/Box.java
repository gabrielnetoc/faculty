/*
 *
 */

package produtos;

import java.util.ArrayList;

/**
 *
 * @author gabri
 */

public class Box implements Composite{

    private ArrayList<Composite> children = new ArrayList<>();
    
    @Override
    public double getPrice() {
        double soma = 0;
        
        for(Composite item : this.children){
            soma += item.getPrice();
        }
        
        return soma; 
    }
    
    public void abrirBox(){
        this.children.forEach(item ->{
            if(item.getClass().equals(Produto.class)){
                Produto produto = (Produto) item;
                System.out.println("\nItem: " + produto.getName() + "\n Valor: R$ " + produto.getPrice());
            }
        });
    }
    
    public void add(Composite item){
        this.children.add(item);
    }
    
    public void remove(Composite item){
        this.children.remove(item);
    }

 
    
    public void setChildren(ArrayList<Composite> children) {
        this.children = children;
    }
}
