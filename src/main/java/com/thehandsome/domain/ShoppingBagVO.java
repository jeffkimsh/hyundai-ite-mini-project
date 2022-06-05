// 작성자 : 김승환
// 기능 : 장바구니에 필요한 정보를 담은 VO
package com.thehandsome.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ShoppingBagVO {
	private String id;
	private int cartno;
	private String pcode;
	private String pbrand;
	private String pname;
	private int pprice;
	private String cartsize;
	private String cartcolor;
	private int cartamount;
	private String cartcolorurl;
	private Date cartregdate;
	private String cartenabled;
	private int sprice;
	private int total;
} // end class
