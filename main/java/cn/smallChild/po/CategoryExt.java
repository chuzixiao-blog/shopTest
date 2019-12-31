package cn.smallChild.po;

import java.util.List;

public class CategoryExt<T> extends Category{

    private List<T> categorySeconds;

    public List<T> getCategorySeconds() {
        return categorySeconds;
    }

    public void setCategorySeconds(List<T> categorySeconds) {
        this.categorySeconds = categorySeconds;
    }

}
