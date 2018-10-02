/* LetterGrades.java recieves a numeric grade and calculates the equivalent letter grade
 * Author: Ian Graham Christensen, for CS 214, at Calvin College
 * Date: February 15, 2018
 * 
 * Input: a numeric grade average
 * Precondition: the grade is a positive integer value
 * Output: a letter grade
 */

import java.util.Scanner;

/* Function: recieves a numeric grade and calculates the equivalent letter grade
 * Parameter: grade, an int
 * Precondition: parameter is a positive integer value
 * Returns: letter, a char
 */
public class LetterGrades {
	public static char letterGrade(int grade) {
		switch(grade / 10) {
			case 10: case 9:
				return 'A';
			case 8:
            	return 'B';
         	case 7:
            	return 'C';
         	case 6:
            	return 'D';
         	default:
            	return 'F';
		}
	}

	/* Function: prompts the user for a numeric grade average
	 * Parameter: String[] args, a string list
	 * Precondition: inputs are integer values
	 * Returns: prints out prompts and the equivalent grade letter
 	 */
	public static void main(String[] args) {
		Scanner keyboard = new Scanner(System.in);
		System.out.print("\nEnter a numeric grade point average: ");
		int grade = keyboard.nextInt();
		System.out.println("The equivalent letter grade is: "+letterGrade(grade));
	}
}
