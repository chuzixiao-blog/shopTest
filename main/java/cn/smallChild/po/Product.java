package cn.smallChild.po;

import java.util.Date;

public class Product {

    private int pid;
    private String pname;
    private double marketPrice;
    private double shopPrice;
    private String image;
    private String pdesc;
    private int isHot;
    private Date pdate;
    private int csid;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(double marketPrice) {
        this.marketPrice = marketPrice;
    }

    public double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public int getIsHot() {
        return isHot;
    }

    public void setIsHot(int isHot) {
        this.isHot = isHot;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public int getCsid() {
        return csid;
    }

    public void setCsid(int csid) {
        this.csid = csid;
    }

    @Override
    public String toString() {
        return "商品 {" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", marketPrice=" + marketPrice +
                ", shopPrice=" + shopPrice +
                ", image='" + image + '\'' +
                ", pdesc='" + pdesc + '\'' +
                ", isHot=" + isHot +
                ", pdate=" + pdate +
                ", csid=" + csid +
                '}';
    }
}
