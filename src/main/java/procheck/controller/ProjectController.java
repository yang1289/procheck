package procheck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/3/2.
 */
@Controller
@RequestMapping("/project")
public class ProjectController {

    @GetMapping("/apply")
    public String applyingProject(){
        return "/project/projectapply";
    }

}
