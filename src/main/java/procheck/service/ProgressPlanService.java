package procheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import procheck.dao.ProgressPlanRepository;
import procheck.model.ProgressPlan;

import java.util.Set;

/**
 * Created by Administrator on 2017/5/16.
 */
@Service
@Transactional
public class ProgressPlanService {
    @Autowired
    private ProgressPlanRepository progressPlanRepository;
    public ProgressPlan findByEvent(String event){
        return progressPlanRepository.findByEvent(event);
    }
    public void deleteProgressPlans(Set<ProgressPlan> progressPlans){
        progressPlanRepository.deleteInBatch(progressPlans);
    }
}
