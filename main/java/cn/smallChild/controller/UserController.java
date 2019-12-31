package cn.smallChild.controller;

import cn.smallChild.po.User;
import cn.smallChild.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private HttpSession session;


    /*
     * 作用:跳转到注册页
     * 类型:跳转
     * 作者:初子小
     * */
    @RequestMapping("/toRegistered")
    public String toRegistered() {
        return "registered";
    }

    /*
     * 作用:跳转到登录页
     * 类型:跳转
     * 作者:初子小
    * */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }



    @RequestMapping("/personalData")
    public String personalData(){
        return "personalData";
    }



    //-----------------------------{上面是跳转}-----------------------------------------------




    /*
     * 作用:通过注册页的注册添加用户
     * 类型:增
     * 作者:初子小
     * */
    @RequestMapping("/registered")
    public String registered(User user) {
        //判断是否为空跟null
        if (user.getUsername()==null||"".equals(user.getUsername())){
            return "redirect:/user/toRegistered.do";
        }
        if (user.getPassword()==null||"".equals(user.getPassword())){
            return "redirect:/user/toRegistered.do";
        }
        if(user.getPhone()==null||"".equals(user.getPhone())){
            return "redirect:/user/toRegistered.do";
        }
        //正则判断手机号
        if (Pattern.matches("^[1][3,4,5,7,8][0-9]{9}$",user.getPhone())==false){
            return "redirect:/user/toRegistered.do";
        }
        //正则判断密码
        if(Pattern.matches("^(?=.*[\\d])(?=.*[a-zA-Z])(?=.*[\\W])[a-zA-Z\\d\\W]{6,16}$",user.getPassword())==false){
            return "redirect:/user/toRegistered.do";
        }
        //查重不重复
        if(userService.checkUser(user.getName())>0){
            return "redirect:/user/toRegistered.do";
        }
        //调用添加方法
        userService.addUser(user);
        return "login";
    }

    /*
     * 作用:通过注册页的AJAX验证用户名
     * 类型:查
     * 作者:初子小
     * */
    @RequestMapping("/checkUser")
    @ResponseBody//返回就不是jsp了而是字符串
    public String checkUser(String userName) {
        Integer checkUser = userService.checkUser(userName);
        if (checkUser>0){
            return "on";
        }else{
            return "ok";
        }
    }
    /*
     * 作用:通过登录页要登录的用户查询数据库
     * 类型:查
     * 作者:初子小
    * */
    @RequestMapping("/loginUser")
    public String login(HttpServletResponse response,User user, String cookie) throws Exception {
        //判断用户名是否正确错误的话条状到登录页
        if (userService.loginUser(user)<=0){
            return "redirect:/user/toLogin.do?cuo="+URLEncoder.encode("用户名或密码错误", "UTF-8");
        }
        //创建session
        User checkUser = userService.getCheckUser(user.getUsername());

        session.setAttribute("user",checkUser);
        //创建cookie
        Cookie coochecked = new Cookie("checked",cookie);
        Cookie coousername = new Cookie("username", user.getUsername());
        Cookie coopassword = new Cookie("password", user.getPassword());
        if (cookie!=null){
            //设置cookie存储时间
            coochecked.setMaxAge(60 * 60 * 24 * 7);
            coousername.setMaxAge(60 * 60 * 24 * 7);
            coopassword.setMaxAge(60 * 60 * 24 * 7);
            //存进去
            response.addCookie(coochecked);
            response.addCookie(coousername);
            response.addCookie(coopassword);
        }else {
            //设置cookie存储时间
            coochecked.setMaxAge(0);
            coousername.setMaxAge(0);
            coopassword.setMaxAge(0);
        }
        //存进去
        response.addCookie(coochecked);
        response.addCookie(coousername);
        response.addCookie(coopassword);
        //跳转到首页
        return "redirect:/index/toindex.do";
    }

    /*
     * 作用:通过登录页要登录的用户查询数据库
     * 类型:查
     * 作者:初子小
     * */
    @RequestMapping("modifyUser")
    public String modifyUser(HttpServletResponse response,User user) throws Exception {
        User sessUser = (User) session.getAttribute("user");

        System.out.println("用户修改之后的"+user);
        System.out.println("用户修改之前的"+sessUser);

        //判断密码是否修改
        if (sessUser.getPassword().equals(user.getPassword())){
            sessUser.setUsername(user.getUsername());
            sessUser.setPassword(user.getPassword());
            sessUser.setName(user.getName());
            sessUser.setEmail(user.getEmail());
            sessUser.setAddr(user.getAddr());
            //记录用户修改几次
            System.out.println("真正修改后的"+sessUser);

            userService.modifyUser(sessUser);
            //创建cookie
            Cookie coousername = new Cookie("username", user.getUsername());
            Cookie coopassword = new Cookie("password", user.getPassword());
            //存修改之后的
            response.addCookie(coousername);
            response.addCookie(coopassword);
            return "redirect:/user/personalData.do";
        }else{
            sessUser.setUsername(user.getUsername());
            sessUser.setPassword(user.getPassword());
            sessUser.setName(user.getName());
            sessUser.setEmail(user.getEmail());
            sessUser.setAddr(user.getAddr());
            //记录用户修改几次
            userService.modifyUser(sessUser);
            //创建cookie
            Cookie coousername = new Cookie("username", user.getUsername());
            Cookie coopassword = new Cookie("password", user.getPassword());
            //存修改之后的
            response.addCookie(coousername);
            response.addCookie(coopassword);
            return "redirect:/user/toLogin.do";
        }

    }

}
;