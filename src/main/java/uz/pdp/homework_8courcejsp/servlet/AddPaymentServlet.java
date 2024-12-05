package uz.pdp.homework_8courcejsp.servlet;

import uz.pdp.homework_8courcejsp.entity.Payment;
import uz.pdp.homework_8courcejsp.entity.Student;
import uz.pdp.homework_8courcejsp.entity.enums.PayType;
import uz.pdp.homework_8courcejsp.repo.PaymentRepo;
import uz.pdp.homework_8courcejsp.repo.StudentRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/payment/add")
public class AddPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer amount = Integer.parseInt(req.getParameter("amount"));
        Integer studentId = Integer.parseInt(req.getParameter("studentId"));
        Integer groupId = Integer.parseInt(req.getParameter("groupId"));
        PayType payType = PayType.valueOf(req.getParameter("payType"));
        Optional<Student> optionalStudent = StudentRepo.findById(studentId);
        Payment payment=new Payment(
                amount,
                payType,
                optionalStudent.get()
        );
        PaymentRepo paymentRepo=new PaymentRepo();
        paymentRepo.save(payment);
        resp.sendRedirect("/student.jsp?groupId="+groupId);
    }
}
