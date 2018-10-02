/* Kiwi.java provides a Kiwi subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Kiwi extends Walking {

	public Kiwi() {
		super();
	}
    
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Kiwi(String name) {     
		super(name);
	} 

	/* A Kiwi's Call
	 * Return: a Kiwi-call ("Aaawhhh!!!").
	 */
	public String call() {
		return "Aaawhhh!!!";
	} 
}
