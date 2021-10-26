/*
 *
 */

package cliente;

import facade.PacoteViagemAerea;


/**
 *
 * @author gabri
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        PacoteViagemAerea facade = new PacoteViagemAerea();
        
        facade.cadastrarUsuario();
        System.out.println("---------------");
        facade.formaPagamento();
        System.out.println("---------------");
        facade.alugarCarro();
        System.out.println("---------------");
        facade.reservarAviao();
        System.out.println("---------------");
        facade.reservarHotel();
        System.out.println("---------------");
        facade.reservaConcluida();
    }
}