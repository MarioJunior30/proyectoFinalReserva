<%@ page session="false" %>

<body>
<%
    HttpSession sessionOk = request.getSession();
    if (sessionOk != null) {
        sessionOk.invalidate();
        response.sendRedirect("Login.jsp");
    }
%>
 </body>