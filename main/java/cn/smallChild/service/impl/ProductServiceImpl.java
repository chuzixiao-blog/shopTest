package cn.smallChild.service.impl;

import cn.smallChild.dao.ProductDao;
import cn.smallChild.po.*;
import cn.smallChild.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductDao productDao;

    @Override
    public Map<Integer,List<Product>> getFloorProducts(List<CategoryExt> allCategory) {
        //创建map集合
        Map<Integer,List<Product>> map = new HashMap<>();
        //遍历原有类目导航集合(一二类目集合)
        for (CategoryExt categoryExt : allCategory) {

            for (Object categorySecond : categoryExt.getCategorySeconds()) {
                CategorySecond categorySecond1 = (CategorySecond) categorySecond;
                //根据二级类目查询
                List<Product> products =productDao.getProductByCsid(categorySecond1.getCsid());

                map.put(categorySecond1.getCsid(),products);
            }

        }

        return map;
    }
    /*
     * 功能:查询列表
     * 类型:查
     * 作者:初子小
     * */
    @Override
    public ProductBean getProductBean(ProductBean productBean) {

        List<Product> products = null;
        Integer rowCount = 1;
        //判断一级类目
        if(productBean.getCid()!=null){
            //查询集合
            products = productDao.getProductListByCid(productBean);
            //查询总数
            rowCount = productDao.getRowCountByCid(productBean);
        }
        //查询二级类目加商品名称
        if(productBean.getCsid()!=null||productBean.getPname()!=null){

            products = productDao.getProductListByCsid(productBean);
            rowCount = productDao.getRowCounByCsid(productBean);
        }

        //封装参数
        productBean.setList(products);
        productBean.setRowCount(rowCount);
        //返回
        return productBean;
    }
    /*
     * 功能:查询商品
     * 类型:查
     * 作者:初子小
     * */
    @Override
    public Product getProductDetail(Integer pid) {
        return productDao.getProductDetail(pid);
    }
}
