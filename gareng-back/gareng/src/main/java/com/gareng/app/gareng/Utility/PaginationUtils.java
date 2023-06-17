package com.gareng.app.gareng.Utility;

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

    public PaginationUtils(GetItemPagination getItemPagination){
        this.limit = getItemPagination.getSizePerPage();
        this.sizePerPage = this.limit;
        this.pageAt = getItemPagination.getPageAt();
        this.offset = this.limit*(getItemPagination.getPageAt()-1);
    }

    public void setTotal(Long totalData){
        this.totalData = totalData.intValue();
        double tempcalc = (double) this.totalData/this.sizePerPage;
        this.totalPage = (int) Math.ceil(tempcalc);
    }

}
