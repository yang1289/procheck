package procheck.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import procheck.dao.ProjectRepository;
import procheck.dao.UserRepository;
import procheck.model.Academy;
import procheck.model.Project;
import procheck.model.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/3/2.
 */
@Service
@Transactional
public class ProjectService {
    Logger log=Logger.getLogger(ProjectService.class);
    @Autowired
    private ProjectRepository projectRepository;
    @Autowired
    private UserRepository userRepository;
    public void save(Project project) throws Exception{
        projectRepository.save(project);
    }

    public List<Project> findByUserId(int userid){
        return projectRepository.findByUserId(userid);
    }

    public List<Project> findAll(){
        return projectRepository.findAll();
    }

    public Project findById(int id){
        return projectRepository.findById(id);
    }

    public List<Project> findByIsAdviserCheck(boolean bool){
        return projectRepository.findByAdviserIsCheck(bool);
    }

    public List<Project> findByIsAcademyCheck(boolean bool){
        return projectRepository.findByAcademyIsCheck(bool);
    }

    public List<Project> findByIsCollegeCheck(boolean bool){
        return projectRepository.findByCollegeIsCheck(bool);
    }

    public List<Project> findByAcademyId(int id){
        return projectRepository.findByAcademyId(id);
    }

    public List<Project> findByAcademyIdAndAdviserIsCheck(int id,boolean bool){
        return projectRepository.findByAcademyIdAndAdviserIsCheck(id,bool);
    }

    public List<Project> findByAcademyIsCheckAndCollegeIsCheck(boolean academybool,boolean collegebool){
        return projectRepository.findByAcademyIsCheckAndCollegeIsCheck(academybool,collegebool);
    }

    public List<Project> findByAcademyIdAndAdviserIsCheckAndAcademyIsCheck(int id,boolean adviserbool,boolean academybool){
        return projectRepository.findByAcademyIdAndAdviserIsCheckAndAcademyIsCheck(id,adviserbool,academybool);
    }
    public List<Project> findByUserIdAndPublished(int userId,boolean bool){
        return projectRepository.findByUserIdAndPublished(userId,bool);
    }

    public List<Project> findByAdviserIsCheckAndAcademyIsCheckAndCollegeIsCheckAndPublished(boolean adviserBool,boolean academyBool,boolean collgeBool,boolean published){
        return projectRepository.findByAdviserIsCheckAndAcademyIsCheckAndCollegeIsCheckAndPublished(adviserBool,academyBool,collgeBool,published);
    }

    public List<Project> findByProjectName(String projectname){
        return projectRepository.findByProjectName(projectname);
    }
    public Project projectSave(Project project){
        return projectRepository.save(project);
    }

    public void projectDelete(Project project){
        projectRepository.delete(project);
    }

    public List<Project> findByUseridAndNeedCheck(int id,boolean needCheck){
        return projectRepository.findByUserIdAndNeedCheck(id,needCheck);
    }
    public List<Project> findProjectList(int adviserId){
        User adviser= userRepository.findOne(adviserId);
        List<Project> listProject=new ArrayList<>();
        Set<Project> projects=adviser.getCheckProjects();
        log.info("projects.size::::::"+projects.size());
        for(Project project:projects){
            if(project.isNeedCheck()){
                listProject.add(project);
            }
        }
        return listProject;
    }

    public List<Project> findProjectNeedCheckWithAdviser(int adviserId){
        User adviser= userRepository.findOne(adviserId);
        List<Project> listProject=new ArrayList<>();
        Set<Project> projects=adviser.getCheckProjects();
        log.info("projects.size::::::"+projects.size());
        for(Project project:projects){
            if(project.isNeedCheck()&&!project.isAdviserIsCheck()){
                listProject.add(project);
            }
        }
        return listProject;
    }

    public List<Project> findProjectCheckWithFpgroup(Academy academy,String action){
        List<Project> projects=projectRepository.findByAcademy(academy);
        List<Project> projectList=new ArrayList<>();
        if(action=="list"){
            for(Project project:projects){
                if(project.isNeedCheck()){
                    if(project.isAdviserIsCheck()){
                        projectList.add(project);
                    }
                }
            }
        }else if(action=="check"){
            for(Project project:projects){
                if(project.isNeedCheck()){
                    if(project.isAdviserIsCheck()){
                        if(!project.isAcademyIsCheck()) {
                            projectList.add(project);
                        }
                    }
                }
            }
        }

        return projectList;
    }
    public List<Project> findProjectCheckWithCpgrop(String action){
        List<Project> projects=projectRepository.findAll();
        List<Project> projectList=new ArrayList<>();
        if(action=="list"){
            for(Project project:projects){
                if(project.isNeedCheck()){
                    if(project.isAdviserIsCheck()){
                        if(project.isAcademyIsCheck()){
                            projectList.add(project);
                        }
                    }
                }
            }
        }else if(action=="check"){
            for(Project project:projects){
                if(project.isNeedCheck()){
                    if(project.isAdviserIsCheck()){
                        if(project.isAcademyIsCheck()){
                            if(!project.isCollegeIsCheck()){
                                projectList.add(project);
                            }
                        }
                    }
                }
            }
        }

        return projectList;
    }
}
