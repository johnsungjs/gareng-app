package com.gareng.app.gareng.http.entity.GetItem;

import com.gareng.app.gareng.Utility.PaginationUtils;

import lombok.Data;

@Data
public class GetItemPagination {
   private Integer pageAt; 
   private Integer totalPage;
   private Integer total;
   private Integer sizePerPage;
   private String search;

   public void updateValue(PaginationUtils paginateUtils){
      this.pageAt = paginateUtils.getPageAt();
      this.totalPage = paginateUtils.getTotalPage();
      this.total = paginateUtils.getTotalData();
      this.sizePerPage = paginateUtils.getSizePerPage();
   }
}
