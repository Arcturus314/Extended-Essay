/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mandelbrotset;

import java.util.Scanner;

/**
 *
 * @author kaveh
 */
public class TextMenu {
    public void startMenuText() {
        Scanner keyboard = new Scanner(System.in);
        
        //DrawAsText textDraw = new DrawAsText();
        DrawAsGraphics graphicsDraw = new DrawAsGraphics();
        
        boolean run = true;
        int size = 750;
        double xStart = -1.5;
        double xEnd = 0.5;
        double yStart = -1;
        double yEnd = 1;
        int iterations = 256;
        
        System.out.println("Welcome to Kaveh's Mandelbrot Grapher");
        
        while(run == true) {
            System.out.println("Options:\n1. Set window size\n2. Set window range\n3. Set window as coordinates and magnification\n4. Adjust number of iterations\n5. Draw\n6. View settings\n7. Quit");
            int choice = keyboard.nextInt();
            if(choice == 1) {
                System.out.println("Please enter size in pixels");
                size = keyboard.nextInt();

            }
            else if(choice == 2) {
                System.out.println("Please enter x range in the form xStart [space] xEnd");
                xStart = keyboard.nextDouble();
                xEnd = keyboard.nextDouble();
                System.out.println("Please enter y range in the form yStart [space] yEnd");
                yStart = keyboard.nextDouble();
                yEnd = keyboard.nextDouble();
            }
            else if(choice == 3) {
                System.out.println("Please enter real and imaginary coordinates in the form real [space] imaginary");
                double real = keyboard.nextDouble();
                double imaginary = keyboard.nextDouble();
                System.out.println("Please enter magnification as an integer");
                long mag = keyboard.nextLong();
                double[] window = graphicsDraw.magToWindow(real, imaginary, mag);
                xStart = window[0];
                xEnd = window[1];
                yStart = window[2];
                yEnd = window[3];
                
            }
            else if(choice == 4) {
                System.out.println("Please enter number of iterations in integer form");
                iterations = keyboard.nextInt();
            }
            else if(choice == 5) {
                graphicsDraw.assignWindow(xStart, xEnd, yStart, yEnd, size, size, iterations-1);
                graphicsDraw.draw();
            }
            else if(choice == 6) {
                System.out.println("Size = " + size + "\nX Range = " + xStart + " to " + xEnd + "\nY Range = "  + yStart + " to " + yEnd + "\nIterations = " + iterations);
            }
            else if(choice == 7) {
                run = false;
            }
            else {
                System.out.println("Please enter a number from 1 to 7");
            }
            
    }
    }
}
