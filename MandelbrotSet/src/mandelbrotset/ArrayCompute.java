/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mandelbrotset;
import java.lang.Math;
/**
 *
 * @author kaveh
 */
public class ArrayCompute {
    
    int[][] grid;
    int xDim;
    int yDim;
    int maxIterations = 0;
    
    public ArrayCompute(int x, int y) {
        xDim = x;
        yDim = y;
        grid  = new int[xDim][yDim];
        for(int i = 0; i < xDim; i++) {
            for(int j = 0; j <yDim; j++) {
                grid[i][j] = 0;
            }
        }
    }
    
    public int getGridVal(int y, int x) {
        return grid[x][y];
    }
    
    public void fillgrid(double xStart, double xEnd, double yStart, double yEnd, int iterations) {
        double xStep = (xEnd-xStart)/xDim;
        double yStep = (yEnd-yStart)/yDim;
        for(int i = 0; i < xDim; i++) {
            for(int j = 0; j <yDim; j++) {
                grid[i][j] = iterationsToExpand(((double)i*xStep)+xStart, ((double)j*yStep)+yStart, iterations);
            }
        }
    }
    
    public int[][] returnGrid() {
        return grid;
    }
    
    public int iterationsToExpand(double x, double y, int iter) {
        int iterCount = 0;
        double origX = x;
        double origY = y;
        while(x < 2 && y < 2 && iterCount < iter) {
            iterCount++;
            double xTemp = squareRealZ(x,y) + origX;
            double yTemp = squareImaginaryZ(x,y) + origY;
            if(x == xTemp && y == yTemp) {
                iterCount = iter;
            }
            x = xTemp;
            y = yTemp;
        }
        if(Math.sqrt(x*x + y*y) >= 2) {
            if (iterCount > maxIterations)
                maxIterations = iterCount;
            return iterCount;
        }
        return -1;
    }
    
    public boolean expand(int iterations) {
        if(iterations == -1) {
            return false;
        }
        return true;
    }
    
    public double squareRealZ(double x, double y) {
        return (x*x)-(y*y);
    }
    
    public double squareImaginaryZ(double x, double y) {
        return 2.0*x*y;
    }
    
    public int maxIterations() {
        return maxIterations;
    }
    
    
}
