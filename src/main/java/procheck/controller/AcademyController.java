package procheck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import procheck.model.Academy;
import procheck.service.AcademyService;

import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */

@Controller
@RequestMapping("/academy")
public class AcademyController {
    @Autowired
    private AcademyService academyService;

    @GetMapping("/add")
    public String academyadding(Model model){
        List<Academy> academys=academyService.findByPid(0);
        model.addAttribute("academys",academys);
        return "/academy/academyadd";
    }

    @PostMapping("/add")
    public String academyadded(Model model,String name,Integer academyid,Integer majorid){
        Academy academy=new Academy();

        System.out.println("majorId:====="+majorid);
        System.out.println("academyId:====="+academyid);
        if(academyid!=null){
            if(majorid!=null){
                academy.setPid(majorid);
                Academy preacademy=academyService.findById(majorid);
                name=preacademy.getName()+name;
            }else{
                academy.setPid(academyid);
            }
        }else{
            academy.setPid(0);
        }
        academy.setName(name);
        System.out.println("Pid:======"+academy.getPid());
        academyService.save(academy);
        List<Academy> academys=academyService.findByPid(0);
        model.addAttribute("academys",academys);
        return "/academy/academyadd";
    }
    @PostMapping("findmajor")
    @ResponseBody
    public List<Academy> findMajor(Integer pid){
        return academyService.findByPid(pid);
    }
}
