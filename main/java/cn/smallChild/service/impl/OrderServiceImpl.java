package cn.smallChild.service.impl;

import cn.smallChild.dao.OrderDao;
import cn.smallChild.po.*;
import cn.smallChild.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;
    /*
     * 功能:添加订单
     * 类型:
     * 作者:初子小
     * */
    @Override
    public Integer addOrder(Order order, Cart cart) {
        //添加订单
        order.setTotal(cart.getTotal());
        order.setOrderTime(new Date());
        orderDao.addOrder(order);
        //添加订单项
        for (Cartltem cartltem : cart.getCartltems()) {
            OrderItem orderItem = new OrderItem();
            //封装参数
            orderItem.setCount(cartltem.getCount());
            orderItem.setSubTotal(cartltem.getSubTotal());
            orderItem.setPid(cartltem.getProduct().getPid());
            //sql
            orderItem.setOid(order.getOid());
            orderDao.addOrderItem(orderItem);
        }
        return order.getOid();
    }

    /*
    *修改订单状态
    *
    * */
    @Override
    public void chengeState(Order order) {
        orderDao.chengeState(order);
    }

    /*
    * 查询订单详情
    * */
    @Override
    public OrderExt getOrderExt(Order order) {
        return orderDao.getOrderExt(order);
    }
    /*
    * 我的订单分页
    * */
    @Override
    public OrderBean getOrderExtsByUid(OrderBean orderBean) {
        //获取集合
        List<OrderExt> list = orderDao.getOrderExtByUid(orderBean);

        //获取页数
        Integer rowCount = orderDao.getRowCount(orderBean);

        orderBean.setList(list);
        orderBean.setRowCount(rowCount);

        return orderBean;
    }

    /*
    * 确认订单
    * */
    @Override
    public void setstate3(Integer oid) {
        orderDao.setstate3(oid);
        System.out.println("2121211212"+oid);
    }

    /*
    * 删除订单
    * */
    @Override
    public void toDelPay(Integer oid) {
        orderDao.toDelPayitrm(oid);
        orderDao.toDelPay(oid);
    }
}
