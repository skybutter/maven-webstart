This project is to illustrate the basic of using Maven to package a Java Webstart application into a webapp.
This project contains a web application war and a swing client project.
1. maven webstart plugin is run in the web project pom.xml
2. JnlpDownloadServlet is not used.
3. The generated client jar and dependent jar are copied into webapp as web resources in war plugin.
4. Use Maven plugin to generate the jnlp as jsp with jsp code to set the codebase (launch.jsp)
5. Created custom jsp (launch2.jsp) to demonstrate how not using generated Jnlp to launch webstart.  It queries the webstart directory for list of jar files to construct the jnlp.

The shortcoming of this is that the client jar and its dependent jars are included into the webapp WEB-INF/lib directory.

Tested changing the java code on the client side and new version downloaded to the client under the conditions:
1. Using launch.jsp or launch2.jsp 
2. Keeping the same client jar version number in pom.xml
3. Launching Java Webstart using command line instead of link on browser
4. Running under Java 7u51

Run the following to launch the Java Webstart Application from command line:
c:\"Program Files (x86)\Java\jre1.7.0_51\bin\javaws.exe" http://localhost:8080/webstart2-web/webstart/launch.jsp
c:\"Program Files (x86)\Java\jre1.7.0_51\bin\javaws.exe" http://localhost:8080/webstart2-web/webstart/launch2.jsp