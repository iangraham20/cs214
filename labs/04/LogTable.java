/* LogTable.java displays a table of logarithms.
 *
 * Input: start, stop and increment, three doubles.
 * Precondition: start < stop && increment > 0.
 * Output: A table of logarithms from start to stop,
 *         with increment as the step value.
 * Begun by: Nelesen, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College.
 * Date: February 21, 2018
 */

import java.util.Scanner; // Get input

public class LogTable{

    /* Function: 
     * Parameter: 
     * Precondition: 
     * Returns: 
     */
  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    System.out.println("To display a table of logarithms,");
    double start, stop, increment;
    System.out.println("Enter the start value: ");
    start = keyboard.nextDouble();
    System.out.println("Enter the stop value: ");
    stop = keyboard.nextDouble();
    System.out.println("Enter the increment value: ");
    increment = keyboard.nextDouble();
    while (start <= stop) {
        System.out.println(String.format("The logarithm of %.1f is %.6f", start, Math.log10(start)));
        start += increment;
        }
    }
}
