package procheck.controller;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import procheck.dao.ExpenditureRepository;
import procheck.model.*;
import procheck.service.*;
import procheck.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.parser.Entity;
import java.io.IOException;
import java.util.*;


/**
 * Created by Administrator on 2017/3/2.
 */
@Controller
@RequestMapping("/project")
public class ProjectController {
    private static Logger logger=LogManager.getLogger(ProjectController.class);
    @Autowired
    private UserService userService;

    @Autowired
    private ProjectService projectService;
    @Autowired
    private AcademyService academyService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private ApplyUserService applyUserService;
    @Autowired
    private ProgressPlanService progressPlanService;
    @Autowired
    private ExpenditureService expenditureService;
    @GetMapping("/apply")
    public void applyingProject(HttpServletResponse response){
        String name=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(name);
        Set<Project> projects=user.getProjects();
        Integer id=0;
        for(Project pro:projects){
            if(!pro.isCreated()){
                id= pro.getId();
            }
        }

        try {
            if(id!=0){
                response.sendRedirect("/project/applystep1?method=apply&&id="+id);
            }else{
                response.sendRedirect("/project/applystep1?method=apply");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    @GetMapping("/applystep1")
    public String stepone(Integer id,Model model,@RequestParam String method){
        if(id!=null){
            Project project=projectService.findById(id);
            model.addAttribute("project",project);

        }
        model.addAttribute("advisers",userService.findAdviser());
        logger.info("id="+id);
        if(method.equals("edit")){
            return "/project/edit/step1";
        }else {
            return "/project/apply/step1";
        }


    }
    @PostMapping("/applystep1")
    public String saveStepOne(String projectName,int adviserId,String jobTitle,String libName,String teachUnit,Model model,Integer id,@RequestParam String method) throws Exception{
        String usernum=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(usernum);
        Project project=new Project();
        if(id!=null){
            project=projectService.findById(id);
        }else{
            project.setNeedCheck(false);
            project.setCreateTime(new Date());
            project.setUser(user);
        }
        if(projectName!=""){
            project.setProjectName(projectName);
        }else{
            model.addAttribute("message","项目名称不能为空");
            return "/project/step1";
        }
        if(adviserId>=0){
            User adviser=userService.findById(adviserId);
            project.setAdviser(adviser);
        }
        project.setJobTitle(jobTitle);
        project.setLibName(libName);
        project.setTeachUnit(teachUnit);
        project.setAcademy(user.getAcademy());
        Project pro=projectService.projectSave(project);
        logger.info("project.id======"+pro.getId());
        model.addAttribute("project",pro);
        model.addAttribute("advisers",userService.findAdviser());
        if(method.equals("edit")){
            model.addAttribute("message","保存成功");
            return "/project/edit/step1";
        }else{
            return "/project/apply/step2";
        }

    }
    @GetMapping("/applystep2")
    public String steptwo(Integer id,Model model,@RequestParam String method){
        if(id!=null){
            Project project=projectService.findById(id);
            model.addAttribute("project",project);
        }
        if(method.equals("edit")){
            return "/project/edit/step2";
        }else{
            return "/project/apply/step2";
        }

    }
    @PostMapping("/applystep2")
    public String saveSteptwo(Model model, ApplyUserModel applyUserModel,int id,@RequestParam String method){
        if(applyUserModel.getApplyusers()!=null){
            logger.info("applyuser.size:::::::="+ applyUserModel.getApplyusers().size());
            Project project=projectService.findById(id);
            List<ApplyUser> applyUserList=applyUserModel.getApplyusers();
            boolean isNotEmpty=false;
            boolean isLoop;
            for(ApplyUser applyUser:applyUserList){
                logger.info("applyUser.getApplyName++++++++"+applyUser.getApplyName());
                if("".equals(applyUser.getApplyName())||"".equals(applyUser.getApplyNumber())||" ".equals(applyUser.getApplyMajor())||"".equals(applyUser.getApplyGrade())){
                    isNotEmpty= false;
                    isLoop=true;
                }else{
                    isLoop=false;
                    isNotEmpty=true;
                }
                if(isLoop){
                    break;
                }
            }
            if(isNotEmpty) {
                Set<ApplyUser> applyUsers = new HashSet<>();
                Set<ApplyUser> oldApplyUsers = project.getApplyUsers();
                if (oldApplyUsers.size() != 0) {
                    applyUserService.deleteApplyUsers(oldApplyUsers);
                }
                for (ApplyUser applyUser : applyUserList) {
                    applyUsers.add(applyUser);
                }

                project.setApplyUsers(applyUsers);
                projectService.projectSave(project);
                model.addAttribute("project",project);
                model.addAttribute("message","保存成功");
            }else{
                model.addAttribute("project",project);
                model.addAttribute("message","没有填写小组成员，请填写");
                return "/project/apply/step2";
            }
            model.addAttribute("project",project);
            if(method.equals("edit")){

                return "/project/edit/step2";
            }else{
                return "/project/apply/step3";
            }
        }else{
            model.addAttribute("message","申请人不能为空");
            return "/project/apply/step2";
        }
    }
    @GetMapping("/applystep3")
    public String stepthree(Integer id,Model model,@RequestParam String method){
        if(id!=null){
            Project project=projectService.findById(id);
            logger.info("研究现状:"+project.getSearchCondition());
            model.addAttribute("project",project);
        }
        logger.info("step3.method::"+method);
        if(method.equals("edit")){
            return "/project/edit/step3";
        }else{
            return "/project/apply/step3";
        }
    }
    @PostMapping("/applystep3")
    public String saveStepthree(int id,String searchCondition,String searchPlan,String createPoint,String searchConditionSupport,String achievenmentMethod,Model model,@RequestParam String method){
        Project project=projectService.findById(id);
        project.setSearchCondition(searchCondition);
        project.setSearchPlan(searchPlan);
        project.setCreatePoint(createPoint);
        project.setSearchConditionSupport(searchConditionSupport);
        project.setAchievenmentMethod(achievenmentMethod);
        projectService.projectSave(project);
        model.addAttribute("project",project);
        if(method.equals("edit")){
            model.addAttribute("message","保存成功");
            return "/project/edit/step3";
        }else{
            return "/project/apply/step4";
        }
    }
    @GetMapping("/applystep4")
    public String stepfour(Integer id,Model model,@RequestParam String method){
        if(id!=null){
            Project project=projectService.findById(id);
            model.addAttribute("project",project);
        }
        if(method.equals("edit")){
            return "/project/edit/step4";
        }else{
            return "/project/apply/step4";
        }
    }
    @PostMapping("/applystep4")
    public String saveStepfour(Model model, ProgressPlanModel progressPlanModel,int id,@RequestParam String method){
        Project project=projectService.findById(id);
        List<ProgressPlan> progressPlans=progressPlanModel.getProgressPlans();
        boolean isEmpty=false;
        boolean isloop;
        for(ProgressPlan progressPlan:progressPlans){
            if("".equals(progressPlan.getTime())||"".equals(progressPlan.getEvent())){
                isEmpty=false;
                isloop=true;
            }else{
                isEmpty=true;
                isloop=false;
            }
            if(isloop){
                break;
            }
        }
        if(isEmpty){
            Set<ProgressPlan> progressPlanSet=new HashSet<>();
            Set<ProgressPlan> oldProgressPlans=project.getProgressPlans();
            if(oldProgressPlans.size()!=0){
                progressPlanService.deleteProgressPlans(oldProgressPlans);
            }
            for(ProgressPlan progressPlan:progressPlans){
                progressPlanSet.add(progressPlan);
            }
            project.setProgressPlans(progressPlanSet);
            projectService.projectSave(project);
            model.addAttribute("message","保存成功");
            model.addAttribute("project",project);
        }else{
            model.addAttribute("message","没有填完信息，前两项必填");
            model.addAttribute("project",project);
            return "/project/apply/step4";
        }

        model.addAttribute("project",project);
        if(method.equals("edit")){
            return "/project/edit/step4";
        }else{
            return "/project/apply/step5";
        }
    }
    @GetMapping("/applystep5")
    public String stepfive(Model model,Integer id,@RequestParam String method){
        if(id!=null){
            Project project=projectService.findById(id);
            model.addAttribute("project",project);
            logger.info("expenditure"+project.getExpenditures().size());
        }
        if(method.equals("edit")){
            return "/project/edit/step5";
        }else{
            return "/project/apply/step5";
        }
    }
    @PostMapping("/applystep5")
    public String saveStepfive(Model model, ExpenditureModel expenditureModel, int id,@RequestParam String method){
        Project project=projectService.findById(id);
        List<Expenditure> expenditures=expenditureModel.getExpenditures();
        boolean isEmpty=false;
        boolean isLoop;
        for(Expenditure expenditure:expenditures){
            if("".equals(expenditure.getDescription())||"".equals(expenditure.getMoney())){
                isEmpty=false;
                isLoop=true;
            }else{
                isEmpty=true;
                isLoop=false;
            }
            if(isLoop){
                break;
            }
        }
        if(isEmpty){
            Set<Expenditure> expenditureSet=new HashSet<>();
            Set<Expenditure> oldExpenditures=project.getExpenditures();
//        for(Expenditure expenditure: expenditures){
//            logger.info("expenditure.Money:"+expenditure.getMoney());
//        }
            if(oldExpenditures.size()!=0){
                expenditureService.deleteExpenditures(oldExpenditures);
            }
            for(Expenditure expenditure:expenditures){
                expenditureSet.add(expenditure);
            }
            project.setExpenditures(expenditureSet);
            project.setCreated(true);
            projectService.projectSave(project);
            model.addAttribute("message","保存成功");
        }else{
            model.addAttribute("project",project);
            model.addAttribute("message","前两项必须填写");
            return "/project/apply/step5";
        }
        model.addAttribute("project",project);
        if(method.equals("edit")){
            return "/project/edit/step5";
        }else{
            return "/project/apply/step5";
        }
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
                    System.out.println("isPublish:======="+project.isNeedCheck());
                }
            }else if(roleCheck.isCpgroup(role.getName())){
                List<Project> projects=projectService.findProjectCheckWithCpgrop("list");
                model.addAttribute("projects",projects);
            }else if(roleCheck.isDsoAdmin(role.getName())){
                List<Project> projects=projectService.findProjectCheckWithCpgrop("list");
                model.addAttribute("projects",projects);
            }else if(roleCheck.isAdviser(role.getName())){
                logger.info("userId:::::"+user.getId());
                List<Project> projects=projectService.findProjectList(user.getId());
                model.addAttribute("projects",projects);
            }else if(roleCheck.isFpgroup(role.getName())){
                List<Project> projects=projectService.findProjectCheckWithFpgroup(user.getAcademy(),"list");
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
        String advicement=null;
        boolean checked=false;
        RoleCheck roleCheck=new RoleCheck();
        Project project=projectService.findById(id);
        String name=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(name);
        Set<Role> roles=user.getRoles();
        Role role=new Role();
        for (Role _role:roles){
            role=_role;
        }
        if(roleCheck.isAdviser(role.getName())){
            advicement=project.getAdviserAdvice();
            checked=project.isAdviserIsCheck();
        }else if(roleCheck.isCpgroup(role.getName())){
            advicement=project.getCollegeAdvice();
            checked=project.isCollegeIsCheck();
        }else if(roleCheck.isFpgroup(role.getName())){
            advicement=project.getAcademyAdvice();
            checked=project.isAcademyIsCheck();
        }
        model.addAttribute("project",project);
        model.addAttribute("advicecontent",advicement);
        model.addAttribute("checked",checked);
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
                projects=projectService.findProjectNeedCheckWithAdviser(user.getId());
            }else if(roleCheck.isFpgroup(role.getName())){
                projects=projectService.findProjectCheckWithFpgroup(user.getAcademy(),"check");
            }else if(roleCheck.isCpgroup(role.getName())){
                projects=projectService.findProjectCheckWithCpgrop("check");
            }else if(roleCheck.isDsoAdmin(role.getName())){
                projects=projectService.findProjectCheckWithCpgrop("check");
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
    public String projectEditing(@RequestParam int id,HttpServletResponse response){

        try {
            response.sendRedirect("/project/applystep1?method=edit&&id="+id);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;

    }

    @PostMapping("/edit")
    public String projectEdit(@RequestParam int id,String content,Model model) throws Exception {
        String name=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(name);
        Project project=projectService.findById(id);
        if(user.getAcademy()!=null){
            project.setAcademy(user.getAcademy());
            projectService.save(project);
            model.addAttribute("message","修改成功");

        }else{
            model.addAttribute("message","请先配置个人信息");
        }
        model.addAttribute("project",projectService.findById(id));
        return "/project/projectEdit";
    }
    @GetMapping("/applying")
    public String projectApplying(Model model){
        String username=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(username);
        List<Project> projects=new ArrayList<>();
        projects=projectService.findByUseridAndNeedCheck(user.getId(),true);
        model.addAttribute("projects",projects);
        return "/project/projectapplying";
    }
    @GetMapping("/success")
    public String projectSuccess(Model model){
        String username=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(username);
        List<Project> projects=new ArrayList<>();
        projects=projectService.findByUserIdAndPublished(user.getId(),true);
        model.addAttribute("projects",projects);
        return "/project/projectsuccess";
    }
    @GetMapping("/publish")
    public String projectPublish(Model model){
        String username=SecurityContextHolder.getContext().getAuthentication().getName();
        User user=userService.findUserByUsername(username);
        List<Project> projects=new ArrayList<>();
        projects=projectService.findByAdviserIsCheckAndAcademyIsCheckAndCollegeIsCheckAndPublished(true,true,true,false);
        model.addAttribute("projects",projects);
        return "/project/projectpublish";
    }
    @GetMapping("/delete")
    public void projectDelete(Model model,@RequestParam int id,HttpServletResponse response){
        if(id>0){
            Project project=projectService.findById(id);

            projectService.projectDelete(project);

        }
        try {
            response.sendRedirect("/project/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @GetMapping("/needCheck")
    public void projectNeedCheck(@RequestParam int id,HttpServletResponse response){
        Project project=projectService.findById(id);
        project.setNeedCheck(true);
        projectService.projectSave(project);
        try {
            response.sendRedirect("/project/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
