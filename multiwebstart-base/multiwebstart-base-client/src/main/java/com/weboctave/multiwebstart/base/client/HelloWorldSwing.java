package com.weboctave.multiwebstart.base.client;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.lang.reflect.Method;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class HelloWorldSwing {
	public static void main(String[] args) {
		createGui();
	}
	
	private static void createGui() {
		final JFrame frame = new JFrame("multiwebstart-base");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JPanel jpanel1 = new JPanel();
		final JLabel label = new JLabel("Hello World");
		// Use other 3rd party library - specify in pom.xml dependencies
		if (ClientUtils.isTrue(Boolean.TRUE)) {
			label.setText("multiwebstart-base");
		}
		jpanel1.add(label);
		JButton btnChild = new JButton("Child");
		btnChild.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("btnChild click.");
				// Launch Child application via Java Reflection
				launchChild();
			}
		});
		jpanel1.add(btnChild);
		frame.setContentPane(jpanel1);
		// Display the window.
		frame.pack();
		frame.setVisible(true);
	}
	
	public static void launchChild() {
		try {
			Class clazz = Class.forName("com.weboctave.multiwebstart.child.client.HelloWorldSwing");
			Class noparams[] = {};
			Method method = clazz.getDeclaredMethod("createGui", noparams);
			method.invoke(clazz, null);			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}