package procheck.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import procheck.model.Academy;
import procheck.model.Grade;
import procheck.model.Major;
import procheck.service.AcademyService;
import procheck.service.GradeService;
import procheck.service.MajorService;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/3/7.
 */

@Controller
@RequestMapping("/academy")
public class AcademyController {

    Logger log= Logger.getLogger(AcademyController.class);

    @Autowired
    private AcademyService academyService;

    @Autowired
    private MajorService majorService;

    @Autowired
    private GradeService gradeService;
    @GetMapping("/add")
    public String academyadding(Model model){
        List<Academy> academys=academyService.findAll();
        model.addAttribute("academys",academys);
        return "/academy/academyadd";
    }

    @PostMapping("/add")
    public String academyadded(Model model,String name,Integer academyid,Integer majorid){
        Academy academy=new Academy();
        Major major=new Major();
        Grade grade=new Grade();


        System.out.println("majorId:====="+majorid);
        System.out.println("academyId:====="+academyid);
        if(academyid!=null){
            if(majorid!=null){
                grade.setMajor(majorService.findByid(majorid));
                name=majorService.findByid(majorid).getName()+name;
                grade.setName(name);
                gradeService.save(grade);
            }else{
                major.setAcademy(academyService.findById(academyid));
                major.setName(name);
                majorService.save(major);
            }
        }else{
            academy.setName(name);
            academyService.save(academy);
        }

        List<Academy> academys=academyService.findAll();
        model.addAttribute("academys",academys);
        return "/academy/academyadd";
    }
    @PostMapping("findChild")
    @ResponseBody
    public Set findMajor(Integer id, String levelname){
        System.out.println("levelname:======"+levelname);
        System.out.println("id:======"+id);
        if(levelname.equals("academy")){
            Academy academy=academyService.findById(id);
            return academy.getMajors();
        }else if(levelname.equals("major")){
            return majorService.findByid(id).getGrades();
        } else{
            return null;
        }

    }
}
