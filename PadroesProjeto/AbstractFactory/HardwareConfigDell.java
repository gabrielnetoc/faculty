/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gabri
 */
public class HardwareConfigDell implements Hardware{

    @Override
    public void exibirHardware() {
       System.out.println("ESPECIFICAÇÕES DO DISPOSITIVO\n\t");
       System.out.println("PROCESSADOR: Intel(R) Core(TM) i3-6006U");
       System.out.println("VELOCIDADE PROCESSAMENTO:  2.00GHz");
       System.out.println("RAM: 12,0 GB ");
       System.out.println("ROM: 1 TB SDD");
    }
    
    
    
}
