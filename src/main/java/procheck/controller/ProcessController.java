package procheck.controller;

import com.google.gson.Gson;
import org.apache.logging.log4j.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import procheck.model.Project;
import procheck.model.User;
import procheck.service.ProjectService;
import procheck.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/proprocess")
public class ProcessController {
    private final static Logger logger=LogManager.getLogger(ProcessController.class);

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

    @GetMapping("/editMidReport")
    public String eidtMidReport(Model model,int id){
        Project project =projectService.findById(id);
        model.addAttribute("projectname",project.getProjectName());
        model.addAttribute("projectid",project.getId());
        if(project.getMidReport()!=null){
            model.addAttribute("midreport",project.getMidReport());
        }
        return "/report/editMidReport";
    }

    @PostMapping("/saveMidReport")
    @ResponseBody
    public String saveMidReport(Integer projectid,String midReport){
        Gson gson=new Gson();
        String json;
        if(projectid!=null&&!"".equals(midReport)){
            Project project=projectService.findById(projectid);
            project.setMidReport(midReport);
            projectService.projectSave(project);
            json=gson.toJson("保存成功");
        }else{
            json=gson.toJson("内容不能为空");
        }


        return json;
    }

    @GetMapping("/finalprocess")
    public String gofinalProcess(Model model){
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
        return "/report/finalReport";
    }

    @GetMapping("/editfinalReport")
    public String eidtfinalReport(Model model,int id){
        Project project =projectService.findById(id);
        model.addAttribute("projectname",project.getProjectName());
        model.addAttribute("projectid",project.getId());
        if(project.getFinalReport()!=null){
            model.addAttribute("finalreport",project.getFinalReport());
        }
        return "/report/editFinalReport";
    }

    @PostMapping("/saveFinalReport")
    @ResponseBody
    public String saveFinalReport(Integer projectid,String finalReport){
        Gson gson=new Gson();
        String json;
        if(projectid!=null&&!"".equals(finalReport)){
            Project project=projectService.findById(projectid);
            project.setFinalReport(finalReport);
            projectService.projectSave(project);
            json=gson.toJson("保存成功");
        }else{
            json=gson.toJson("内容不能为空");
        }


        return json;
    }

}
