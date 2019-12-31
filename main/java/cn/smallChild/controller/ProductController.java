package cn.smallChild.controller;

import cn.smallChild.po.Product;
import cn.smallChild.po.ProductBean;
import cn.smallChild.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Resource
    private ProductService productService;

    /*
     * 作用:跳转到商品列表页
     * 类型:跳转加查询
     * 作者:初子小
     * */
    @RequestMapping("/toSearchProduucts")
    private String toSearchProduucts(ProductBean productBean, Model model){
        //获取商品列表
        ProductBean result = productService.getProductBean(productBean);
        model.addAttribute("productBean",result);
        return "searchProduuct";
    }

    /*
     * 作用:跳转到商品详情页
     * 类型:跳转加查询
     * 作者:初子小
     */
    @RequestMapping("/toProductDetail")
    private  String toProductDetail(Integer pid,Model model){
        Product product = productService.getProductDetail(pid);
        model.addAttribute("product",product);
        return "productDetail";
    }
}
