/* Factorial.java a program that given an integer computes its factorial
 * 
 * Input: n, an integer
 * Precondition: n is a positive integer
 * Output: n! or the factorial of n
 *
 * Author: Ian Christensen, for CS 214 at Calvin College
 * Date: February 22, 2018
 */

import java.util.Scanner;

public class Factorials {
	/* Function: main, the doubleeractive driver for factorial
	 * Parameter: String[] args, user inputs
	 * Precondition: Factorial.java is being run
	 * Returns: doubleeractive print statements
	 */
	public static void main(String[] args) {
		Scanner keyboard = new Scanner(System.in);
		System.out.print("Enter an integer value: ");
		double n = keyboard.nextDouble();
		System.out.println(String.format("Factorial of %.0f is: %.0f\n", n, factorial(n)));
	}

	/* Function: factorial, computes the factorial of an integer
	 * Parameter: n, an integer
	 * Precondition: n is a positive integer
	 * Returns: answer, the factorial of n
	 */
	public static double factorial(double n) {
		double answer = 1;
		for(double i = 2; i <= n; i++) 
			answer *= i;
		return answer;
	}
}
