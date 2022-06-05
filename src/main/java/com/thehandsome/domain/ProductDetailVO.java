// 작성자 : 김승환
// 기능 : 상품 상세페이지에 필요한 정보를 담은 VO
package com.thehandsome.domain;

import lombok.Data;

@Data
public class ProductDetailVO {
	private String pcode;
	private String pcolor;
	private String pname;
	private int pprice;
	private String pbrand;
	private String pcontent;
	private String imgUrl1;
	private String imgUrl2;
	private String imgUrl3;
	private String imgUrl4;
	private String imgUrl5;
	private String colorUrl;
	private String psize;
} // end class
