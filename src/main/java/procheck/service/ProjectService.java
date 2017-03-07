package procheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import procheck.dao.ProjectRepository;
import procheck.model.Project;

import java.util.List;

/**
 * Created by Administrator on 2017/3/2.
 */
@Service
@Transactional
public class ProjectService {
    @Autowired
    private ProjectRepository projectRepository;

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
}
