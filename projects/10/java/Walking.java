/* Walking.java provides a Walking subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Walking extends Bird {
    
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Walking() {
		super();
	}

	public Walking(String name) {     
		super(name);
	} 

	/* A Walking's move
	 * Return: a Walking-move ("walked passed").
	 */
	public String move() {
		return "walked passed";
	} 
}
