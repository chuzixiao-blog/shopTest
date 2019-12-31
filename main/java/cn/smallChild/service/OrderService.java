package cn.smallChild.service;

import cn.smallChild.po.Cart;
import cn.smallChild.po.Order;
import cn.smallChild.po.OrderBean;
import cn.smallChild.po.OrderExt;

public interface OrderService {
    /*
    * 添加订单
    * */
    Integer addOrder(Order order, Cart cart);

    /*
    * 修改订单是否支付
    * */
    void chengeState(Order oid);

    /*
    * 订单详情
    * */
    OrderExt getOrderExt(Order order);

    /*
    * 我的订单分页
    * */
    OrderBean getOrderExtsByUid(OrderBean orderBean);

    /*
    *修改成2
    * */
    void setstate3(Integer oid);

    void toDelPay(Integer oid);
}
