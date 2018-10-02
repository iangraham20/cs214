/* ArraySum.java sums the integers in a file using an array.
 *
 * Usage: java -Xint ArraySum <fileName>
 *
 * Input: the name of the input file
 *         (entered on the command-line).
 * Precondition: the first line of the file is the number
 *                of (other) numbers in the file.
 * Output: the sum of the other numbers in the file
 *          and how long it took to compute that sum.
 *
 * Begun by: Prof. Adams for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College.
 * Date: Spring, 2018
 */

import java.util.Scanner;                   // convenient I/O
import java.io.File;                        // file I/O
import java.io.FileNotFoundException;       // file exception
import java.lang.System;                    // nanoTime()

public class ArraySum {

  public static void main(String [] args) {
     ArraySum me = new ArraySum(args);
     me.run();
  }

  /* constructor
   * @param: args, an array of Strings
   * Precondition: args.length == 1 &&
   *                args[0] is the name of an input file
   *                 whose first line is N, an integer
   *                 followed by a blank line
   *                 followed by N integers, one per line.
   * Postcondition: myScanner is a Scanner for that input file
   *             && myArray is an array containing the N ints.
   */
  public ArraySum(String [] args) {
     if (args.length < 1) {
        System.err.println("\n*** Usage: java Sum <fileName>\n");
        System.exit(1);
     }
     Scanner aScanner = openScanner( args[0] ); // open input file
     myArray = readFile(aScanner);              // fill array with values
  }


  /* utility to open / return a Scanner to a file 
   *   whose name comes from the command-line.
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

  /* fill an array with values from a Scanner
   * @param: in, a Scanner to an input file.
   * Precondition: the first line of the input file is N,
   *                the number of (other) numbers in the file.
   * Postcondition: the N int values have been read
   *                 from 'in' and stored in an array.
   * Return: the array containing the N int values.
   */
  private int[] readFile(Scanner in) {
     int numNumbers = in.nextInt();           // read how many numbers
     int [] array = new int[numNumbers];      // allocate array
     for (int i = 0; i < array.length; i++) { // fill array
        array[i] = in.nextInt();              //   with numbers
     }
     in.close();                              // close input file
     return array;                            // we're done
  }

  /* how long does it take to process the values in myArray?
   * Precondition: myArray has been filled with N input values.
   * Output: the sum of the values in myArray
   *          and how long it took to compute that sum.
   */
  public void run() {
     long startTime = System.nanoTime();             // start timing
     long sum = sumArray(myArray);                    // sum the values
     long totalTime = System.nanoTime() - startTime; // stop timing
     
     System.out.println("\nThe sum of the " + myArray.length
                         + " numbers is: " + sum 
                         + "\n and summing them took " 
                         + totalTime + " time units.\n");
  }

  /* sum the values in an array
   * @param: arr, an array of integers
   * Return: the sum of the int values in arr.
   */
  private long sumArray(int[] arr) {
     long sum = 0;
     for (int i = 0; i < arr.length; i++) {
        sum += arr[i];
     }
     return sum;
  }

  private int [] myArray = null;
}

