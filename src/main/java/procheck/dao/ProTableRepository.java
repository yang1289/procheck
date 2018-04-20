package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import procheck.model.ProTable;

import java.util.List;

/**
 * Created by Administrator on 2017/3/13.
 */
public interface ProTableRepository extends JpaRepository<ProTable,Integer>{
    public List<ProTable> findByName(String name);
}
