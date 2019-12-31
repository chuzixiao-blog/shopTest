package cn.smallChild.po;

import java.util.List;

public class PageBean<T> {
    private Integer pageNow = 1;
    private Integer pageSize = 12;
    private Integer pageCount;//算出来的
    private Integer rowCount;//数据库查出来的
    private List<T> list;
    private Integer start;

    public Integer getPageNow() {
        if (pageNow<1){
            pageNow=1;
        }
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        if (rowCount%pageSize==0){
            pageCount = rowCount/pageSize;
        }else {
            pageCount = rowCount/pageSize+1;
        }
        return pageCount;
    }

    public Integer getRowCount() {
        return rowCount;
    }

    public void setRowCount(Integer rowCount) {
        this.rowCount = rowCount;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getStart() {
        return (getPageNow()-1)*pageSize;
    }
}
