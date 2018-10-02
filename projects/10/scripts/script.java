Script started on Sat 21 Apr 2018 07:42:19 PM EDT
igc2@thompson:~/workspace/214/projects/10/java$ ls
Bird.java  Birds.java  Duck.java  Flying.java  Goose.java  Kiwi.java  Makefile	Ostrich.java  Owl.java	Penguin.java  script.java  Walking.java
igc2@thompson:~/workspace/214/projects/10/java$ cat Birds.java Bird.java Flying.java Goos    Duck.java Goo   Owl.java Goose.java Walking.javaa  Penguin.java Ostrich.java Kiwi.java Makefile
/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Joel Adams, for CS 214 Lab 10 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Birds {
  
  public static void main(String[] args) {
    System.out.println("\nWelcome to the Bird Park!\n");

    Bird bird0 = new Bird();

    Bird bird1 = new Bird("Hawkeye");
    bird1.print();

    Duck bird2 = new Duck("Donald");
    bird2.print();

    Goose bird3 = new Goose("Mother Goose");
    bird3.print();

    Owl bird4 = new Owl("Woodsey");
    bird4.print();

    Penguin bird5 = new Penguin("Peter");
    bird5.print();

    Ostrich bird6 = new Ostrich("Oriville");
    bird6.print();

    Kiwi bird7 = new Kiwi("Katie");
    bird7.print();

    System.out.println("\n");
    }
}

/* Bird.java provides a Bird class
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

import java.io.*;

public class Bird {
 /* default constructor
  * PostCond: myName == "".
  */
  public Bird() {
    myName = "";
  } 

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Bird(String name) {
    myName = name;
  } 

 /* Name accessor
  * Return: myName.
  */
  public String getName() {
    return myName;
  } 

 /* A Bird's Call
  * Return: a default bird-call ("Squawk!").
  */
  public String call() {
    return "Squaaaaaaaaaawk!";
  }

  /* A Bird's Movement
   * Return: a default bird-movement ("moved passed").
   */
  public String move() {
    return "moved passed";
  }

 /* Output a Bird 
  * Output: Everything known about myself
  *          to the standard output stream.
  */
  public void print() {
    System.out.println(getName() + ' ' + getClass().getName() + " just " + move() + " and said " + call());
  }

  private String myName;
}

/* Flying.java provides a Flying subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Flying extends Bird {
    
	public Flying() {
		super();
	}
	
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Flying(String name) {     
		super(name);
	} 

	/* A Flying's move
	 * Return: a Flying-move ("flew passed").
	 */
	public String move() {
		return "flew passed";
	} 
}
/* Duck.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Duck extends Flying {

	public Duck() {
		super();
	}
    
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Duck(String name) {     
		super(name);
	} 

	/* A Duck's Call
	 * Return: a duck-call ("Quack!").
	 */
	public String call() {
		return "Quack!";
	} 
}
/* Owl.java provides an Owl subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Owl extends Flying {

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
 public Owl() {
 	super();
 }

 public Owl(String name) {
 	super(name);
 }

 /* An Owl's Call
  * Return: an owl-call ("Whoo-hoo!").
  */
 public String call() {
 	return "Whoo-hoo!";
 }
} 

/* Goose.java provides a Goose subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Goose extends Flying {

	public Goose() {
		super();
	}

	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Goose(String name) {
		super(name);
	}

	/* A Goose's Call
	 * Return: a goose-call ("Honk!").
	 */
	public String call() {
		return "Honk!";
	} 
}
/* Walking.java provides a Walking subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Walking extends Bird {
    
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Walking() {
		super();
	}

	public Walking(String name) {     
		super(name);
	} 

	/* A Walking's move
	 * Return: a Walking-move ("walked passed").
	 */
	public String move() {
		return "walked passed";
	} 
}
/* Penguin.java provides a Penguin subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Penguin extends Walking {

	public Penguin() {
		super();
	}
    
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Penguin(String name) {     
		super(name);
	} 

	/* A Penguin's Call
	 * Return: a Penguin-call ("Huh-huh-huh-huuuuh").
	 */
	public String call() {
		return "Huh-huh-huh-huuuuh";
	} 
}
/* Ostrich.java provides a Ostrich subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Ostrich extends Walking {

	public Ostrich() {
		super();
	}
    
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Ostrich(String name) {     
		super(name);
	} 

	/* A Ostrich's Call
	 * Return: a Ostrich-call ("Snork").
	 */
	public String call() {
		return "Snork";
	} 
}
/* Kiwi.java provides a Kiwi subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class Kiwi extends Walking {

	public Kiwi() {
		super();
	}
    
	/* explicit constructor
	 * Receive: name, a String 
	 * PostCond: myName == name.
	 */
	public Kiwi(String name) {     
		super(name);
	} 

	/* A Kiwi's Call
	 * Return: a Kiwi-call ("Aaawhhh!!!").
	 */
	public String call() {
		return "Aaawhhh!!!";
	} 
}

Birds: Birds.java
	javac -deprecation Birds.java

clean:
	rm -f *.class *.o *~ *#

igc2@thompson:~/workspace/214/projects/10/java$ ls
Bird.java  Birds.java  Duck.java  Flying.java  Goose.java  Kiwi.java  Makefile	Ostrich.java  Owl.java	Penguin.java  script.java  Walking.java
igc2@thompson:~/workspace/214/projects/10/java$ make
javac -deprecation Birds.java
igc2@thompson:~/workspace/214/projects/10/java$ make      ls
Bird.class  Birds.class  Duck.class  Flying.class  Goose.class	Kiwi.class  Makefile	   Ostrich.java  Owl.java	Penguin.java  Walking.class
Bird.java   Birds.java	 Duck.java   Flying.java   Goose.java	Kiwi.java   Ostrich.class  Owl.class	 Penguin.class	script.java   Walking.java
igc2@thompson:~/workspace/214/projects/10/java$ java Birds

Welcome to the Bird Park!

Hawkeye Bird just moved passed and said Squaaaaaaaaaawk!
Donald Duck just flew passed and said Quack!
Mother Goose Goose just flew passed and said Honk!
Woodsey Owl just flew passed and said Whoo-hoo!
Peter Penguin just walked passed and said Huh-huh-huh-huuuuh
Oriville Ostrich just walked passed and said Snork
Katie Kiwi just walked passed and said Aaawhhh!!!


igc2@thompson:~/workspace/214/projects/10/java$ make clean
rm -f *.class *.o *~ *#
igc2@thompson:~/workspace/214/projects/10/java$ ls
Bird.java  Birds.java  Duck.java  Flying.java  Goose.java  Kiwi.java  Makefile	Ostrich.java  Owl.java	Penguin.java  script.java  Walking.java
igc2@thompson:~/workspace/214/projects/10/java$ exit

Script done on Sat 21 Apr 2018 07:43:50 PM EDT
