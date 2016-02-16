/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mandelbrotset;

/**
 *
 * @author kaveh
 */
public class DrawAsText {
    ArrayCompute arrayC = new ArrayCompute(500, 500);

    
    
    
    public void printXO(double xStart, double xEnd, double yStart, double yEnd) {
        arrayC.fillgrid(xStart, xEnd, yStart, yEnd, 255);
        for(int i = 0; i < 500; i++) {
            for(int j = 0; j <500; j++) {
                if(arrayC.getGridVal(i,j) == -1) {
                    System.out.print(" ");
                }
                else {
                    System.out.print("#");
                }
            }
            System.out.println();
        }
    }
    
    public void printGrid(double xStart, double xEnd, double yStart, double yEnd) {
        arrayC.fillgrid(xStart, xEnd, yStart, yEnd, 255);
        for(int i = 0; i < 500; i++) {
            for(int j = 0; j <500; j++) {
                System.out.print(arrayC.getGridVal(i, j));
            }
            System.out.println();
        }
    }
}
