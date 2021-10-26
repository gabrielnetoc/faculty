/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gabri
 */
public class HardwareConfigSam implements Hardware{

    @Override
    public void exibirHardware() {
       System.out.println("ESPECIFICAÇÕES DO DISPOSITIVO\n\t");
       System.out.println("PROCESSADOR: Intel(R) Core(TM) i5-5200UU");
       System.out.println("VELOCIDADE PROCESSAMENTO:  2.70GHz");
       System.out.println("RAM: 8,0 GB ");
       System.out.println("ROM: 500 GB SDD");
       System.out.println("VIDEO: NVIDIA® GeForce® 910M Graphics");
    }
    
    
    
}
