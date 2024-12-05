package uz.pdp.homework_8courcejsp.servlet;

import uz.pdp.homework_8courcejsp.entity.Course;
import uz.pdp.homework_8courcejsp.entity.Groups;
import uz.pdp.homework_8courcejsp.entity.Module;
import uz.pdp.homework_8courcejsp.repo.CourseRepo;
import uz.pdp.homework_8courcejsp.repo.GroupRepo;
import uz.pdp.homework_8courcejsp.repo.ModuleRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/group/update")
public class UpdateGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("groupName");
        int moduleId = Integer.parseInt(req.getParameter("moduleId"));
        int groupId = Integer.parseInt(req.getParameter("groupId"));

        ModuleRepo moduleRepo=new ModuleRepo();
        Optional<Module> optionalModule = moduleRepo.findById(moduleId);

        Groups groups = Groups.builder()
                .id(groupId)
                .name(name)
                .module(optionalModule.get())
                .build();
        GroupRepo groupRepo=new GroupRepo();
        groupRepo.update(groups);
        resp.sendRedirect("/group.jsp?moduleId="+moduleId);
    }
}
