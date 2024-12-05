<%@ page import="uz.pdp.homework_8courcejsp.entity.Module" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.ModuleRepo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Groups" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.GroupRepo" %>
<%@ page import="java.util.Objects" %><%--
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

    String search = Objects.requireNonNullElse(request.getParameter("search"), "");
    Integer pageNumber = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("page"), "1"));

    Optional<List<Groups>> optionalGroupList = GroupRepo.findByModuleId(moduleId, search, pageNumber);

    if (optionalGroupList.isPresent()) {
        groups = optionalGroupList.get();
    }
%>
<%


%>
<div class="w-25 p-4">
    <form action="">
        <div class="input-group">
            <input name="search" type="text" class="form-control" placeholder="search...">
            <input type="hidden" name="moduleId" value="<%=moduleId%>">
            <button class="btn btn-dark">Search</button>
        </div>
    </form>
</div>

<div class="card m-2">
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
</div>
<%
    Long count = GroupRepo.count(search,moduleId);
    int countPage = (int) Math.ceil(count / 3.0);
    for (int i = 1; i <= countPage; i++) {


%>
<a href="?page=<%=i%>&&search=<%=search%>&&moduleId=<%=moduleId%>" class="btn btn-dark"><%=i%>
</a>
<%}%>
</body>
</html>
