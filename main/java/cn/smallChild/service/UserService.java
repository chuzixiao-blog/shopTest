package cn.smallChild.service;

import cn.smallChild.po.User;

import java.util.List;

public interface UserService {

    /*
     * 作用:用户点击注册
     * 功能:注册用户
    * 类型:增
    * 作者:初子小
    * */
    void addUser(User user);

    /*
     * 作用:通过用户名查询
     * 功能:查询用户名
     * 类型:查
     * 作者:初子小
    * */
    Integer checkUser(String userName);

    /*
     * 作用:通过登录页要登录的用户查询数据库
     * 功能:查询用户名跟密码
     * 类型:查
     * 作者:初子小
     * */
    Integer loginUser(User user);

    User getCheckUser(String userName);

    void modifyUser(User user);
}
