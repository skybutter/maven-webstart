<%
//This files shows the list of jar files required
String webapp = "/multiwebstart-child-web";
String jnlpResourcePath = "webstart/";
java.util.Set<java.lang.String> resourcePaths = getServletContext().getResourcePaths("/" + jnlpResourcePath);
// resourcePaths(/webstart/=[/webstart/commons-lang-2.1.jar, /webstart/launch.jsp, /webstart/swingwebstart2-client-1.0.jar]
%>
<%
	if (resourcePaths!=null && !resourcePaths.isEmpty()) {
		java.util.Iterator<String> it = resourcePaths.iterator();		
		while (it.hasNext()) {
			String resource = it.next();
			StringBuilder sb = new StringBuilder();
			// Only include jar file here, must start with "/", otherwise won't download properly
			if (resource.endsWith(".jar")) {
				String filepath = webapp + resource;
				sb.append("<jar href='" + filepath + "' />\n");
				out.println(sb.toString());
			}
		}
	}
%>
