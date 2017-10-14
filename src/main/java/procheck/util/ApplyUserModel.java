package procheck.util;

import procheck.model.ApplyUser;

import java.util.List;

/**
 * Created by Administrator on 2017/4/8.
 */
public class ApplyUserModel {
    private List<ApplyUser> applyusers;

    public ApplyUserModel(List<ApplyUser> applyusers) {
        super();
        this.applyusers = applyusers;
    }
    public ApplyUserModel() {
        super();
    }

    public List<ApplyUser> getApplyusers() {
        return applyusers;
    }

    public void setApplyusers(List<ApplyUser> applyusers) {
        this.applyusers = applyusers;
    }
}
