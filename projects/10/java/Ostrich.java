/* Ostrich.java provides a Ostrich subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Ostrich extends Walking {

	public Ostrich() {
		super();
	}
    
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Ostrich(String name) {     
		super(name);
	} 

	/* A Ostrich's Call
	 * Return: a Ostrich-call ("Snork").
	 */
	public String call() {
		return "Snork";
	} 
}
