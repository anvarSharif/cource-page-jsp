<%@ page import="uz.pdp.homework_8courcejsp.entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.StudentRepo" %>
<%@ page import="uz.pdp.homework_8courcejsp.repo.PaymentRepo" %>
<%@ page import="java.util.Objects" %><%--
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

    String search = Objects.requireNonNullElse(request.getParameter("search"), "");
    Integer pageNumber = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("page"), "1"));

    Integer groupId = Integer.parseInt(request.getParameter("groupId"));
    Optional<List<Student>> optionalStudentList = StudentRepo.findByGroupId(groupId, search, pageNumber);
    if (optionalStudentList.isPresent()) {
        students = optionalStudentList.get();
    }
%>

<div class="w-25 p-4">
    <form action="">
        <div class="input-group">
            <input name="search" type="text" class="form-control" placeholder="search...">
            <input type="hidden" name="groupId" value="<%=groupId%>">

            <button class="btn btn-dark">Search</button>
        </div>
    </form>
</div>


<div>
    <form action="/report.jsp">
        <button class="btn btn-dark m-2">
            Report
        </button>
    </form>
</div>
<div class="card m-2">
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
            <td><%=PaymentRepo.sumAmountForStudent(student.getId())%>
            </td>
            <td>
                <form action="/addPayment.jsp">
                    <input type="hidden" name="studentId" value="<%=student.getId()%>">
                    <input type="hidden" name="groupId" value="<%=groupId%>">
                    <button class="btn btn-success">Add payments</button>
                </form>
            </td>
            <td>
                <form action="/updateStudent.jsp">
                    <input type="hidden" name="groupId" value="<%=groupId%>">
                    <input type="hidden" name="studentId" value="<%=student.getId()%>">
                    <button class="btn btn-dark">update</button>
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
    Long count = StudentRepo.count(search,groupId);
    int countPage = (int) Math.ceil(count / 3.0);
    for (int i = 1; i <= countPage; i++) {


%>
<a href="?page=<%=i%>&&search=<%=search%>&&groupId=<%=groupId%>" class="btn btn-dark"><%=i%>
</a>
<%}%>
</body>
</html>
