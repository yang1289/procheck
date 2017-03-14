package procheck.tools;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import procheck.model.Project;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/12.
 */


public class HtmlHandler {

    public Map getHtmlValue(Project project){
        Map maphtml=new HashMap();
        String projectName=project.getProjectName();
        String html=project.getProjectInfo();
        Document doc= Jsoup.parse(html);

        return maphtml;
    }

    public File CreateDocx(Project project) throws Exception {
        HtmlConvert htmlConvert=new HtmlConvert();

        return htmlConvert.saveUrlToDocx(project);

    }
}
