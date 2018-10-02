/* Bird.java provides a Bird class
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

import java.io.*;

public class Bird {
 /* default constructor
  * PostCond: myName == "".
  */
  public Bird() {
    myName = "";
  } 

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Bird(String name) {
    myName = name;
  } 

 /* Name accessor
  * Return: myName.
  */
  public String getName() {
    return myName;
  } 

 /* A Bird's Call
  * Return: a default bird-call ("Squawk!").
  */
  public String call() {
    return "Squaaaaaaaaaawk!";
  }

  /* A Bird's Movement
   * Return: a default bird-movement ("moved passed").
   */
  public String move() {
    return "moved passed";
  }

 /* Output a Bird 
  * Output: Everything known about myself
  *          to the standard output stream.
  */
  public void print() {
    System.out.println(getName() + ' ' + getClass().getName() + " just " + move() + " and said " + call());
  }

  private String myName;
}

