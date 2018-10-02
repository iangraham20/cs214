Script started on Fri 09 Mar 2018 03:26:11 PM EST
igc2@thompson:~/workspace/214/projects/06$ javac -deprecation ArrayProcessing.ja 
va

igc2@thompson:~/workspace/214/projects/06$ cat ArrayProcessing.java
/* ArrayProcessing.java allows a user to store and print values in an array
 *
 * Input: the array size and the individual values
 * Precondition: the input values are doubles
 * Output: prints out the values contained in array
 *
 * Author: Ian Christensen, CS 214 at Calvin College
 * Date: Spring, 2018
 */

import java.util.Scanner;

public class ArrayProcessing {
  public static void main(String[] args) {
  		Scanner keyboard = new Scanner(System.in);
  		System.out.print("\nEnter the size of the array: ");
  		int size = keyboard.nextInt();
  		double[] array = new double[size];
  		readArray(array, size, keyboard);
  		printArray(array, size);
  	}

  /* Function: prompts the user to specify the array values
   * Parameters: array[], an array of doubles && size, an int && keyboard, a keyboard object
   * Preconditions: user inputs are doubles
   * Returns: values within array
   */
  public static void readArray(double array[], int size, Scanner keyboard) {
  	for (int i = 0; i < size; i++) {
  		System.out.print("\nEnter a value to store at index " + i + ": ");
  		array[i] = keyboard.nextDouble();
  	}
  }

  /* Function: prints an arrays values
   * Parameters: array[], an array of doubles && size, an int
   * Preconditions: array contains values
   * Returns: prints out the values contained in array
   */
  public static void printArray(double array[], int size) {
  	for (int i = 0; i < size; i++) {
  		System.out.println("\nThe value at index " + i + " is: " + array[i]);
  	}
  	System.out.print("\n");
  }
}

igc2@thompson:~/workspace/214/projects/06$ java ArrayProcessing

Enter the size of the array: 3

Enter a value to store at index 0: 1.0

Enter a value to store at index 1: 2.000005

Enter a value to store at index 2: 95678

The value at index 0 is: 1.0

The value at index 1 is: 2.000005

The value at index 2 is: 95678.0

igc2@thompson:~/workspace/214/projects/06$ exit

Script done on Fri 09 Mar 2018 03:27:31 PM EST
