/* YearCodes.java is a driver for function yearCode()
 *
 * Input: the name of the student's year
 * Precondition: the name is a lowercase string value
 * Output: the number corresponding to that year name
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College
 * Completed by: Ian Christensen, for CS 214, at Calvin College
 * Date: February 14, 2018
 */

import java.util.Scanner; // import the java scanner for user input capability

public class YearCodes {  // declare the class for YearCodes

   public static void main(String[] args) { // declare the class main
      Scanner keyboard = new Scanner(System.in); // create a scanner object for input capability
      System.out.println("\nEnter your academic year: "); // prompt
      String year = keyboard.next();      // read year
      System.out.println(yearCode(year)); // display its code
   }  //main method

   /* Function: yearCode() computes a student's year integer, given an academic year
    * Parameter: year, a string
    * Precondition: year is one of {freshman, sophomore, junior, or senior}.
    * Returns: the integer code corresponding to year.
    */
   public static int yearCode(String year) {  // declare the function/method definition for yearCode
      if (year.equals("freshman"))  // check for freshman inputs
        return 1; // return the corresponding year for freshman
      else if (year.equals("sophomore")) // check for sophomore inputs
        return 2; // return the corresponding year for sophomores
      else if (year.equals("junior")) // check for junior inputs
        return 3; // return the corresponding year for juniors
      else if (year.equals("senior")) // check for senior inputs
        return 4; // return the corresponding year for seniors
      else  // catch any unexpected inputs
        return 0; // return the value zero for all invalid inputs
   }  // yearCode method
} // class YearCodes
