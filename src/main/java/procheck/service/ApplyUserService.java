package procheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import procheck.dao.ApplyUserRepository;
import procheck.model.ApplyUser;

import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/4/8.
 */
@Service
@Transactional
public class ApplyUserService {
    @Autowired
    private ApplyUserRepository applyUserRepository;
    public ApplyUser findByApplyNumber(String applyNumber){
       return applyUserRepository.findByApplyNumber(applyNumber);
    }
    public void deleteApplyUserById(int id){
        applyUserRepository.deleteById(id);
    }
    public void deleteApplyUsers(Set<ApplyUser> applyUsers){
        applyUserRepository.deleteInBatch(applyUsers);
    }
}
