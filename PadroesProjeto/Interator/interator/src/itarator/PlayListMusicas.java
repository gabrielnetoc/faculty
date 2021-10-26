/*
 *
 */

package itarator;

import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Gabriel
 */

public class PlayListMusicas implements Iterator{

	private ArrayList<Musica> playList;
	private int posicao = 0;

	public PlayListMusicas(ArrayList<Musica> playList) {
		this.playList = playList;
	}

	public Musica next() {
            Musica musica = playList.get(posicao);
            posicao++;
            return musica;
	}

	public boolean hasNext() {
            if (posicao >= playList.size() || playList.get(posicao) == null) {
                return false;
            }
            
            return true;
	}

}
