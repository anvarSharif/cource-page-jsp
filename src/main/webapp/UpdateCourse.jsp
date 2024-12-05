<%@ page import="uz.pdp.homework_8courcejsp.repo.CourseRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Course" %>
<%@ page import="java.util.Optional" %><%--
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
    Integer courseId = Integer.parseInt(request.getParameter("courseId"));
    CourseRepo courseRepo=new CourseRepo();
    Optional<Course> course = courseRepo.findById(courseId);
%>
<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <form action="/course/update" method="post">
                <div class="input-group">
                    <input type="text" value="<%=course.get().getName()%>" class="form-control" name="courseName">
                    <input type="hidden" value="<%=course.get().getId()%>"  name="courseId">
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
