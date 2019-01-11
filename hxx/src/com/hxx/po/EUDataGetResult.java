package com.hxx.po;

import java.util.List;

/**
 * 分页查询实体类
 *
 */
public class EUDataGetResult {
	
	  //结果总数  
    private long total;  
      //结果行数  
    private List<?> rows;  
    public long getTotal() {  
        return total;  
    }  
    public void setTotal(long total) {  
        this.total = total;  
    }  
    public List<?> getRows() {  
        return rows;  
    }  
    public void setRows(List<?> rows) {  
        this.rows = rows;  
    }  

}
