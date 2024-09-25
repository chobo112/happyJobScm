package kr.happyjob.study.mypage.dao;

import java.util.List;

import kr.happyjob.study.mypage.model.OrderModel;
import kr.happyjob.study.mypage.model.ReturnModel;
import kr.happyjob.study.product.model.CartModel;
import kr.happyjob.study.product.model.ProductModel;

public interface MypageDao {
	public List<ProductModel> cartList(String loginID);
	
	public ProductModel cartListOne(CartModel cartModel);
	
	public int cartCountChange(CartModel cartModel);
	
	public int productBuy(List<CartModel> cartModel);
	
	public CartModel cartInfo(CartModel cartModel);
	
	public int cartDelete(CartModel cartModel);
	
	public int cartListDelete(List<CartModel> cartModel);
	
	public int cartListCnt(String loginID);
	
	public List<OrderModel> orderHistory(OrderModel model);
	
	public int orderHistoryCnt(OrderModel model);
	
	public ReturnModel selectReturn(ReturnModel model);
	
	public int updateOrderReturn(ReturnModel model);
	
	public int insertOrderReturn(ReturnModel model);
	
	public ProductModel returnInfo(ProductModel model);
	
	public List<ReturnModel> returnHistory(ReturnModel model);
	
	public int returnHistoryCnt(ReturnModel model);
}
