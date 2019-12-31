package cn.smallChild.po;

public class CategorySecond {

    private int csid;
    private String csname;
    private int cid;

    public int getCsid() {
        return csid;
    }

    public void setCsid(int csid) {
        this.csid = csid;
    }

    public String getCsname() {
        return csname;
    }

    public void setCsname(String csname) {
        this.csname = csname;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "二级类目 {" +
                "csid=" + csid +
                ", csname='" + csname + '\'' +
                ", cid=" + cid +
                '}';
    }
}
