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
    @GetMapping("/generation")
    @ResponseBody
    public void generation(@RequestParam int id, HttpServletRequest request, HttpServletResponse response){
        Project project=projectService.findById(id);
        HtmlHandler htmlHandler=new HtmlHandler();
        Map map=htmlHandler.getHtmlValue(project);
        DocUtil docUtil=new DocUtil();
        //docUtil.createApply(map);
        try {
           // docUtil.createApply(map);
            docUtil.createWord(project,request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @GetMapping("/generationdocx")
    @ResponseBody
    public void generationDocx(@RequestParam int id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Project project=projectService.findById(id);
        HtmlHandler htmlHandler=new HtmlHandler();
        DocUtil docUtil=new DocUtil();
        //docUtil.createApply(map);
       File file=htmlHandler.CreateDocx(project);
       String filename=file.getName();
        response.setContentType("application/msword");
        response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(filename,"utf-8"));
        FileInputStream fileinput=new FileInputStream(file);
        OutputStream outstream=response.getOutputStream();
        byte buffer[] = new byte[1024];
        int len = 0;
        while((len=fileinput.read(buffer))>0){
            outstream.write(buffer,0,len);
        }
        fileinput.close();
        outstream.close();
        File newfile=new File(file.getAbsolutePath());
        try {
            if(newfile.exists()){
                newfile.delete();
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
