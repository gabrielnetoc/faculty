/* 
 *
 */

package Adapter;

import db.DBConnection;

/**
 *
 * @author gabri
 */
public interface Conect {
    public void powerOnConnection(DBConnection db);
    public void powerOffConnection(DBConnection db);
}
