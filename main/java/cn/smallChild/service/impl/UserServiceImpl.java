package cn.smallChild.service.impl;

import cn.smallChild.dao.UserDao;
import cn.smallChild.po.User;
import cn.smallChild.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userdao;

    /*
     * 作用:用户点击注册
     * 功能:注册用户
     * 类型:增
     * 作者:初子小
     * */
    @Override
    public void addUser(User user) {
        userdao.addUser(user);
    }
    /*
     * 作用:通过用户名查询
     * 功能:查询用户名
     * 类型:查
     * 作者:初子小
    * */
    @Override
    public Integer checkUser(String userName) {
        int checkUser = userdao.checkUser(userName);
        return checkUser;
    }

    /*
     * 作用:通过登录页要登录的用户查询数据库
     * 功能:查询用户名跟密码
     * 类型:查
     * 作者:初子小
    * */
    @Override
    public Integer loginUser(User user) {
        return userdao.loginUser(user);
    }

    /*
     * 作用:用户登录成功之后读取数据库获得个人信息
     * 功能:登录之后查询用户信息
     * 类型:查
     * 作者:初子小
    * */
    @Override
    public User getCheckUser(String userName) {
        return userdao.getCheckUser(userName);
    }

    @Override
    public void modifyUser(User user) {
        userdao.modifyUser(user);
    }

}
