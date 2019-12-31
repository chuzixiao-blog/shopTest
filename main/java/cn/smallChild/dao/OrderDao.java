package cn.smallChild.dao;

import cn.smallChild.po.Order;
import cn.smallChild.po.OrderBean;
import cn.smallChild.po.OrderExt;
import cn.smallChild.po.OrderItem;

import java.util.List;

public interface OrderDao {
    /*
    * 添加订单
    * */
    void addOrder(Order order);
    /*
    * 添加购物项
    * */
    void addOrderItem(OrderItem orderItem);
    /*
    * 修改订单状态
    * */
    void chengeState(Order order);
    /*
     * 查询订单详情
     * */
    OrderExt getOrderExt(Order order);
    /*
     * 我的订单分页
     * */
    List<OrderExt> getOrderExtByUid(OrderBean orderBean);
    /*
    * 查询我的订单总数
    * */
    Integer getRowCount(OrderBean orderBean);

    /*
    * 修改订单
    * */
    void setstate3(Integer oid);
    /*
    * 删除订单
    * */
    void toDelPayitrm(Integer oid);
    /*
    * 删除订单残留数据
    * */
    void toDelPay(Integer oid);


}
