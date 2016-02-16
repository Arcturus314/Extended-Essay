/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mandelbrotset;

import javax.swing.JFrame;
import java.awt.Graphics;
import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import java.awt.BorderLayout; 
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.lang.Math;
import javax.swing.event.MouseInputAdapter;

/**
 *
 * @author Kaveh
 */
public class DrawAsGraphics extends JPanel implements MouseListener{
    
    //I have absolutely no idea how any of the jframe stuff works, the framework is copied from: http://php.scripts.psu.edu/djh300/cmpsc221/notes-graphics-intro.php
    
    public static double xStart = 0;
    public static double xEnd = 0;
    public static double yStart = 0;
    public static double yEnd = 0;
    public static int iterations = 0;
    public static long zoom = 2;
    
    public static int xDim = 0;
    public static int yDim = 0;
    
    
    DrawAsGraphics panel;
    JFrame application;
    
    
    public void mouseClicked(MouseEvent e) {
        System.out.println("Zooming in...");
        double xSize = Math.abs(xEnd-xStart);
        double ySize = Math.abs(yEnd-yStart);
        double xAway = (e.getX()-20)*(xSize/(double)xDim);
        double yAway = (e.getY()-50)*(ySize/(double)yDim);
        double xPoint = xStart+xAway;
        double yPoint = yStart+yAway;
        double[] coords = magToWindow(xPoint, yPoint, zoom*2);
        xStart = coords[0];
        xEnd = coords[1];
        yStart = coords[2];
        yEnd = coords[3];
        iterations*=1.1;
        System.out.println("iterations: " + iterations);
        draw();
        
    }
    public void mouseEntered(MouseEvent e) {
        
    }
    public void mouseExited(MouseEvent e) {
        
    }
    public void mousePressed(MouseEvent e) {
        
    }
    public void mouseReleased(MouseEvent e) {
        
    }

    
    
    public DrawAsGraphics() {
        super();
        setBackground(Color.WHITE);
    }
    
    
    public void paintComponent(Graphics g) {
        int width = getWidth();
        int height = getHeight();
        
        super.paintComponent(g);
        
        //my code starts here
        System.out.println("----Starting graphics draw----");
        
        int xPixelCount = 0;
        int yPixelCount = 0;
        
        System.out.println("Computing grid");
        
        ArrayCompute arrayC = new ArrayCompute(xDim, yDim);
        
        arrayC.fillgrid(xStart, xEnd, yStart, yEnd, iterations);
        
        System.out.println("Drawing grid");

        
        
        for(int i = 0; i < xDim; i++) {
            for(int j = 0; j < yDim; j++) {
                if(arrayC.getGridVal(i,j) == -1) {
                    g.setColor(Color.BLACK);
                    g.drawLine(xPixelCount, yPixelCount, xPixelCount, yPixelCount);
                }
                else {
                    double relIter = 0;
                    int green = 0;
                    int red = 0;
                    int blue= 0;
                    if((double)arrayC.getGridVal(i,j) > 0.0) {
                        //relIter = (Math.sqrt((((double)(arrayC.getGridVal(i,j))/(double)(arrayC.maxIterations()))*255.0))*15.0);
                        relIter = (((double)(arrayC.getGridVal(i,j))/(double)(arrayC.maxIterations()))*255.0);
                    }
                    double relIterPercent = ((relIter/255.0)*100.0);
                    int firstColor = (int)((-0.408)*relIterPercent*relIterPercent + (20.4)*relIterPercent);
                    int secondColor = (int)((-0.408)*relIterPercent*relIterPercent + (40.8)*relIterPercent -765.0);
                    int thirdColor = (int)((-0.408)*relIterPercent*relIterPercent + (61.2)*relIterPercent -2040.0);
                    if(firstColor > 0)
                        blue = firstColor;
                    if(secondColor > 0)
                        green = secondColor;
                    if(thirdColor > 0)
                        red = thirdColor;
                    //System.out.println("relIter: " + relIter + " relIterPercent: " + relIterPercent + " r: " + red + " g: " + green + " b: " + blue);
                    Color tempColor = new Color(red, green, blue);
                    g.setColor(tempColor);
                    g.drawLine(xPixelCount, yPixelCount, xPixelCount, yPixelCount);
                }
     
                xPixelCount++; 
            }
            yPixelCount++;
            xPixelCount = 0;
        }
        g.setColor(new Color(0,0,0));
        g.drawString(("Real: " + xStart + " to"), xDim+10, 20);
        g.drawString((""+xEnd), xDim+10, 35);
        g.drawString(("Imaginary: " + yStart + " to"), xDim+10, 55);
        g.drawString((""+yEnd), xDim+10, 70);
        g.drawString(("Iterations:"), xDim+10, 90);
        g.drawString((""+iterations), xDim+10, 105);
        
        System.out.println("Draw finished");
        //my code ends here
        
    }
    
    public void draw() {
        panel = new DrawAsGraphics();
        application = new JFrame();
        application.add(panel);    
        application.addMouseListener(this);
        application.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        application.setSize(xDim+235, yDim+50);
        System.out.println("Window Size: Width = " + xDim + " Height = " + yDim);
        application.setVisible(true);
    }
    
    public void assignWindow(double xS, double xE, double yS, double yE, int x, int y, int iter) {
        xStart = xS;
        xEnd = xE;
        yStart = yS;
        yEnd = yE;
        xDim = x;
        yDim = y;
        iterations = iter;
    }
    
    public double[] magToWindow(double real, double imaginary, long magnification) {
        //This assumes base settings of x from -2.5 to 1.5 and y from -2 to 2
        //Basic "window" would be 4 by 4 with center at 0
        //Basic "magnification" would be 1
        double[] window = new double[4];
        zoom = magnification;
        //Window array encoding: index 0 is xStart, index 1 is xEnd, index 2 is yStart, index 3 is yEnd
        window[0] = (real - 2.0/(double)magnification);
        window[1] = (real + 2.0/(double)magnification);
        window[2] = (imaginary - 2.0/(double)magnification);
        window[3] = (imaginary + 2.0/(double)magnification);
        
        return window;
    }
}
