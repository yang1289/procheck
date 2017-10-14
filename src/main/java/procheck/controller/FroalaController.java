package procheck.controller;

import com.froala.editor.Image;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/froala")
public class FroalaController {
    @PostMapping("/image_upload")
    @ResponseBody
    public void imageUpload(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String fileRoute = "/images/";

        Map<Object, Object> responseData;
        try {
            responseData = Image.upload(request, fileRoute); // Use default
            // image
            // validation.
        } catch (Exception e) {
            e.printStackTrace();
            responseData = new HashMap<Object, Object>();
            responseData.put("error", e.toString());
        }
        String jsonResponseData = new Gson().toJson(responseData);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponseData);
    }

    @GetMapping("/image_load")
    @ResponseBody
    public void imageLoad(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        String fileRoute = "/images/";
        ArrayList<Object> responseData;
        try {
            responseData = Image.list(request, fileRoute);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }

        String jsonResponseData = new Gson().toJson(responseData);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponseData);
    }
    @PostMapping("/image_delete")
    @ResponseBody
    public void imageDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        String src = request.getParameter("src");

        try {
            Image.delete(request, src);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }
        String jsonResponseData = new Gson().toJson("Success");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponseData);
    }

}
