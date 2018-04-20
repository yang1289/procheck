package procheck.controller;

import com.google.gson.Gson;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import procheck.model.User;
import procheck.service.UserService;

@Controller
@RequestMapping("/test")
public class TestController {
    private static Logger log= LogManager.getLogger(TestController.class);

    @Autowired
    private UserService userService;
    @GetMapping("/test")
    public String goTest()
    {
        return "/test/test";
    }

    @GetMapping("/user")
    @ResponseBody
    public String getUser(){
        User user=userService.findById(2);
        log.info("userINfo:"+user.getUsername());
        return "21";
    }
}
