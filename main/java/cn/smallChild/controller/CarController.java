package cn.smallChild.controller;

import cn.smallChild.po.Cart;
import cn.smallChild.po.Cartltem;
import cn.smallChild.po.Product;
import cn.smallChild.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CarController {

    @Resource
    private ProductService productService;
    @Resource
    private HttpSession session;

    /*
     * 作用:跳转到到购物车
     * 类型:添加
     * 作者:初子小
     * */
    @RequestMapping("/toCart")
    public String toCartItem(){
        return "cart";
    }
    /*
     * 作用:添加购物车
     * 类型:添加
     * 作者:初子小
     * */


    @RequestMapping("/addCartItem")
    @ResponseBody
    public String addCartItem(Integer count,Integer pid){
        //1.接受参数并封装CartItem
        Cartltem cartltem = new Cartltem();
        //查询商品信息
        Product product = productService.getProductDetail(pid);
        cartltem.setProduct(product);
        cartltem.setCount(count);
        //2.获取session中的购物车将cart,将CartItem放入购物车
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null){
            //session中存在购物车则直接取用
            cart.addCartItem(cartltem);
        }else {
            //session中无购物车,则new一个cart放入session使用
            cart=new Cart();
            cart.addCartItem(cartltem);
            session.setAttribute("cart",cart);
        }
        return "ok";
    }
    //更改购物项数量
    @ResponseBody
    @RequestMapping("/changeCount")
    public String  changeCount(Integer count,Integer pid){
        Cart cart = (Cart)session.getAttribute("cart");
        if (cart!=null){
            cart.changeCount(count,pid);
        }
        return cart.getTotal()+"";
    }
    //删除购物项
    @ResponseBody
    @RequestMapping("/dolCartItem")
    public String  dolCartItem(Integer pid){
        Cart cart = (Cart)session.getAttribute("cart");

        if(cart!=null){
            cart.dolCartItem(pid);
        }

        return cart.getTotal()+"";
    }


    //清空购物车
    @ResponseBody
    @RequestMapping("/toqkgwc")
    public String  toqkgwc(){
        session.invalidate();
     return "1";
    }
}
