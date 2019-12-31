package cn.smallChild.service;

import cn.smallChild.po.CategoryExt;
import cn.smallChild.po.Product;
import cn.smallChild.po.ProductBean;

import java.util.List;
import java.util.Map;

public interface ProductService {

    /*
     * 作用:一级类目查询
     * 功能:查询
     * 类型:查
     * 作者:初子小
     * */
    Map<Integer,List<Product>> getFloorProducts(List<CategoryExt> allCategory);


    /*
     * 作用:按照一级类目商品查询
     * 功能:查询商品
     * 类型:查
     * 作者:初子小
     * */
    ProductBean getProductBean(ProductBean productBean);

    /*
     * 作用:查询商品信息
     * 功能:查询商品
     * 类型:查
     * 作者:初子小
     * */
    Product getProductDetail(Integer pid);
}
