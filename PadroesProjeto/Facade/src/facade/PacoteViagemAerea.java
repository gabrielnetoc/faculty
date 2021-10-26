/*
 *
 */

package facade;

import agencia.AluguelCarro;
import agencia.Cliente;
import agencia.Pagamento;
import agencia.ReservaAviao;
import agencia.ReservaHotel;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author gabri
 */

public class PacoteViagemAerea {
    private Cliente cliente;
    private AluguelCarro aluguelCarro;
    private ReservaAviao reservaAviao;
    private ReservaHotel reservaHotel;
    private ArrayList<Pagamento> pagamento;
    
    public void cadastrarUsuario(){
        if(this.cliente == null){
            System.out.println("Dados do Usuário");
            Scanner scan = new Scanner(System.in);
        
            System.out.print("Nome do cliente: ");
            String nome = scan.nextLine();
            System.out.print("CPF do cliente: ");
            String cpf = scan.nextLine();

            this.cliente = new Cliente(nome, cpf);
        } else{
            System.out.println("ERRO: Verifique os dados solicitados!");
        }
    }
    
    public void formaPagamento(){
        Scanner scan = new Scanner(System.in);
        
        System.out.print("Forma de pagamento: ");
        String formaPagamento = scan.nextLine();
        
        this.pagamento = new ArrayList<>();
        
        this.pagamento.add(new Pagamento(formaPagamento));
    }
    
    public void alugarCarro(){
        if(this.aluguelCarro == null && this.pagamento != null && this.cliente != null){
            this.aluguelCarro = new AluguelCarro();
            System.out.println("Carro Alugado!");
        } else if(this.aluguelCarro != null){
            System.out.println("Já possui carro alugado! \n" + this.aluguelCarro.toString());
        } else{
            System.out.println("ERRO: Verifique os dados solicitados");
        }
    }
    
    public void reservarHotel(){
        if(this.reservaHotel == null && this.pagamento != null && this.cliente != null){
            System.out.println("Dados da Reserva do Hotel ");
            Scanner scan = new Scanner(System.in);
            
            System.out.print("Data inicio reserva: ");
            String data = scan.nextLine();
            
            System.out.print("Quantidade dias: ");
            int dias = scan.nextInt();
            this.reservaHotel = new ReservaHotel(data, dias);
            System.out.println(this.reservaHotel.toString());
        } else if(this.reservaHotel != null){
            System.out.println("Já Hotel Reservado! \n" + this.reservaHotel.toString());
        } else{
            System.out.println("ERRO: Verifique os dados solicitados");
        }
    }
    
    public void reservarAviao(){
        if(this.reservaAviao == null && this.pagamento != null && this.cliente != null){
            System.out.println("Dados da Reserva do Vôo: ");
            Scanner scan = new Scanner(System.in);
            
            System.out.print("Data reserva: ");
            String data = scan.nextLine();
            
            this.reservaAviao = new ReservaAviao(data);
            System.out.println(this.reservaAviao.toString());
        } else if(this.reservaAviao != null){
            System.out.println("Passagem já feita! \n" + this.reservaAviao.toString());
        } else{
            System.out.println("ERRO: Verifique os dados solicitados");
        }
    }
    
    public void reservaConcluida(){
        if(this.aluguelCarro != null
                && this.cliente != null
                && this.pagamento != null
                && this.reservaAviao != null
                && this.reservaHotel != null){
            System.out.println("A reserva foi concluida com sucesso!\n\nConfira os dados abaixo:\n");
            System.out.println("Nome: " + this.cliente.getNome());
            System.out.println("CPF: " + this.cliente.getCpf());
         //   System.out.println("Forma de Pagamento:");
            System.out.println("Carro alugado: " + this.aluguelCarro.getModelo());
            System.out.println("Vôo Agendado: " + this.reservaAviao.getData());
            System.out.println("Companhia: " + this.reservaAviao.getNomeCompanhia());
             System.out.println("Hotel Agendado: " + this.reservaHotel.getData());
             System.out.println("Nome do hotel: " + this.reservaHotel.getNomeHotel());
        } else{
            System.out.println("ERRO: Verifique os dados solicitados!");
        }
    }
    

    public Cliente getCliente() {
        if(this.cliente != null){
            return cliente;
        }
        return null;
    }

    public AluguelCarro getAluguelCarro() {
        if(this.aluguelCarro != null){
            return aluguelCarro;
        }
        return null;
    }

    public ReservaAviao getReservaAviao() {
        if(this.reservaAviao != null){
            return reservaAviao;
        }
        return null;
    }

    public ReservaHotel getReservaHotel() {
        if(this.reservaHotel != null){
            return reservaHotel;
        }
        return null;
    }

    public ArrayList<Pagamento> getPagamento() {
        if(this.pagamento != null){
            return pagamento;
        }
        return null;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public void setAluguelCarro(AluguelCarro aluguelCarro) {
        this.aluguelCarro = aluguelCarro;
    }

    public void setReservaAviao(ReservaAviao reservaAviao) {
        this.reservaAviao = reservaAviao;
    }

    public void setReservaHotel(ReservaHotel reservaHotel) {
        this.reservaHotel = reservaHotel;
    }

    public void setPagamento(ArrayList<Pagamento> pagamento) {
        this.pagamento = pagamento;
    }
    
    
}