package procheck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import procheck.model.Project;
import procheck.model.User;
import procheck.service.ProjectService;
import procheck.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping(name = "/proprocess")
public class ProcessController {
    @Autowired
    private ProjectService projectService;
    @Autowired
    private UserService userService;
    @GetMapping("/midprocess")
    public String goMidProcess(Model model){
        String name= SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(name);
        Set<Project> projects=user.getProjects();
        List<Project> listproject=new ArrayList<>();
        for(Project project:projects){
            if(project.isNeedCheck()&&project.isAdviserIsCheck()&&project.isAcademyIsCheck()&&project.isCollegeIsCheck()){
                listproject.add(project);
            }
        }

        model.addAttribute("projects",listproject);
        return "/report/midReport";
    }
}
