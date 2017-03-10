package procheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import procheck.dao.MajorRepository;
import procheck.model.Academy;
import procheck.model.Major;

import java.util.List;

/**
 * Created by Administrator on 2017/3/10.
 */
@Service
@Transactional
public class MajorService {
    @Autowired
    private MajorRepository majorRepository;

    public void save(Major major){
        majorRepository.save(major);
    }

    public List<Major> findByAcademy(Academy academy){
        return majorRepository.findByAcademy(academy);
    }

    public Major findByid(int id) {
        return majorRepository.findById(id);
    }
}
