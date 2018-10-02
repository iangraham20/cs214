/* Sum.java sums the integers in a file.
 *
 * Usager java Sum <fileName>
 *
 * Input: the name of the input file
 *         (entered on the command-line).
 * Precondition: the first line of the file
 *                is the number of numbers in the file.
 * Output: the sum of the other numbers in the file.
 *
 * @author: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College.
 */

import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

public class Sum {

  public static void main(String [] args) {
     Sum me = new Sum(args);
     me.run(args);
  }

  /* constructor
   * @param: args, an array of Strings
   * Precondition: args.length >= 1 &&
   *                args[0] is the name of an input file.
   * Postcondition: myScanner is a Scanner for that input file.
   */              
  public Sum(String [] args) {
     if (args.length < 1) {
        System.err.println("\n*** Usage: java Sum <fileName>\n");
        System.exit(1);
     }
     myScanner = openScanner( args[0] );
  }

  /* method to sum the numbers in the file
   *
   * Precondition: myScanner is a Scanner for an input file
   *                whose first line is N, the number of numbers
   *                followed by a blank line
   *                followed by N numbers, each on a separate line.
   * Output: the sum of the N numbers.
   */
  public void run(String [] args) {

     long numNumbers = myScanner.nextLong();    // read how many numbers
     long sum = 0, number = 0;

     // either of these loops work
     for (int i = 0; i < numNumbers; i++) {  // counting loop
//     while ( myScanner.hasNextInt() ) {      // pretest loop
        number = myScanner.nextLong();        //   read the next number
        sum += number;                       //   add it to the sum
     }
     myScanner.close();

     System.out.println("\nThe sum of the numbers is: " + sum + "\n");
  }

  /* Utility to open / return a Scanner to a file 
   * 
   * @param: fileName, a String
   * Precondition: fileName is the name of an input file.
   * Return: a Scanner for that input file.
   */
  private Scanner openScanner(String fileName) {
     Scanner in = null;
     try {
        File theFile = new File ( fileName );
        in = new Scanner( theFile );
     } catch ( FileNotFoundException  fnfe ) {
        System.err.println("\n*** Unable to open '" + fileName + "'\n");
        System.exit(1);
     }
     return in;
  }

  private Scanner myScanner = null;
}

