package kr.happyjob.study.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.happyjob.study.product.model.CartModel;
import kr.happyjob.study.product.model.ProductModel;
import kr.happyjob.study.product.service.ProductService;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	@GetMapping("product.do")
	public String productPage() {
		
		return "product/product";
	}
	
	@PostMapping("productList.do")
	@ResponseBody
	public ModelAndView productList(@RequestBody ProductModel productModel, HttpServletRequest request, HttpSession session) throws Exception{
		logger.info("+ Start " + className + ".productList");
		logger.info("   - paramMap : " + productModel);
		
		ModelAndView mv = new ModelAndView();
		
		productModel.setStartSeq((productModel.getCpage() - 1) * productModel.getPageSize());
		
		List<ProductModel> productInfo = productService.productList(productModel);
		int cnt = productService.productListCnt(productModel);
		
		mv.addObject("productInfo", productInfo);
		mv.addObject("cnt", cnt);
		mv.setViewName("product/productList");
		
		return mv;
	} 
	
	@PostMapping("productDetail.do")
	@ResponseBody
	public Map<String, Object> productDetail(@RequestBody ProductModel productModel, HttpServletRequest request, HttpSession session) throws Exception{
		logger.info("+ Start " + className + ".productDetail");
		logger.info("   - paramMap : " + productModel);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		ProductModel productInfo = productService.productDetail(productModel);
		
		resultMap.put("productInfo", productInfo);
		
		return resultMap;
	} 
	
	@PostMapping("productPay.do")
	@ResponseBody
	public String productPay(@RequestBody ProductModel productModel, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".productPay");
		logger.info("   - paramMap : " + productModel);
		
		String loginID = (String) session.getAttribute("loginId");
		String resultMsg = "";
		
		int result = productService.productPay(productModel, loginID);
		
		if(result > 0) {
			resultMsg = "/mypage/order.do";
		} else {
			resultMsg = "product/product";
		}
		
		return resultMsg;
	}
	
	@PostMapping("productCart.do")
	@ResponseBody
	public String productCart(@RequestBody CartModel cartModel, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".productCart");
		logger.info("   - paramMap : " + cartModel);
		
		String loginID = (String) session.getAttribute("loginId");
		
		int result = productService.productCart(cartModel, loginID);
		String resultMsg;
		
		if(result > 0) {
			logger.info("result : " + result);
			resultMsg = "success";
		} else {
			resultMsg = "fail";
		}
		
		return resultMsg;
	}
}
