package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import procheck.model.Grade;

import java.util.List;

/**
 * Created by Administrator on 2017/3/10.
 */
public interface GradeRepository extends JpaRepository<Grade,Integer>{
    public Grade findById(int id);

    public List<Grade> findByMajorId(int majorid);
}
