package cn.smallChild.dao;

import cn.smallChild.po.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


public interface UserDao {

    /*
     * 作用:查询所有用户
     * 类型:查
     * 作者:初子小
     * */
    List<User> getAll();

    /*
     * 作用:添加用户
     * 类型:增
     * 作者:初子小
     * */
    void addUser(User user);

    /*
     * 作用:查询用户名
     * 类型:查
     * 作者:初子小
    * */
    int checkUser(String userName);

    /*
     * 作用:查询用户名跟密码
     * 类型:查
     * 作者:初子小
     * */
    Integer loginUser(User user);

    /*
     * 作用:查询用户信息
     * 类型:查
     * 作者:初子小
    * */
    User getCheckUser(String userName);
    
    /*
     * 作用:修改个人用户信息
     * 类型:改
     * 作者:初子小
    * */
    void modifyUser(User user);
}
