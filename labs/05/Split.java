/* Split.java is a class and program that splits a string into two substrings
 *
 * Input: string, a string, and position, an integer
 * Precondition: position is in string's Range
 * Output: The substrings of string split by position
 *
 * Begun by: Serita Nelesen, for CS 214 at Calvin College
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: February 23, 2018
 */

import java.util.Scanner;

public class Split {
  public static void main(String[] args) {
      Scanner keyboard = new Scanner(System.in);
      System.out.print("\nTo split a string, enter the string: ");
      String string = keyboard.next();
      System.out.print("Enter the split position: ");
      int position = keyboard.nextInt();
      String[] results = new String[2];
      splitter(string, position, results);
      System.out.printf("\nThe first part is: %s\nand the second part is: %s\n\n", results[0], results[1]);
    }
  /* Function: split() splits a string according to the position specified
   * Parameters: string, a string, position, an integer, and results, an array of strings
   * Precondition: position is in aString's Range
   * Returns: The substrings of astring split by position
   */
  public static void splitter(String string, int position, String[] results) {
    results[0] = string.substring(0, position);
    results[1] = string.substring(position, string.length());
   } 
}
