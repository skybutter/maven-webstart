<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="application/x-java-jnlp-file"%>
<%
// should get the Url from a properties file or read from servlet request
// String codebase = "http://localhost:8181/webstart2-web/";

String url = request.getRequestURL().toString();
String servletPath = request.getServletPath();
String codebase = url.substring(0,url.indexOf(servletPath));

String mainjar = "webstart2-client";
String jnlpResourcePath = "webstart/";
java.util.Set<java.lang.String> resourcePaths = getServletContext().getResourcePaths("/" + jnlpResourcePath);
// resourcePaths(/webstart/=[/webstart/commons-lang-2.1.jar, /webstart/launch.jsp, /webstart/swingwebstart2-client-1.0.jar]
		
%>
<jnlp spec="6.0+" codebase="<%=codebase %>" >
	<information>
		<title>Simple Swing Webstart application</title>
		<vendor>Weboctave</vendor>
		<description>Simple Swing Webstart Application </description>
		<description kind="short">Simple Swing Webstart Application</description>
		<shortcut online="true"><desktop/><menu submenu="Weboctave"/></shortcut>
	</information>
	<security>
		<all-permissions/>
	</security>
	<update check="always" policy="always" />
	<resources>
		<j2se version="1.6+" href='http://java.sun.com/products/autodl/j2se' java-vm-args="-Xmx128m"/>
		<!-- 
		<jar href="webstart/webstart2-client-1.0.jar" main="true"/>
		<jar href="webstart/commons-lang-2.1.jar" />-->
<%
	if (resourcePaths!=null && !resourcePaths.isEmpty()) {
		java.util.Iterator<String> it = resourcePaths.iterator();		
		while (it.hasNext()) {
			String resource = it.next();
			StringBuilder sb = new StringBuilder();
			// Only include jar file here
			if (resource.endsWith(".jar")) {
				// Take out the left most /
				String filepath = resource.substring(1);
				sb.append("<jar href='" + filepath + "' ");
				if (resource.indexOf(mainjar)>0) {
					sb.append("main='true'");
				}
				sb.append("/>\n");
				out.println(sb.toString());
			}
		}
	}
%>
	</resources>
	<application-desc main-class="com.weboctave.swingwebstart.client.HelloWorldSwing"/>
	</application-desc>
</jnlp>