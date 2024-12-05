package uz.pdp.homework_8courcejsp.servlet;

import uz.pdp.homework_8courcejsp.entity.Groups;
import uz.pdp.homework_8courcejsp.entity.Module;
import uz.pdp.homework_8courcejsp.entity.Student;
import uz.pdp.homework_8courcejsp.repo.GroupRepo;
import uz.pdp.homework_8courcejsp.repo.ModuleRepo;
import uz.pdp.homework_8courcejsp.repo.StudentRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/student/update")
public class UpdateStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("studentName");
        int studentId = Integer.parseInt(req.getParameter("studentId"));
        int groupId = Integer.parseInt(req.getParameter("groupId"));

        GroupRepo groupRepo=new GroupRepo();
        Optional<Groups> optionalGroups = groupRepo.findById(groupId);

        Student student = Student.builder()
                .id(studentId)
                .group(optionalGroups.get())
                .name(name)
                .build();
        StudentRepo studentRepo= new StudentRepo();
        studentRepo.update(student);

        resp.sendRedirect("/student.jsp?groupId="+groupId);
    }
}
