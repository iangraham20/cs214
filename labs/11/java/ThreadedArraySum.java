/* ThreadedArraySum.java sums the integers in a file using an array.
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

public class ThreadedArraySum {

  public static void main(String [] args) {
     ThreadedArraySum me = new ThreadedArraySum(args);
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
  public ThreadedArraySum(String [] args) {
     if (args.length < 1) {
        System.err.println("\n*** Usage: java Sum <fileName>\n");
        System.exit(1);
     }
     Scanner aScanner = openScanner( args[0] ); // open input file
     myArray = readFile(aScanner);              // fill array with values
     myNumThreads = getNumThreads(args);
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
     Helper[] helpers = new Helper[myNumThreads];

     for (int i = 1; i < myNumThreads; ++i) {     // for each helper:
        helpers[i] = new Helper(i);                  //  create, and
        helpers[i].start();                          //  launch them
     }

     long sum = sumSlice(0);                         // main thread does slice 0

     try {
        for (int i = 1; i < myNumThreads; ++i) {  // for each helper h:
           helpers[i].join();                        //  wait for h to finish
           sum += helpers[i].getPartialSum();        //  get its partial sum
        }
     } catch( InterruptedException ie) {             // required by join()
        System.err.println("\n*** a Helper was interrupted!\n");
        System.err.println(ie);
        System.exit(1);
     }

     return sum;
  }

  private final int getNumThreads( String [] args ) {
     if (args.length >= 2) {
        return Integer.parseInt( args[1] );
     } else {
        return 1;
     }
  }

 private class Helper extends Thread {

     public Helper(int id) {
       super();
       myID = id;
       myPartialSum = 0;
     }

     public void run() {
         myPartialSum = sumSlice(myID);
     }

     public final long getPartialSum() {
        return myPartialSum;
     }

     private int  myID = 0;
     private long myPartialSum = 0;
  } // Helper

    private long sumSlice(int id) {
        int sliceSize = myArray.length / myNumThreads;
        int start = id * sliceSize;         // starting index
        int stop = (id+1) * sliceSize;      // stopping index
        if ( id == myNumThreads-1 ) {       // have final thread
            stop = myArray.length;            //  handle leftovers
        } 
        long sliceSum = 0;
        for (int i = start; i < stop; ++i) {  // sum the ints
            sliceSum += myArray[i];           //  in my slice
        }
        return sliceSum;
  }

  private int [] myArray = null;
  private int myNumThreads = 1;
}

