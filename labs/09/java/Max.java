/* Max.java finds the maximum values in Java linked lists
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College
 * Author: Ian Christensen, CS 214 at Calvin College
 * Date: Spring, 2018
 */

import java.util.LinkedList;
import java.util.Iterator;
import java.util.Collections;

public class Max {

public static void main(String [] args) {
  LinkedList<Integer> list1 = new LinkedList<Integer>();
  LinkedList<Integer> list2 = new LinkedList<Integer>();
  LinkedList<Integer> list3 = new LinkedList<Integer>();

  list1.add(99);
  list1.add(88);
  list1.add(77);
  list1.add(66);
  list1.add(55);

  list2.add(55);
  list2.add(66);
  list2.add(77);
  list2.add(88);
  list2.add(99);

  list3.add(55);
  list3.add(77);
  list3.add(99);
  list3.add(88);
  list3.add(66);

  print(list1); 
  print(list2); 
  print(list3);

  System.out.println("Max of list1: " + Collections.max(list1));
  System.out.println("Max of list2: " + Collections.max(list2));
  System.out.println("Max of list3: " + Collections.max(list3));
  }

 /* print() displays a LinkedList on the console
  *
  * @param: aList, a LinkedList<Integer>
  * 
  * Postcondition: the Integer values in aList
  *                 have been displayed to System.out,
  *                 separated by spaces
  */
  public static void print(LinkedList<Integer> aList) {
    Iterator<Integer> listIterator = aList.iterator();
    while (listIterator.hasNext()) {
      System.out.print(listIterator.next() + " ");
    }
    System.out.print('\n');
  }
}
