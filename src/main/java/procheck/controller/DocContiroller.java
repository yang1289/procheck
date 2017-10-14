package procheck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import procheck.model.Project;
import procheck.service.ProjectService;
import procheck.tools.DocUtil;
import procheck.tools.HtmlHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/12.
 */
@Controller
@RequestMapping("/doc")
public class DocContiroller {
    @Autowired
    private ProjectService projectService;



}
