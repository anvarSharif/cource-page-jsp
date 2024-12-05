package uz.pdp.homework_8courcejsp.servlet;

import uz.pdp.homework_8courcejsp.entity.Course;
import uz.pdp.homework_8courcejsp.repo.CourseRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/course/update")
public class UpdateCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("courseName");
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        CourseRepo courseRepo=new CourseRepo();
        Course course = Course.builder()
                .id(courseId)
                .name(name)
                .build();
        courseRepo.update(course);
        resp.sendRedirect("/course.jsp");
    }
}
