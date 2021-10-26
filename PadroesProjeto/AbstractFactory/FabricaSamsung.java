/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gabri
 */
public class FabricaSamsung implements FabricaNotebooks{
    //SoftwarePre softPre;
    HardwareConfigSam hc;
    Windows sisOp;
    
    
    public FabricaSamsung()
    {
    this.hc = (HardwareConfigSam) this.criarHardware();
    this.sisOp = (Windows) this.criarSO();
    //this.softPre = this.instalarProgramas();
    this.config();

    }
    
    
    void config(){
        System.out.println("CONFIGURAÇÕES GERAIS NOTEBOOK SAMSUNG \n\t");
        System.out.println("MARCA: SAMSUNG INC.");
        System.out.println("MODELO:  EXPERT \n\t");
        this.sisOp.exibirSO();
        this.hc.exibirHardware();
        System.out.println("*******************************************************************");
        System.out.println("\n\t");
        
        
    }
    
    
    
    @Override
    public SistemaOperacional criarSO() {
        return new Windows();
    }

    @Override
    public  Hardware criarHardware() {
       return new HardwareConfigSam();
    }
    
}
