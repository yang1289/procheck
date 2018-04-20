package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import procheck.model.Expenditure;

/**
 * Created by Administrator on 2017/5/16.
 */
public interface ExpenditureRepository extends JpaRepository<Expenditure,Integer> {
}
