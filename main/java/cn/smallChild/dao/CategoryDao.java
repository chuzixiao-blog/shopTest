package cn.smallChild.dao;

import cn.smallChild.po.CategoryExt;

import java.util.List;

public interface CategoryDao {

    /*
     * 作用:查询一二级类目Category集合
     * 类型:查
     * 作者:初子小
    * */
    List<CategoryExt> getAllCategory();

}
