package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import procheck.model.ApplyUser;

import java.util.Set;

/**
 * Created by Administrator on 2017/4/8.
 */
public interface ApplyUserRepository extends JpaRepository<ApplyUser,Integer> {
    public ApplyUser findByApplyNumber(String applynumber);

}
