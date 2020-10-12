package procheck.controller;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.common.utils.BinaryUtil;
import com.aliyun.oss.model.MatchMode;
import com.aliyun.oss.model.PolicyConditions;
import com.google.gson.Gson;
import net.sf.json.JSONObject;
import org.junit.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import procheck.common.config.OSSConfig;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

@Controller
@RequestMapping("/aliyunoss")
@EnableConfigurationProperties(OSSConfig.class)
public class OssController {

    @Autowired
    private OSSConfig ossConfig;

    @GetMapping("/policy")
    @ResponseBody
    private String getPolicy(){
        String username= SecurityContextHolder.getContext().getAuthentication().getName();
        String endpoint= ossConfig.getEndpoint();
        String accessId=ossConfig.getAccessKeyId();
        String accessKeySecret=ossConfig.getAccessKeySecret();
        String bucket=ossConfig.getBucket();
        String dir=ossConfig.getDir();
        String host="https://"+bucket+"."+endpoint;
        OSSClient client=new OSSClient(endpoint,accessId,accessKeySecret);
        Gson gson=new Gson();
        String json=new String();
        try {
            long expireTime = 30;
            long expireEndTime = System.currentTimeMillis() + expireTime * 1000;
            Date expiration = new Date(expireEndTime);
            PolicyConditions policyConds = new PolicyConditions();
            policyConds.addConditionItem(PolicyConditions.COND_CONTENT_LENGTH_RANGE, 0, 1048576000);
            policyConds.addConditionItem(MatchMode.StartWith, PolicyConditions.COND_KEY,dir);

            String postPolicy = client.generatePostPolicy(expiration, policyConds);
            byte[] binaryData = postPolicy.getBytes("utf-8");
            String encodedPolicy = BinaryUtil.toBase64String(binaryData);
            String postSignature = client.calculatePostSignature(postPolicy);

            Map<String, String> respMap = new LinkedHashMap<String, String>();
            respMap.put("accessid", accessId);
            respMap.put("secret",accessKeySecret);
            respMap.put("policy", encodedPolicy);
            respMap.put("signature", postSignature);
            //respMap.put("expire", formatISO8601Date(expiration));
            respMap.put("dir", dir+username);
            respMap.put("host", host);
            respMap.put("expire", String.valueOf(expireEndTime / 1000));
            json=gson.toJson(respMap);
        } catch (Exception e) {
            Assert.fail(e.getMessage());
        }
        return json;
//        String endpoint = "oss-cn-hangzhou.aliyuncs.com";

//        String bucket = "res-procheck";
//        String dir = String.valueOf(System.currentTimeMillis());
//        String host = "http://" + bucket + "." + endpoint;
//        OSSClient client = new OSSClient(endpoint, accessId, accessKey);
//        String json=new String();
//        try {
//            long expireTime = 30;
//            long expireEndTime = System.currentTimeMillis() + expireTime* 1000;
//            Date expiration = new Date(expireEndTime);
//            PolicyConditions policyConds = new PolicyConditions();
//            policyConds.addConditionItem(PolicyConditions.COND_CONTENT_LENGTH_RANGE, 0, 1048576000);
//            policyConds.addConditionItem(MatchMode.StartWith, PolicyConditions.COND_KEY, dir);
//
//            String postPolicy = client.generatePostPolicy(expiration, policyConds);
//            byte[] binaryData = new byte[0];
//            try {
//                binaryData = postPolicy.getBytes("utf-8");
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
//            String encodedPolicy = BinaryUtil.toBase64String(binaryData);
//            String postSignature = client.calculatePostSignature(postPolicy);
//
//
//            Map<String, String> respMap = new LinkedHashMap<String, String>();
//            respMap.put("accessid", accessId);
//            respMap.put("policy", encodedPolicy);
//            respMap.put("signature", postSignature);
//            //respMap.put("expire", formatISO8601Date(expiration));
//            respMap.put("dir", dir);
//            respMap.put("host", host);
//            respMap.put("expire", String.valueOf(expireEndTime / 1000));
//            JSONObject ja1 = JSONObject.fromObject(respMap);
//            json=ja1.toString();
//        } catch (Exception e) {
//            Assert.fail(e.getMessage());
//        }
//        return json;
    }

}
