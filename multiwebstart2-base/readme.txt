This project is to illustrate how to build a multi project Java Webstart application using Maven.
The *base project is the base project which the child project depends on.
The *child project is the project which depends on the base project.
The *child client java class uses the *base client java class.

This project works with the multiwebstart2-child project.

This project contains a web application war and a swing client project.
1. maven webstart plugin is run in the client project pom.xml
2. JnlpDownloadServlet is not used
3. The generated client jar and dependent jar are copied into webapp as web resources in war plugin.
4. Use 2 ways to come up with the JNLP
	a. Use Maven plugin to generate the jnlp as jsp with jsp code to set the codebase (launch.jsp)
	b. Use custom jsp (launch2.jsp) as Jnlp to launch webstart.  
   		It queries the webstart directory for list of jar files to construct the jnlp.
5. JNLP use jsp to include resourceversion.jsp to get the list of jar files from other web application directory to download.
      
Tested changing the java code on the client side and new version downloaded to the client under the conditions:
1. Using launch.jsp and launch2.jsp 
2. Keeping the same client jar version number in pom.xml
3. Launching Java Webstart using command line instead of link on browser
4. Running under Java 7u51

Run the following to launch the Java Webstart Application from command line:
c:\"Program Files (x86)\Java\jre1.7.0_51\bin\javaws.exe" http://localhost:8080/multiwebstart2-base-web/webstart/launch.jsp
c:\"Program Files (x86)\Java\jre1.7.0_51\bin\javaws.exe" http://localhost:8080/multiwebstart2-base-web/webstart/launch2.jsp