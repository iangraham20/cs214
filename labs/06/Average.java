/* Average.java is a driver for method avg()
 *
 * Input: array, an array of doubles AND size, a double
 * Precondition: array, is an array of doubles
 * Output: the average of the doubles in array
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

import java.io.*;

public class Average {
  public static void main(String[] args) {
    double[] array0 = {};
    double[] array1 = {9.0, 8.0, 7.0, 6.0};
    System.out.println("The first average is " + avg(array0));
    System.out.println("The second average is " + avg(array1));
  }
  
  /* Function: computes the sum of an array of doubles
   * Parameters: array, an array of doubles
   * Preconditions: array, is an array of doubles
   * Returns: the sum of the values in array
   */
  public static double sum(double[] array){ 
      double total = 0.0;
      for (int i = 0; i < array.length; i++){
          total += array[i];
      }
      return total;
  }
  
  /* Function: computes the average of an array of doubles
   * Parameters: array, an array of doubles
   * Preconditions: array, is an array of doubles
   * Returns: the average of the values in array
   */
   public static double avg(double array[]) {
    if (array == null || array.length <= 0)
      return 0.0;
    else
      return sum(array) / array.length;
   }
}
