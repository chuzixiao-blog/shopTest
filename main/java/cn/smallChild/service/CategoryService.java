package cn.smallChild.service;

import cn.smallChild.po.CategoryExt;
import cn.smallChild.po.CategorySecond;

import java.util.List;

public interface CategoryService {

    /*
     * 作用:通过用户名查询
     * 功能:查询用户名
     * 类型:查
     * 作者:初子小
     * */
    List<CategoryExt> getAllCategory();

}
