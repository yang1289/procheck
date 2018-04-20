package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import procheck.model.Academy;

import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */
public interface AcademyRepository extends JpaRepository<Academy,Integer>{

    public Academy findById(int id);

    public List<Academy> findByName(String name);
}
