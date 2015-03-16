This project is to illustrate the basic of using Maven to package a Java Webstart application into a webapp.
This project contains a webapp and a swing client project.
1. maven webstart plugin is in the web project pom.xml
2. JnlpDownloadServlet is used.

This project is to illustrate the basic of using Maven to package a Java Webstart application into a webapp.
This project contains a web application war and a swing client project.
1. maven webstart plugin is run in the web project pom.xml
2. JnlpDownloadServlet is used.
3. Use Maven plugin to generate the jnlp

Tested changing the java code on the client side and new version downloaded to the client under the conditions:
1. Using launch.jnlp 
2. Keeping the same client jar version number in pom.xml
3. Launching Java Webstart using command line instead of link on browser
4. Running under Java 7u51

Run the following to launch the Java Webstart Application from command line:
c:\"Program Files (x86)\Java\jre1.7.0_51\bin\javaws.exe" http://localhost:8080/webstart1-web/webstart/launch.jnlp
