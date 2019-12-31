package cn.smallChild.util;

import cn.smallChild.po.CategoryExt;
import cn.smallChild.service.CategoryService;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.List;

@Component//当bean运行的时候运行
public class CategoryUtil {

    @Resource
    private CategoryService categoryService;
    @Resource
    private ServletContext application;


    @PostConstruct
    public void setAllCategories(){
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        application.setAttribute("allCategory",allCategory);
    }

}
