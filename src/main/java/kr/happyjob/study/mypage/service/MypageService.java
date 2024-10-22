package kr.happyjob.study.mypage.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.mypage.model.OrderModel;
import kr.happyjob.study.mypage.model.ReturnModel;
import kr.happyjob.study.product.model.CartModel;
import kr.happyjob.study.product.model.ProductModel;

public interface MypageService {

	public List<ProductModel> cartList(String loginID);
	
	public ProductModel cartCountChange(CartModel cartModel, String loginID);

	public int cartCountChangeJson(CartModel cartModel, String loginID);
	
	public int productBuy(List<CartModel> list, String loginID);
	
	public int productBuyJson(Map<String, Object> list, String loginID);
	
	public int cartDelete(CartModel cartModel, String loginID);
	
	public int cartListCnt(String loginID);
	
	public List<OrderModel> orderHistory(OrderModel model, String loginID);
	
	public int orderHistoryCnt(OrderModel model, String loginID);
	
	public int orderReturn(ReturnModel model);
	
	public ProductModel returnInfo(ProductModel model);
	
	public List<ReturnModel> returnHistory(ReturnModel model, String loginID);
	
	public int returnHistoryCnt(ReturnModel model, String loginID);
}
