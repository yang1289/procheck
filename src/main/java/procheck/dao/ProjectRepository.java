package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import procheck.model.Academy;
import procheck.model.Project;

import javax.print.event.PrintJobEvent;
import java.util.List;

/**
 * Created by Administrator on 2017/3/2.
 */
public interface ProjectRepository extends JpaRepository<Project,Integer>{

    public List<Project> findByUserId(int userid);

    public Project findById(int id);

    public List<Project> findByAdviserIsCheck(boolean bool);

    public List<Project> findByAcademyIsCheck(boolean bool);

    public List<Project> findByCollegeIsCheck(boolean bool);

    public List<Project> findByAcademyId(int id);

    public List<Project> findByAcademyIdAndAdviserIsCheck(int id,boolean bool);
    public List<Project> findByAcademyIdAndAdviserIsCheckAndAcademyIsCheck(int id,boolean adviserbool,boolean academybool);
    public List<Project> findByAcademyIsCheckAndCollegeIsCheck(boolean academybool,boolean collegebool);
    public List<Project> findByUserIdAndPublished(int userId,boolean bool);

    public List<Project> findByAdviserIsCheckAndAcademyIsCheckAndCollegeIsCheckAndPublished(boolean adviserBool,boolean academyBool,boolean collgeBool,boolean published);
    public List<Project> findByProjectName(String projectname);

    public Project save(Project project);

    public List<Project> findByUserIdAndNeedCheck(int id,boolean needCheck);

    public List<Project> findByAcademy(Academy academy);

}
