/* Flying.java provides a Flying subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Flying extends Bird {
    
	public Flying() {
		super();
	}
	
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Flying(String name) {     
		super(name);
	} 

	/* A Flying's move
	 * Return: a Flying-move ("flew passed").
	 */
	public String move() {
		return "flew passed";
	} 
}
