<%@ page import="uz.pdp.homework_8courcejsp.entity.Module" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.ModuleRepo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Groups" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.GroupRepo" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02/12/2024
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Groups</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    List<Groups> groups = new ArrayList<>();

    Integer moduleId = Integer.parseInt(request.getParameter("moduleId"));
    Optional<List<Groups>> optionalGroupList = GroupRepo.findByModuleId(moduleId);
    if (optionalGroupList.isPresent()) {
        groups = optionalGroupList.get();
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
        for (Groups group : groups) {
    %>
    <tr>
        <td><%=group.getId()%>
        </td>
        <td><%=group.getName()%>
        </td>
        <td>
            <form action="/student.jsp">
                <input type="hidden" name="groupId" value="<%=group.getId()%>">
                <button class="btn btn-dark">Students</button>
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
