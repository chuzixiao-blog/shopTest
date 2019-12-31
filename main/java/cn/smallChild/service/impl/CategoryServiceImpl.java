package cn.smallChild.service.impl;

import cn.smallChild.dao.CategoryDao;
import cn.smallChild.po.CategoryExt;
import cn.smallChild.po.CategorySecond;
import cn.smallChild.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {


    @Resource
    private CategoryDao categoryDao;
    /*
     * 作用:通过用户名查询
     * 功能:查询用户名
     * 类型:查
     * 作者:初子小
     * */
    @Override
    public List<CategoryExt> getAllCategory() {
        return categoryDao.getAllCategory();
    }
}
