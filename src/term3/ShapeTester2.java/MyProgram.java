import java.util.Scanner;

public class MyProgram {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Welcome to the Shape Tester!");

        while (true) {
            double r, l, w, h, pl, pw, ph, ch, cr;

            // Displaying the menu
            System.out.println("Choose the shape you want to build: ");
            System.out.println("1. Box ");
            System.out.println("2. Pyramid ");
            System.out.println("3. Sphere ");
            System.out.println("4. Cylinder");
            System.out.println("5. Exit");
            System.out.println(" ");

            int userShape = scanner.nextInt();

            // Handle Box option
            if (userShape == 1) {
                System.out.println(" ");
                System.out.println("You chose a box!");
                System.out.println("Choose a length: ");
                l = scanner.nextDouble();
                System.out.println("Choose a width: ");
                w = scanner.nextDouble();
                System.out.println("Choose a height: ");
                h = scanner.nextDouble();
                
                Box box = new Box(l, w, h);
                System.out.println(" ");
                System.out.println("Your shape's volume is: " + box.boxVol());
                System.out.println("Your shape's surface area is: " + box.boxSufArea());

            // Handle Pyramid option
            } else if (userShape == 2) {
                System.out.println(" ");
                System.out.println("You chose a Pyramid!");
                System.out.println("Choose a length: ");
                pl = scanner.nextDouble();
                System.out.println("Choose a width: ");
                pw = scanner.nextDouble();
                System.out.println("Choose a height: ");
                ph = scanner.nextDouble();
                
                Pyramid pyramid = new Pyramid(pl, pw, ph);
                System.out.println(" ");
                System.out.println("Your shape's volume is: " + pyramid.pyramidVol());
                System.out.println("Your shape's surface area is: " + pyramid.pyramidArea());

            // Handle Sphere option
            } else if (userShape == 3) {
                System.out.println("You chose a Sphere!");
                System.out.println(" ");
                System.out.println("Choose your radius: ");
                r = scanner.nextDouble();
                
                Sphere sphere = new Sphere(r);
                System.out.println(" ");
                System.out.println("Your shape's volume is: " + sphere.sphereVol());
                System.out.println("Your shape's surface area is: " + sphere.sphereSufArea());
                
                
            } else if (userShape == 4) {
                System.out.println("You chose a Cylinder!");
                System.out.println(" ");
                System.out.println("Choose your radius: ");
                cr = scanner.nextDouble();
                System.out.println("Choose your height: ");
                ch = scanner.nextDouble();
                
                Cylinder cylinder = new Cylinder(cr, ch);
                System.out.println(" ");
                System.out.println("Your shape's volume is: " + cylinder.cyVol());
                System.out.println("Your shape's surface area is: " + cylinder.cySufArea());

          
            } else if (userShape == 5) {
                System.out.println("Exiting out...");
                break; 
            } else if (userShape > 5 && userShape > 1) {
                System.out.println("That is not one of the options, try again!");
            } 
            System.out.println(" ");
        
        } 
        
        scanner.close();
          // Close the scanner after the loop ends
    }
}