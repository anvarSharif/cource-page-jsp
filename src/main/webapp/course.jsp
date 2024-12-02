<%@ page import="uz.pdp.homework_8courcejsp.repo.CourseRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02/12/2024
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    Optional<List<Course>> coursesOptional = CourseRepo.FindAll();

%>
<div class="card m-2">

    <table class=" table table-stripped">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Course course : coursesOptional.get()) {
        %>
        <tr>
            <td><%=course.getId()%></td>
            <td><%=course.getName()%></td>
            <td>
                <form action="/module.jsp">
                    <input type="hidden" name="courseId" value="<%=course.getId()%>">
                    <button class="btn btn-dark">Modules</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>

</div>
</body>
</html>
