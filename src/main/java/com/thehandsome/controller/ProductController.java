// 작성자 : 김승환
// 기능 : 상품 관리 컨트롤러
package com.thehandsome.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.thehandsome.domain.Criteria;
import com.thehandsome.domain.PageDTD;
import com.thehandsome.domain.ProductDetailVO;
import com.thehandsome.domain.ShoppingBagVO;
import com.thehandsome.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/product/*")
@Controller
@AllArgsConstructor
public class ProductController {
	@Setter(onMethod_ = @Autowired)
	private ProductService service;

	// 상품리스트를 get 방식으로 불러온다. 
	@GetMapping("/productList")
	public void productList(@RequestParam("pageNum") int pageNum, @RequestParam("amount") int amount, Model model) {
		log.info("productList");
		Criteria cri = new Criteria();
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		model.addAttribute("productList", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTD(cri, 5));
	} // end productList
	
	// 해당 상품의 상세페이지를 get 방식으로 불러온다.
	@GetMapping("/productDetail")
	public void productDetail(@RequestParam("pcode") String pcode, Model model) {
		log.info("productDetail");
		model.addAttribute("productDetail", service.getDetail(pcode));
	} // end productDetail
	
	// post 방식으로 해당 상품의 다른 색상 상품 정보를 불러온다. 
	@PostMapping("/productDetail2")
	//@ResponseBody 
	public void productDetail2(HttpServletResponse response, @RequestParam Map<String, Object> param) throws IOException { 
		log.info("productDetail2");
		String pcode = (String) param.get("pcode");
		ProductDetailVO dvo = new ProductDetailVO(); 
		dvo = service.getDetail(pcode);
	 
		Gson gson = new Gson(); 
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(gson.toJson(dvo)); // json 형태로 보내준다.
	} // end productDetail2
	
	// post 방식으로 같은 상품을 담으면 update, 다른 상품을 담으면 insert를 수행한다. 
	@PostMapping("/insertBag")
	public String insertBag(ShoppingBagVO bagVO, Model model) {
		log.info("insertBag");
		service.insertProduct(bagVO);
		return "redirect:/product/getProduct";
	} // end insertBag
	
	// get 방식으로 장바구니에 출력할 상품들을 불러온다.
	@GetMapping("/getProduct")
	public String getProduct(Model model) {
		log.info("getProduct");
		model.addAttribute("getProduct", service.getProduct());
		return "/product/shoppingBag";
	} // end getProduct
	
	// post 방식으로 장바구니에 담겨진 상품을 삭제한다.
	@PostMapping("/deleteProduct")
	@ResponseBody
	public void deleteProduct(HttpServletResponse response, @RequestParam Map<String, Object> param) throws IOException {
		log.info("deleteProduct");
		int cartno = Integer.parseInt((String)param.get("cartno"));
		ShoppingBagVO bagVO = new ShoppingBagVO();
		bagVO.setCartno(cartno);
				
		service.deleteProduct(bagVO);
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(gson.toJson(bagVO)); 
	} // end deleteProduct
	
	// post 방식으로 장바구니에 담겨진 상품들의 총 가격 합계를 불러온다.
	@PostMapping("/getTotalPrice")
	@ResponseBody
	public void getTotalPrice(HttpServletResponse response, @RequestParam Map<String, Object> param) throws IOException {
		log.info("getProduct");
		String id = (String)param.get("member");
		ShoppingBagVO bagVO = new ShoppingBagVO();
		bagVO = service.getTotalPrice(id);
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(gson.toJson(bagVO)); 
	} // end getTotalPrice
	
	// 상품 수량 변경 후 update
	@PostMapping("/updateAmount")
	@ResponseBody
	public void updateAmount(HttpServletResponse response, @RequestParam Map<String, Object> param) throws IOException {
		log.info("getProduct");
		int cartno = Integer.parseInt((String)param.get("cartno"));
		int cartamount = Integer.parseInt((String)param.get("cartamount"));
		ShoppingBagVO bagVO = new ShoppingBagVO();
		bagVO.setCartno(cartno);
		bagVO.setCartamount(cartamount);
		service.updateAmount(bagVO);
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(gson.toJson(bagVO)); 
	} // updateAmount
} // end class
