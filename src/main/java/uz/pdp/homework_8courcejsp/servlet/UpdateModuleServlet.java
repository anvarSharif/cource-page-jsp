package uz.pdp.homework_8courcejsp.servlet;

import uz.pdp.homework_8courcejsp.entity.Course;
import uz.pdp.homework_8courcejsp.entity.Module;
import uz.pdp.homework_8courcejsp.repo.CourseRepo;
import uz.pdp.homework_8courcejsp.repo.ModuleRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/module/update")
public class UpdateModuleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("moduleName");
        int moduleId = Integer.parseInt(req.getParameter("moduleId"));
        int courseId = Integer.parseInt(req.getParameter("courseId"));

        CourseRepo courseRepo=new CourseRepo();
        Optional<Course> optionalCourse = courseRepo.findById(courseId);

        ModuleRepo moduleRepo=new ModuleRepo();
        Module module = Module.builder()
                .course(optionalCourse.get())
                .name(name)
                .id(moduleId)
                .build();
        moduleRepo.update(module);

        resp.sendRedirect("/module.jsp?courseId="+courseId);
    }
}
