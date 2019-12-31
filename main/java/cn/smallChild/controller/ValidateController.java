package cn.smallChild.controller;

import cn.dsna.util.images.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RequestMapping("/validate")
@Controller
public class ValidateController {

    @Resource
    private HttpSession session;

    /*
     * 作用:图像验证码
     * 类型:生成宽163高64位数4干扰线100
     * 作者:初子小
    * */
    @RequestMapping("/getValidateCode")
    public void getValidateCode(HttpServletResponse response){
        try {
            //生成图片验证码
            ValidateCode validateCode = new ValidateCode(163,64,4,100);
            /*获取验证码文字*/
            String code = validateCode.getCode();
            /*将验证码文字存到session里面*/
            session.setAttribute("code",code);

            validateCode.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*
     * 作用:验证码输入字符验证
     * 类型:文字验证
     * 作者:初子小
    * */
    @RequestMapping("/checkImgCode")
    @ResponseBody
    public String checkImgCode(String imgCode){
        String code = (String) session.getAttribute("code");
        System.out.println(code);
        if(code.equalsIgnoreCase(imgCode)){
            return "ok";
        }else {
            return "no";
        }

    }

}
