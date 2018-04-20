package procheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import procheck.dao.ProTableRepository;
import procheck.model.ProTable;

import java.util.List;

/**
 * Created by Administrator on 2017/3/14.
 */
@Service
@Transactional
public class ProTableService {
    @Autowired
    private ProTableRepository proTableRepository;

    public void save(ProTable proTable){
        proTableRepository.save(proTable);
    }
    public List<ProTable> findByName(String name){
        return proTableRepository.findByName(name);
    }
}
