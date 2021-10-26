/*
 *
 */

package itarator;

import itarator.Musica;
import itarator.PlayListMusicas;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

/**
 *
 * @author Gabriel
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Random ran = new Random();
        ArrayList<Musica> playList = new ArrayList();
    
        for(int i = 0; i < 6; i++){
            playList.add(new Musica("Música " + (i+1), ran.nextDouble() * 10));
        }
        
        Iterator playListMusicas = new PlayListMusicas(playList);
        
        System.out.println("PlayList:");
        while (playListMusicas.hasNext()) { 
            Musica musica = (Musica) playListMusicas.next();
            System.out.println(musica.getMusica());
        }
        
    }
}