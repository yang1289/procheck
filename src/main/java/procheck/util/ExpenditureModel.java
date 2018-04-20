package procheck.util;

import procheck.model.Expenditure;

import java.util.List;

/**
 * Created by Administrator on 2017/5/5.
 */
public class ExpenditureModel {
    private List<Expenditure> expenditures;

    public ExpenditureModel(List<Expenditure> expenditures) {
        super();
        this.expenditures = expenditures;
    }
    public ExpenditureModel() {
        super();
    }

    public List<Expenditure> getExpenditures() {
        return expenditures;
    }

    public void setExpenditures(List<Expenditure> expenditures) {
        this.expenditures = expenditures;
    }
}
