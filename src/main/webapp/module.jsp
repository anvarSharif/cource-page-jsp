<%@ page import="uz.pdp.homework_8courcejsp.entity.Module" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.ModuleRepo" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02/12/2024
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Module</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    List<Module> modules = new ArrayList<>();

    Integer courseId = Integer.parseInt(request.getParameter("courseId"));
    Optional<List<Module>> optionalModuleList = ModuleRepo.findByCourseId(courseId);
    if (optionalModuleList.isPresent()) {
        modules = optionalModuleList.get();
    }
%>

<table class="table table-stripped">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Module module : modules) {
    %>
    <tr>
        <td><%=module.getId()%>
        </td>
        <td><%=module.getName()%>
        </td>
        <td>
            <form action="/Module.jsp">
                <input type="hidden" name="moduleId" value="<%=module.getId()%>">
                <button class="btn btn-dark">Groups</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>

    </tbody>
</table>


</body>
</html>
