<%@ page import="uz.pdp.homework_8courcejsp.repo.CourseRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Course" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.ModuleRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Module" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.GroupRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Groups" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.StudentRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 05/12/2024
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Course</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">

</head>
<body>
<%
    Integer groupId = Integer.parseInt(request.getParameter("groupId"));

    int studentId = Integer.parseInt(request.getParameter("studentId"));
    StudentRepo studentRepo=new StudentRepo();
    Optional<Student> optionalStudent = studentRepo.findById(studentId);
%>
<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <form action="/student/update" method="post">
                <div class="input-group">
                    <input type="text" value="<%=optionalStudent.get().getName()%>" class="form-control" name="studentName">
                    <input type="hidden" value="<%=groupId%>"  name="groupId">
                    <input type="hidden" value="<%=optionalStudent.get().getId()%>"  name="studentId">
                    <br>
                    <button class="btn btn-dark">
                        Update
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
