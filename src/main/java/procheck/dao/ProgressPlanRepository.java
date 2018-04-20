package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import procheck.model.ProgressPlan;

/**
 * Created by Administrator on 2017/5/16.
 */
public interface ProgressPlanRepository extends JpaRepository<ProgressPlan,Integer> {
    public ProgressPlan findByEvent(String event);
}
