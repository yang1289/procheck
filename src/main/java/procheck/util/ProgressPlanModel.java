package procheck.util;

import procheck.model.ProgressPlan;

import java.util.List;

/**
 * Created by Administrator on 2017/5/5.
 */
public class ProgressPlanModel {
    private List<ProgressPlan> progressPlans;

    public ProgressPlanModel(List<ProgressPlan> progressPlans) {
        super();
        this.progressPlans = progressPlans;
    }
    public ProgressPlanModel(){
        super();
    }

    public List<ProgressPlan> getProgressPlans() {
        return progressPlans;
    }

    public void setProgressPlans(List<ProgressPlan> progressPlans) {
        this.progressPlans = progressPlans;
    }
}
