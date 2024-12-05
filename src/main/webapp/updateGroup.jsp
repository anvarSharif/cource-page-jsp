<%@ page import="uz.pdp.homework_8courcejsp.repo.CourseRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Course" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.ModuleRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Module" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.GroupRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Groups" %><%--
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
    Integer moduleId = Integer.parseInt(request.getParameter("moduleId"));

    int groupId = Integer.parseInt(request.getParameter("groupId"));
    GroupRepo groupRepo=new GroupRepo();
    Optional<Groups> optionalGroup = groupRepo.findById(groupId);
%>
<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <form action="/group/update" method="post">
                <div class="input-group">
                    <input type="text" value="<%=optionalGroup.get().getName()%>" class="form-control" name="groupName">
                    <input type="hidden" value="<%=moduleId%>"  name="moduleId">
                    <input type="hidden" value="<%=optionalGroup.get().getId()%>"  name="groupId">
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
