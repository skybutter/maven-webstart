<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="application/x-java-jnlp-file"%>
<%!
public static final String mainjar = "multiwebstart-base-client";
public static final String childapp = "/multiwebstart-child-web";
public static final String jnlpResourcePath = "webstart/";
public static java.util.Set<java.lang.String> resources = null;
public static String codeBase = null;

public String getCodeBase(HttpServletRequest request) {
	//should also look at the web project jnlp/template-jsp.vm
	//String codebase = "http://localhost:8181/multiwebstart-base-web/";
	if (codeBase==null || codeBase.isEmpty()) {
		String url = request.getRequestURL().toString();
		String servletPath = request.getServletPath();
		codeBase = url.substring(0,url.indexOf(servletPath));		
	}
	return codeBase;
}

public java.util.Set<java.lang.String> getResourcePaths() {
	synchronized (this) {
		if (resources==null || resources.isEmpty()) {
			// This files shows the list of jar files required
			// Sample output:
			// resources(/webstart/=[/webstart/commons-lang-2.1.jar, /webstart/launch.jsp, /webstart/multiwebstart-child-client-1.0.jar]
			resources = getServletContext().getResourcePaths("/" + jnlpResourcePath);			
		}
	}
	return resources;
}
%>
<%
String codebase = getCodeBase(request);
java.util.Set<java.lang.String> resourcePaths = getResourcePaths();
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
<%
	if (resourcePaths!=null && !resourcePaths.isEmpty()) {
		java.util.Iterator<String> it = resourcePaths.iterator();		
		while (it.hasNext()) {
			String resource = it.next();
			StringBuilder sb = new StringBuilder();
			// Only include jar file here
			if (resource.endsWith(".jar")) {
				// Take out the left most / from the resource path
				String filepath = resource.substring(1);
				sb.append("<jar href='" + filepath + "' ");
				if (resource.indexOf(mainjar)>0) {
					sb.append("main='true'");
				}
				sb.append(" />\n");
				out.println(sb.toString());
			}
		}
	}
%><%
// JSP out flush is required here before the request dispatcher include,
// otherwise, the output from the include would come before the output from this jsp
out.flush();
// include jsp from another webapp in the same server
javax.servlet.ServletContext context = application.getContext(childapp);
if (context!=null) {
   javax.servlet.RequestDispatcher rd = context.getRequestDispatcher("/webstart/resourceversion.jsp");
   if (rd!=null)
   		rd.include(request, response);
}
%>
	</resources>
	<application-desc main-class="com.weboctave.multiwebstart.base.client.HelloWorldSwing"/>
	</application-desc>
</jnlp>