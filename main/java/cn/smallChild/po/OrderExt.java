package cn.smallChild.po;

import java.util.List;

public class OrderExt extends Order{

    private List<OrderItemExt> orderItemExts;

    public List<OrderItemExt> getOrderItemExts() {
        return orderItemExts;
    }

    public void setOrderItemExts(List<OrderItemExt> orderItemExts) {
        this.orderItemExts = orderItemExts;
    }
}
