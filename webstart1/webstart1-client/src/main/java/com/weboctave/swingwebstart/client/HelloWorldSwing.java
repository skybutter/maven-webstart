package com.weboctave.swingwebstart.client;

import javax.swing.JFrame;
import javax.swing.JLabel;

import org.apache.commons.lang.BooleanUtils;

public class HelloWorldSwing {
  public static void main(String[] args) {
    final JFrame frame = new JFrame("Webstart Application Example");
    final JLabel label = new JLabel("Hello World");
    if (BooleanUtils.isTrue(Boolean.TRUE)) {
    	label.setText("Swing Webstart App");
    }	
    frame.getContentPane().add(label);
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.pack();
    frame.setVisible(true);    
  }
}