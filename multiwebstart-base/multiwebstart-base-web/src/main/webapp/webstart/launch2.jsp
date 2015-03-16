<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="application/x-java-jnlp-file"%>
<%
//should also look at the web project jnlp/jnlp/template-jsp.vm
//String codebase = "http://localhost:8181/multiwebstart-base-web/";
String url = request.getRequestURL().toString();
String servletPath = request.getServletPath();
String codebase = url.substring(0,url.indexOf(servletPath));

String mainjar = "multiwebstart-base-client";
String jnlpResourcePath = "webstart/";
java.util.Set<java.lang.String> resourcePaths = getServletContext().getResourcePaths("/" + jnlpResourcePath);
// resourcePaths(/webstart/=[/webstart/commons-lang-2.1.jar, /webstart/launch.jsp, /webstart/multiwebstart-base-client-1.0.jar]
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
javax.servlet.ServletContext context = application.getContext("/multiwebstart-child-web");
System.out.println("servletContext=" + context);
if (context!=null) {
   javax.servlet.RequestDispatcher rd = context.getRequestDispatcher("/webstart/resourceversion.jsp");
   System.out.println("RequestDispatcher=" + rd);
   if (rd!=null)
   		rd.include(request, response);
}
%>
	</resources>
	<application-desc main-class="com.weboctave.multiwebstart.base.client.HelloWorldSwing"/>
	</application-desc>
</jnlp>