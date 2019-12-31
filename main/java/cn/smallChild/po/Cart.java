package cn.smallChild.po;


import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private Map<Integer,Cartltem> cartltems = new LinkedHashMap<>();

    private Double total = 0.0;

    public Collection<Cartltem> getCartltems() {
        return cartltems.values();
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    /*
    * 添加购物项
    * */
    public void addCartItem(Cartltem cartltem) {
        Integer pid = cartltem.getProduct().getPid();
        //判断购物车中是否存在该商品
        if(cartltems.containsKey(pid)){
            //存在,数量加
            Cartltem old =cartltems.get(pid);
            old.setCount(cartltem.getCount()+old.getCount());
        }else{
            //不存在直接添加
            cartltems.put(pid,cartltem);
        }
        total=total+cartltem.getSubTotal();

    }
    //更改1购物项数量
    public void changeCount(Integer count, Integer pid) {
        Cartltem cartltem = cartltems.get(pid);
        //原来的价钱
        total = total - cartltem.getSubTotal();
        cartltem.setCount(count);
        total = total+cartltem.getSubTotal();

    }
    //删除购物
    public void dolCartItem(Integer pid) {
        Cartltem remove = cartltems.remove(pid);
        total = total-remove.getSubTotal();
    }
}
