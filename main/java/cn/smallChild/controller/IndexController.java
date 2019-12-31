package cn.smallChild.controller;

import cn.smallChild.po.CategoryExt;
import cn.smallChild.po.CategorySecond;
import cn.smallChild.po.Product;
import cn.smallChild.service.CategoryService;
import cn.smallChild.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/index")
public class IndexController {

    @Resource
    private CategoryService categoryService;

    @Resource
    private ProductService productService;

    @Resource
    private ServletContext application;

    /*
     * 作用:跳转到首页
     * 类型:跳转
     * 作者:初子小
     * */
    @RequestMapping("/toindex")
    public String index(Model model){
        //获取一.二级类目信息
        List<CategoryExt> allCategory = (List<CategoryExt>)application.getAttribute("allCategory");

        //商品楼层
        Map<Integer, List<Product>> floorProducts = productService.getFloorProducts(allCategory);

        model.addAttribute("productMap",floorProducts);
        //跳到首页
        return "index";
    }
}
