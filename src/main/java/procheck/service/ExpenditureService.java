package procheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import procheck.dao.ExpenditureRepository;
import procheck.model.Expenditure;

import java.util.Set;

/**
 * Created by Administrator on 2017/5/16.
 */
@Service
@Transactional
public class ExpenditureService {
    @Autowired
    private ExpenditureRepository expenditureRepository;
    public void deleteExpenditures(Set<Expenditure> expenditures){
        expenditureRepository.deleteInBatch(expenditures);
    }
}
