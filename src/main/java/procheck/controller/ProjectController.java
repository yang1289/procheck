package procheck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import procheck.model.Academy;
import procheck.model.Project;
import procheck.model.Role;
import procheck.model.User;
import procheck.service.AcademyService;
import procheck.service.ProjectService;
import procheck.service.UserService;
import procheck.util.ProjectCheckMessage;
import procheck.util.RoleCheck;

import java.util.*;


/**
 * Created by Administrator on 2017/3/2.
 */
@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProjectService projectService;
    @Autowired
    private AcademyService academyService;



    @GetMapping("/apply")
    public String applyingProject(){
        return "/project/projectapply";
    }

    @PostMapping("/apply")
    public String applyedProject(@RequestParam String name,String projectname,String content,Model model) throws Exception{
//        Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
        Project project=new Project();
        User user=userService.findUserByUsername(name);
        Academy academy=user.getAcademy();
        Date date=new Date();
        if(academy!=null){
            project.setAcademy(user.getAcademy());
            project.setProjectName(projectname);
            project.setProjectInfo(content);
            project.setCreateTime(date);
            project.setUser(user);
            project.setAcademyIsCheck(false);
            project.setAdviserIsCheck(false);
            project.setCollegeIsCheck(false);
            projectService.save(project);
            model.addAttribute("message","申请成功");
        }else{
            model.addAttribute("message","你的个人信息没有配置");
        }

        return "/project/projectapply";
    }

    @GetMapping("/list")
    public String projectAppling( Model model){

        String name=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(name);
        Set<Role> roles=user.getRoles();
        Role role=new Role();
        for (Role _role:roles){
            role=_role;
        }
        RoleCheck roleCheck=new RoleCheck();
        System.out.println("RoleName:========="+role.getName());
        if(user.getAcademy()!=null){
            if(roleCheck.isStudent(role.getName())){
                List<Project> projects=projectService.findByUserId(user.getId());
                model.addAttribute("projects",projects);

                for (Project project:projects){
                    System.out.println("isPublish:======="+project.isPublished());
                }
            }else if(roleCheck.isCpgroup(role.getName())){
                List<Project> projects=projectService.findAll();
                model.addAttribute("projects",projects);
            }else if(roleCheck.isAdviser(role.getName())){
                List<Project> projects=projectService.findByAcademyId(user.getAcademy().getId());
                model.addAttribute("projects",projects);
            }else if(roleCheck.isFpgroup(role.getName())){
                List<Project> projects=projectService.findByAcademyId(user.getAcademy().getId());
                model.addAttribute("projects",projects);
            }
        }else{
            model.addAttribute("message","请先配置个人信息");
        }

        model.addAttribute("rolename",role.getName());
        return "/project/projectlist";

    }
    @GetMapping("/check")
    public String checking(@RequestParam int id,Model model){
        Project project=projectService.findById(id);
        model.addAttribute("project",project);
        return "/project/projectcheck";
    }
    @PostMapping("/checked")
    public String checked(@RequestParam int id,String advicecontent,boolean checked,Model model){
        RoleCheck roleCheck=new RoleCheck();
        String name=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(name);
        Set<Role> roles=user.getRoles();
        Role role=new Role();
        for (Role _role:roles){
            role=_role;
        }
        Project project=projectService.findById(id);
        if(roleCheck.isAdviser(role.getName())){
            if(!advicecontent.equals(null)){
                project.setAdviserAdvice(advicecontent);
            }
            project.setAdviserIsCheck(checked);
            try {
                projectService.save(project);
                model.addAttribute("message", ProjectCheckMessage.SUCCESS);

                model.addAttribute("advicecontent",advicecontent);
                model.addAttribute("checked",checked);
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("message",ProjectCheckMessage.CHECKEERROR);
            }
        }else if(roleCheck.isFpgroup(role.getName())){
                if(project.isAdviserIsCheck()){
                if(!advicecontent.equals(null)){
                    project.setAcademyAdvice(advicecontent);
                }
                project.setAcademyIsCheck(checked);
                try {
                    projectService.save(project);
                    model.addAttribute("message",ProjectCheckMessage.SUCCESS);
                    model.addAttribute("advicecontent",advicecontent);
                    model.addAttribute("checked",checked);
                } catch (Exception e) {
                    e.printStackTrace();
                    model.addAttribute("message",ProjectCheckMessage.CHECKEERROR);
                }
            }else{
                model.addAttribute("message",ProjectCheckMessage.NOADVISERCHECK);
            }
        }else if(roleCheck.isCpgroup(role.getName())){
            if(project.isAcademyIsCheck()){
                if(!advicecontent.equals(null)){
                    project.setCollegeAdvice(advicecontent);
                }
                project.setCollegeIsCheck(checked);
                try {
                    projectService.save(project);
                    model.addAttribute("message",ProjectCheckMessage.SUCCESS);

                    model.addAttribute("advicecontent",advicecontent);
                    model.addAttribute("checked",checked);
                } catch (Exception e) {
                    e.printStackTrace();
                    model.addAttribute("message",ProjectCheckMessage.CHECKEERROR);
                }
            }else{
               model.addAttribute("message",ProjectCheckMessage.NOFPGROUPCHECK);
            }
        }
        model.addAttribute("project",project);
        return "/project/projectcheck";
    }
    @GetMapping("/profile")
    public String profile(@RequestParam String name){
        User user=userService.findUserByUsername(name);
        Set<Project> projects=user.getProjects();
        for(Project project:projects){
            System.out.println("projectName:======="+project.getProjectName());
    }
        return "welcome";
    }
    @GetMapping("/checklist")
    public String checklist(Model model){
        RoleCheck roleCheck=new RoleCheck();
        String name=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(name);
        Set<Role> roles=user.getRoles();
        Role role=new Role();
        for (Role _role:roles){
            role=_role;
        }
        List<Project> projects=new ArrayList<>();
        if(user.getAcademy()!=null){
            if(roleCheck.isAdviser(role.getName())){
                projects=projectService.findByAcademyIdAndAdviserIsCheck(user.getAcademy().getId(),false);
            }else if(roleCheck.isFpgroup(role.getName())){
                projects=projectService.findByAcademyIdAndAdviserIsCheckAndAcademyIsCheck(user.getAcademy().getId(),true,false);
            }else if(roleCheck.isCpgroup(role.getName())){
                projects=projectService.findByAcademyIsCheckAndCollegeIsCheck(true,false);
            }
        }else{
            model.addAttribute("message","请先配置个人信息");
        }

        model.addAttribute("user",user);
        model.addAttribute("projects",projects);
        return "/project/checklist";
    }

    @GetMapping("/find")
    public String findProject(@RequestParam int id,Model model){
        Project project=projectService.findById(id);
        model.addAttribute("project",project);
        return "/project/findproject";
    }

    @GetMapping("/edit")
    public String projectEditing(@RequestParam int id,Model model){
        Project project=projectService.findById(id);
        model.addAttribute("project",project);
        return "/project/projectEdit";

    }

    @PostMapping("/edit")
    public String projectEdit(@RequestParam int id,String content,Model model) throws Exception {
        String name=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(name);
        Project project=projectService.findById(id);
        if(user.getAcademy()!=null){
            project.setProjectInfo(content);
            project.setAcademy(user.getAcademy());
            projectService.save(project);
            model.addAttribute("message","修改成功");

        }else{
            model.addAttribute("message","请先配置个人信息");
        }
        model.addAttribute("project",projectService.findById(id));
        return "/project/projectEdit";
    }

}
