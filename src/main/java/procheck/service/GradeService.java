package procheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import procheck.dao.GradeRepository;
import procheck.model.Grade;

import java.util.List;

/**
 * Created by Administrator on 2017/3/10.
 */
@Service
@Transactional
public class GradeService {

    @Autowired
    private GradeRepository gradeRepository;

    public void save(Grade grade){
        gradeRepository.save(grade);
    }

    public Grade findById(int id){
        return gradeRepository.findById(id);
    }

    public List<Grade> findByMajorId(int majorid){
        return gradeRepository.findByMajorId(majorid);
    }



}
