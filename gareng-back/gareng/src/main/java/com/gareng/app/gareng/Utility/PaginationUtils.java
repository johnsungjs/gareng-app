package com.gareng.app.gareng.utility;

import com.gareng.app.gareng.http.entity.GetItem.GetItemPagination;

import lombok.Data;

@Data
public class PaginationUtils {
    Integer limit;
    Integer offset;
    Integer sizePerPage;
    Integer pageAt;
    Integer totalData;
    Integer totalPage;
    String search;

    public PaginationUtils(GetItemPagination getItemPagination){
        this.limit = getItemPagination.getSizePerPage();
        this.sizePerPage = this.limit;
        this.pageAt = getItemPagination.getPageAt();
        this.offset = this.limit*(getItemPagination.getPageAt()-1);
        this.search = getItemPagination.getSearch();
    }

    public void setTotal(Integer totalData){
        this.totalData = totalData;
        double tempcalc = (double) this.totalData/this.sizePerPage;
        this.totalPage = (int) Math.ceil(tempcalc);
        if(this.sizePerPage == 0){
            this.totalPage = 1;
        }
    }

}
