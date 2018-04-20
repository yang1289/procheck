package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import procheck.model.Academy;
import procheck.model.Major;

import java.util.List;

/**
 * Created by Administrator on 2017/3/10.
 */
public interface MajorRepository extends JpaRepository<Major,Integer> {

    public List<Major> findByAcademy(Academy academy);

    public Major findById(int id);
}
