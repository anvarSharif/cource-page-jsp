<%@ page import="uz.pdp.homework_8courcejsp.repo.CourseRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Course" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.ModuleRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Module" %><%--
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

    int moduleId = Integer.parseInt(request.getParameter("moduleId"));
    ModuleRepo moduleRepo=new ModuleRepo();
    Optional<Module> moduleOption = moduleRepo.findById(moduleId);
%>
<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <form action="/module/update" method="post">
                <div class="input-group">
                    <input type="text" value="<%=moduleOption.get().getName()%>" class="form-control" name="moduleName">
                    <input type="hidden" value="<%=courseId%>"  name="courseId">
                    <input type="hidden" value="<%=moduleOption.get().getId()%>"  name="moduleId">
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
