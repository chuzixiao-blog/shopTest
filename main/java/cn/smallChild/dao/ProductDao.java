package cn.smallChild.dao;

import cn.smallChild.po.PageBean;
import cn.smallChild.po.Product;
import cn.smallChild.po.ProductBean;

import java.util.List;

public interface ProductDao {
    /*
     * 作用:根据二级类目查询商品集合
     * 类型:查
     * 作者:初子小
    * */
    List<Product> getProductByCsid(int csid);

    /*
    * 作用:按照一级类目查询商品列表
    * 类型:查
    * 作者:初子小
    * */
    List<Product> getProductListByCid(ProductBean pageBean);

    /*
     * 作用:按照一级类目查询总数
     * 类型:查
     * 作者:初子小
    * */
    int getRowCountByCid(ProductBean pageBean);

    /*
     * 作用:按照二级类目查询商品
     * 类型:查
     * 作者:初子小
    * */
    List<Product> getProductListByCsid(ProductBean productBean);

    /*
     * 作用:按照二级类目查询所数商品数数
     * 类型:查
     * 作者:初子小
    * */
    Integer getRowCounByCsid(ProductBean productBean);

    /*
     * 查询商品信息
     * 类型:查
     * 作者:初子小
     * */
    Product getProductDetail(Integer pid);
}
