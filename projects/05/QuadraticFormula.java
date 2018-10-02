/* QuadraticFormula.java computes the roots of a quadratic equation
 * 
 * Input: a, b, c, doubles
 * Precondition: a != 0, and b^2 - 4ac are nonnegative
 * Output: root1, root2, doubles
 * 
 * Author: Ian Christensen
 * Date: February 28, 2018
 */

import java.util.Scanner;
import java.lang.Math;

public class QuadraticFormula {
	public static void main(String[] args) {
		Scanner keyboard = new Scanner(System.in);
		System.out.println("\nTo compute the roots of a quadratic, ");
		System.out.print("enter a: ");
		double a = keyboard.nextDouble();
		System.out.print("enter b: ");
		double b = keyboard.nextDouble();
		System.out.print("enter c: ");
		double c = keyboard.nextDouble();
		double[] results = new double[2];
		if (quadraticFormula(a, b, c, results))
			System.out.printf("\nThe first root is: %f\nand the second root is: %f\n\n", results[0], results[1]);
		else
			System.out.println("The answer is a nonreal number.");
	}

	/* Function: computes the roots of a quadratic equation
	 * Precondition: a != 0, and b^2 - 4ac are nonnegative
	 * Parameters: a, b, c, doubles
	 * Returns: results, a list of doubles
	 */
	public static boolean quadraticFormula(double a, double b, double c, double[] results) {
		if (a != 0) {
			double arg = java.lang.Math.pow(b, 2.0) - (4 * a * c);
			if (arg >= 0) {
				results[0] = ((-b + java.lang.Math.sqrt(arg)) / (2 * a));
				results[1] = ((-b - java.lang.Math.sqrt(arg)) / (2 * a));
				return true;
			} else {
				System.out.println("quadraticFormula(): b^2 - 4ac is negative!");
				return false;
			}
		} else {
			System.out.println("quadraticFormula(): a is zero!");
			return false;
		}
	}
}
