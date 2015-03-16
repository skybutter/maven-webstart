package com.weboctave.multiwebstart.child.client;

import javax.swing.JFrame;
import javax.swing.JLabel;

import org.apache.commons.collections.BidiMap;
import org.apache.commons.collections.bidimap.TreeBidiMap;

import com.weboctave.multiwebstart.base.client.ClientUtils;

public class HelloWorldSwing {
  public static void main(String[] args) {
	  createGui();
  }
  
  public static void createGui() {
	    final JFrame frame = new JFrame("HelloWorldSwing");
	    final JLabel label = new JLabel("Multi modules Swing Webstart App - Child");
	    // Use other 3rd party library - specify in pom.xml dependencies
	    BidiMap map = prepareMap();
	    // Use class in base project
	    if (ClientUtils.isTrue(Boolean.TRUE)) {
	    	label.setText("Multiwebstart child " + map.get(1).toString());
	    }
	    
	    frame.getContentPane().add(label);
	    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    frame.pack();
	    frame.setVisible(true);	  
  }
  
  private static BidiMap prepareMap() {
	    BidiMap bidi = new TreeBidiMap();
	    bidi.put("ONE", 1);
	    bidi.put("TWO", 2);
	    bidi.put("THREE", 3);
	    bidi.put("FOUR", 4);
	    bidi.put("FIVE", 5);	    
//	    bidi.get("SIX");  // returns "6"
//	    bidi.getKey("6");  // returns "SIX"
	    BidiMap inverse = bidi.inverseBidiMap();  // returns a map with keys and values swapped	    
	    return inverse;
  }
}