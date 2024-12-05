<%@ page import="uz.pdp.homework_8courcejsp.repo.CourseRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.DTORepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.entity.req.PaymentDTO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 03/12/2024
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Report</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>

<%
    Optional<List<PaymentDTO>> list = DTORepo.getDTO();
%>
<div class="m-2 card">

    <table class="table table-stripped">
        <thead>
        <tr>
            <th>Course name</th>
            <th>Students count</th>
            <th>payments amount</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (PaymentDTO dto : list.get()) {
        %>
        <tr>
            <td><%=dto.getName()%></td>
            <td><%=dto.getCount()%></td>
            <td><%=dto.getAmount()%></td>
        </tr>
        <%
            }%>
        </tbody>
    </table>

</div>

</body>
</html>
