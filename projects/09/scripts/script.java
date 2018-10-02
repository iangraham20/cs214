Script started on Sat 14 Apr 2018 07:51:37 PM EDT
igc2@eckert-mauchly:~/workspace/214/projects/09/java$ ls
Makefile  script.java  Search.class  Search.java
igc2@eckert-mauchly:~/workspace/214/projects/09/java$ make
javac -deprecation Search.java
igc2@eckert-mauchly:~/workspace/214/projects/09/java$ cat Search.java
/* Search.java finds specified values in Java linked lists
 *
 * Author: Ian Christensen, CS 214 at Calvin College
 * Date: Spring, 2018
 */

import java.util.LinkedList;
import java.util.Iterator;
import java.util.Collections;

public class Search {
  public static void main(String [] args) {
    LinkedList<Integer> list1 = new LinkedList<Integer>();
    LinkedList<Integer> list2 = new LinkedList<Integer>();
    LinkedList<Integer> list3 = new LinkedList<Integer>();
    LinkedList<Integer> list4 = new LinkedList<Integer>();

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

    list4.add(88);
    list4.add(77);
    list4.add(66);
    list4.add(55);
    list4.add(44);

    print(list1); 
    print(list2); 
    print(list3);
    print(list4);

    System.out.println("Max of list1: " + Collections.max(list1));
    System.out.println("Max of list2: " + Collections.max(list2));
    System.out.println("Max of list3: " + Collections.max(list3));
    System.out.println("Max of list4: " + Collections.max(list4));

    System.out.println("The position of 99 in list1 is: " + search(list1, 99));
    System.out.println("The position of 99 in list2 is: " + search(list2, 99));
    System.out.println("The position of 99 in list3 is: " + search(list3, 99));
    System.out.println("The position of 99 in list4 is: " + search(list4, 99));
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

    /*
     * Receive: aList, a list of integers; and aValue, an integer.
     * Return: the position of aValue within aList, if aValue is present in aList; -1, otherwise
     *
     *
     */
    public static Integer search(LinkedList<Integer> aList, Integer aValue) {
      Iterator<Integer> listIterator = aList.iterator();
      Integer index = 0;
      while (listIterator.hasNext()) {
        if (listIterator.next() == aValue) {
          return index;
        }
        index += 1;
      }
      return -1;
    }
}
igc2@eckert-mauchly:~/workspace/214/projects/09/java$ java Search
99 88 77 66 55 
55 66 77 88 99 
55 77 99 88 66 
88 77 66 55 44 
Max of list1: 99
Max of list2: 99
Max of list3: 99
Max of list4: 88
The position of 99 in list1 is: 0
The position of 99 in list2 is: 4
The position of 99 in list3 is: 2
The position of 99 in list4 is: -1
igc2@eckert-mauchly:~/workspace/214/projects/09/java$ exit

Script done on Sat 14 Apr 2018 07:52:09 PM EDT
