package procheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import procheck.dao.AcademyRepository;
import procheck.model.Academy;

import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */
@Service
@Transactional
public class AcademyService {
    @Autowired
    private AcademyRepository academyRepository;

    public void save(Academy academy){
        academyRepository.save(academy);
    }

    public Academy findById(int id){
        return academyRepository.findById(id);
    }

    public List<Academy> findAll(){
        return academyRepository.findAll();
    }

    public Academy isContainsName(String name){
        List<Academy> academies=academyRepository.findByName(name);
        if(academies.size()==1){
            return academies.get(0);
        }else {
            return null;
        }
    }

}
