<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 03/12/2024
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Payment</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>


<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white text-center">
            <h3>Add New Payment</h3>
        </div>
        <div class="card-body">
            <form action="/payment/add" method="post">
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter payment amount" required>
                </div>

                <div class="form-group">
                    <label for="payType">Payment Type</label>
                    <select class="form-control" id="payType" name="payType" required>
                        <option value="">Select Payment Type</option>
                        <option value="CASH">Cash</option>
                        <option value="CARD">Card</option>
                        <option value="ONLINE">Online</option>
                    </select>
                </div>

                <input type="hidden" name="studentId" value="<%=request.getParameter("studentId")%>">
                <input type="hidden" name="groupId" value="<%=request.getParameter("groupId")%>">
                <button type="submit" class="btn btn-success btn-block">Submit</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
