package com.weboctave.multiwebstart.child.client;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import org.apache.commons.collections.BidiMap;
import org.apache.commons.collections.bidimap.TreeBidiMap;

import com.weboctave.multiwebstart.base.client.ClientUtils;


public class HelloWorldSwing {
	private static int count = 1;
	
  public static void main(String[] args) {
	  createGui();
  }
  
  public static void createGui() {
	    final JFrame frame = new JFrame("HelloWorldSwing");
		JPanel jpanel1 = new JPanel();
		frame.setContentPane(jpanel1);		
	    final JLabel label = new JLabel("Multi modules Swing Webstart App - Child");
	    // Use other 3rd party library - specify in pom.xml dependencies
	    BidiMap map = prepareMap();
	    // Use class in base project
	    if (ClientUtils.isTrue(Boolean.TRUE)) {
	    	label.setText("Multiwebstart child " + map.get(count++).toString());
	    	if (count>5)
	    		count = 1;
	    }
	    jpanel1.add(label);
		JButton btnClose = new JButton("Close");
		btnClose.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("btnClose click.");
				//frame.dispatchEvent(new WindowEvent(frame, WindowEvent.WINDOW_CLOSING));
				frame.setVisible(false); //you can't see me!
				frame.dispose(); //Destroy the JFrame object
			}
		});
		jpanel1.add(btnClose);
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