<%!
public static java.util.Set<java.lang.String> resourcePaths = null;

public static final String webapp = "/multiwebstart2-child-web";
public static final String jnlpResourcePath = "webstart/";

public java.util.Set<java.lang.String> getResourcePaths() {
	synchronized (this) {
		if (resourcePaths==null || resourcePaths.isEmpty()) {
			// This files shows the list of jar files required
			// Sample output:
			// resourcePaths(/webstart/=[/webstart/commons-lang-2.1.jar, /webstart/launch.jsp, /webstart/multiwebstart2-child-client-1.0.jar]
			resourcePaths = getServletContext().getResourcePaths("/" + jnlpResourcePath);			
		}
	}
	return resourcePaths;
}
%>
<%
java.util.Set<java.lang.String> resources = getResourcePaths();
	if (resources!=null && !resources.isEmpty()) {
		java.util.Iterator<String> it = resources.iterator();		
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
	} else {
		System.out.println("ERROR: ***** No resources found for " + webapp +  " ******");
	}
%>
