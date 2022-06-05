// 작성자 : 김승환
// 기능 : 상품 리스트에 필요한 정보를 담은 VO
package com.thehandsome.domain;

import lombok.Data;

@Data
public class ProductListVO {
	private String pcode;
	private String imgUrl1;
	private String colorUrl;
	private String pname;
	private String pprice;
	private String pbrand;
	private String pcolor;
} // end class
