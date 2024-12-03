<%@ page import="uz.pdp.homework_8courcejsp.entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.StudentRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.PaymentRepo" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 03/12/2024
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    List<Student> students = new ArrayList<>();
    Integer groupId = Integer.parseInt(request.getParameter("groupId"));
    Optional<List<Student>> optionalStudentList = StudentRepo.findByGroupId(groupId);
    if (optionalStudentList.isPresent()) {
        students = optionalStudentList.get();
    }
%>

<table class="table table-stripped">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Payments</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Student student : students) {
    %>
    <tr>
        <td><%=student.getId()%>
        </td>
        <td><%=student.getName()%>
        </td>
        <td><%=PaymentRepo.sumAmountForStudent(student.getId())%></td>
        <td>
            <form action="/addPayment.jsp">
                <input type="hidden" name="studentId" value="<%=student.getId()%>">
                <button class="btn btn-dark">Add payments</button>
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
