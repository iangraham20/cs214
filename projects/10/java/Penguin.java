/* Penguin.java provides a Penguin subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Penguin extends Walking {

	public Penguin() {
		super();
	}
    
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Penguin(String name) {     
		super(name);
	} 

	/* A Penguin's Call
	 * Return: a Penguin-call ("Huh-huh-huh-huuuuh").
	 */
	public String call() {
		return "Huh-huh-huh-huuuuh";
	} 
}
