/* CircleArea.java computes the area of a circle.
 *
 * Input: The radius of the circle.
 * Precondition: The radius is a positive number.
 * Output: The area of the circle.
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College.
 * Completed by: Ian Christensen
 * Date: January 31, 2018
 */


import java.util.Scanner;  // include class for Scanner

public class CircleArea {

     /* function circleArea() computes a circle's area, given its radius.
      * Parameter: r, a double
      * Precondition: r is not negative.
      * Returns: the area of the circle
      */
     public static double circleArea(double r) {
        return Math.PI * r * r;               // return an expression
     } // circleArea method
	
  // main program
  public static void main(String[] args) {
      // prompt for radius
      System.out.println("To compute the area of a circle,");
      System.out.print(" enter its radius: ");
     
      // Create a connection named keyboard to standard in
      Scanner keyboard = new Scanner(System.in); 
  
      //Get the number from the user
      double radius = keyboard.nextDouble();
      
      // output area
      System.out.println("The area is " + circleArea(radius)); 
  } // main method
} // class CircleArea
