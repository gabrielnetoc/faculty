/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gabri
 */
public class FabricaDell implements FabricaNotebooks{
    //SoftwarePre softPre;
    HardwareConfigDell hc;
    Linux sisOp;
    
    
    public FabricaDell()
    {
    this.hc = (HardwareConfigDell) this.criarHardware();
    this.sisOp = (Linux) this.criarSO();
    //this.softPre = this.instalarProgramas();
    this.config();

    }
    
    
    void config(){
        System.out.println("CONFIGURAÇÕES GERAIS NOTEBOOK DELL \n\t");
        System.out.println("MARCA: DELL INC.");
        System.out.println("MODELO:  INSPIRON\n\t");
        this.sisOp.exibirSO();
        this.hc.exibirHardware();
        System.out.println("*******************************************************************");
        System.out.println("\n\t");
        
        
        
    }
    
    
    
    @Override
    public SistemaOperacional criarSO() {
        return new Linux();
    }

    @Override
    public Hardware criarHardware() {
       return new HardwareConfigDell();
    }
    
}
