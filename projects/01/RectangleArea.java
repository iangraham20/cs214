/* RectangleArea.java computes the area of a rectangle.
 *
 * Input: The length and width of the rectangle
 * Preconditions: The length and width are positive numbers.
 * Output: The area of the rectangle.
 *
 * Author: Ian Christensen
 * Date: February 1, 2018
 */

import java.util.Scanner;	// include for i/o operations

public class RectangleArea {
		/* function RectangleArea() computes a rectangle's area, given its length and width
		 * Parameter: l, a double
		 *			  w, a double
		 * Precondition: l and w are not negative.
		 * Returns: the area of the rectangle
		 */
		public static double RectangleArea(double l, double w) {	// declare method and pass in the parameters
			return l * w;											// return the calculated area
		}															// end the RectangleArea method
																	// begin the main program
	public static void main(String[] args) {						// declare the method and pass in string args
		System.out.println("To compute the area of a rectangle,");	// print statement with newline char
		Scanner keyboard = new Scanner(System.in);					// create a Scanner object to check for key strokes
		System.out.print(" enter its length: ");					// prompt user for length without newline
		double l = keyboard.nextDouble();							// set the next entered number as the length
		System.out.print(" enter its width: ");						// prompt the user for width without newline
		double w = keyboard.nextDouble();							// set the next entered
		System.out.println("The area is " + RectangleArea(l, w));	// print the output of the RectangleArea function
	}																// end the main function
}																	// end of the class contents
