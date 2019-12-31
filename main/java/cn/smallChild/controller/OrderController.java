package cn.smallChild.controller;

import cn.smallChild.po.*;
import cn.smallChild.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource
    private OrderService orderService;

    @Resource
    private HttpSession session;

    /*
    * 跳转确认订单页
    * */
    @RequestMapping("/toConfirmOrder")
    public String toConfirmOrder(){
        //判断是否为登录状态
        //代施工
        return  "confirmOrder";
    }

    /*
    * 跳到确认收获页
    * 确认收货
    * */
    @RequestMapping("/toPayss")
    public String toPayss(){
        return "payss";
    }

    /*
    * 跳转到确认购买页
    * */
    @RequestMapping("/toPays")
    public String toPays(){

        return  "pays";
    }

    /*
    *确认收货
    * */
    @RequestMapping("/doPays")
    public  String toPay(Integer pageNow,Integer oid){
        int pageNows = 1;
        if (pageNow!=null){
            pageNows = pageNow;
        }
        orderService.setstate3(oid);
        return "redirect:/order/toMyOrder.do?pageNow="+pageNows;
    }

    /*
    * 删除订单
    * */
    @RequestMapping("/toDelPay")
    public  String toDelPay(Integer pageNow,Integer oid){
        int pageNows = 1;
        if (pageNow!=null){
            pageNows = pageNow;
        }
        orderService.toDelPay(oid);
        return "redirect:/order/toMyOrder.do?pageNow="+pageNows;
    }
    /*
    * 支付
    * */
    @RequestMapping("/toPay")
    public  String toPay(Order order, Model model){
        User user = (User)session.getAttribute("user");
        Cart cart =(Cart)session.getAttribute("cart");
        //获取用户id
        order.setUid(user.getUid());
        Integer oid = orderService.addOrder(order,cart);
        model.addAttribute("oid",oid);
        return "Pay";
    }

    /*
    * 将修改成1为支付
    * */
    @RequestMapping("/doPay")
    public  String doPay(Order order,Model model){
        //判断支付是否成功
        //成功前提下

        //修改订单信息
        order.setState(1);
        orderService.chengeState(order);

        //查询订单信息
        OrderExt orderExt = orderService.getOrderExt(order);
        model.addAttribute("orderExt",orderExt);
        return "PaySuccess";
    }

    /*
    * 跳转我的订单页面
    * */
    @RequestMapping("/toMyOrder")
    public String toMyOrder(OrderBean orderBean,Model model){
        //获取从session里面获取用户id
        User user = (User)session.getAttribute("user");
        //从session里面获取用户id查询用户id
        orderBean.setUid(user.getUid());
        orderBean.setPageSize(3);
        //查询用户列表
        OrderBean result  = orderService.getOrderExtsByUid(orderBean);

        model.addAttribute("orderBean",result);

        return "myOrders";
    }
}
