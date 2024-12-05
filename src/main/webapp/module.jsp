<%@ page import="uz.pdp.homework_8courcejsp.entity.Module" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.ModuleRepo" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>Module</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    List<Module> modules = new ArrayList<>();

    String search = Objects.requireNonNullElse(request.getParameter("search"), "");
    Integer pageNumber = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("page"), "1"));

    Integer courseId = Integer.parseInt(request.getParameter("courseId"));
    Optional<List<Module>> optionalModuleList = ModuleRepo.findByCourseId(courseId, search, pageNumber);
    if (optionalModuleList.isPresent()) {
        modules = optionalModuleList.get();
    }
%>


<div class="w-25 p-4">
    <form action="">
        <div class="input-group">
            <input type="hidden" name="courseId" value="<%=courseId%>">
            <input name="search" type="text" class="form-control" placeholder="search...">
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
            for (Module module : modules) {
        %>
        <tr>
            <td><%=module.getId()%>
            </td>
            <td><%=module.getName()%>
            </td>
            <td>
                <form action="/group.jsp">
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
</div>
    <%
        Long count = ModuleRepo.count(search,courseId);
        int countPage = (int) Math.ceil(count / 3.0);
        for (int i = 1; i <= countPage; i++) {
    %>
    <a href="?page=<%=i%>&&search=<%=search%>&&courseId=<%=courseId%>" class="btn btn-dark"><%=i%>
    </a>
    <%}%>

</body>
</html>
