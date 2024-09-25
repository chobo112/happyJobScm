package kr.happyjob.study.mypage.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.mypage.dao.MypageDao;
import kr.happyjob.study.mypage.model.OrderModel;
import kr.happyjob.study.mypage.model.ReturnModel;
import kr.happyjob.study.product.model.CartModel;
import kr.happyjob.study.product.model.ProductModel;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	MypageDao mypageDao;

	@Override
	public List<ProductModel> cartList(String loginID) {
		
		List<ProductModel> cartList = mypageDao.cartList(loginID);
		
		for(int i=0; i<cartList.size(); i++) {
			cartList.get(i).setTotal(cartList.get(i).getItem_price() * cartList.get(i).getCount());
		}
		
		return cartList;
	}

	@Override
	public ProductModel cartCountChange(CartModel cartModel, String loginID) {
		cartModel.setLoginID(loginID);
		
		mypageDao.cartCountChange(cartModel);
		
		ProductModel result = mypageDao.cartListOne(cartModel);
		
		return result;
	}
	
	@Override
	public int cartCountChangeJson(CartModel cartModel, String loginID) {
		cartModel.setLoginID(loginID);
		
		return mypageDao.cartCountChange(cartModel);
	}

	@Override
	public int productBuy(List<CartModel> cartModel, String loginID) {
		int result = 0;
		List<CartModel> buyInfo = new ArrayList<>(); 
		
		for(int i=0; i<cartModel.size(); i++) {
			cartModel.get(i).setLoginID(loginID);
			
			buyInfo.add(i, mypageDao.cartInfo(cartModel.get(i)));
		}
		
		result += mypageDao.productBuy(buyInfo);
		
		if(result > 0) {
			mypageDao.cartListDelete(buyInfo);
		}
		
		return result;
	}

	@Override
	public int productBuyJson(Map<String, Object> list, String loginID) {
		int result = 0;
		List<CartModel> buyInfo = new ArrayList<>(); 
		
		// param 형식: {item=[1, AA111]}

		List<String> itemList = (List<String>) list.get("item");
		String[] itemArray = itemList.toArray(new String[0]);
		List<CartModel> cartList;
		
		int idx =0;
		for(String itemCode: itemArray) {
			CartModel cart = new CartModel();
			cart.setItem_code(itemCode);
			cart.setLoginID(loginID);
			// cartList.add(cart);
			buyInfo.add(idx++, mypageDao.cartInfo(cart));
		}
		
		result += mypageDao.productBuy(buyInfo);
		
		if(result > 0) {
			mypageDao.cartListDelete(buyInfo);
		}
		
		return result;
	}
	
	
	@Override
	public int cartDelete(CartModel cartModel, String loginID) {
		cartModel.setLoginID(loginID);
		
		return mypageDao.cartDelete(cartModel);
	}

	@Override
	public int cartListCnt(String loginID) {

		return mypageDao.cartListCnt(loginID);
	}

	@Override
	public List<OrderModel> orderHistory(OrderModel model, String loginID) {
		model.setLoginID(loginID);
		model.setStartSeq((model.getCpage()-1) * model.getPageSize());
		model.setStartDate(dateFormat(model.getStartDate()));
		model.setEndDate(dateFormat(model.getEndDate()));
		
		List<OrderModel> list = mypageDao.orderHistory(model); 
		
		return list;
	}

	@Override
	public int orderHistoryCnt(OrderModel model, String loginID) {
		model.setLoginID(loginID);

		return mypageDao.orderHistoryCnt(model);
	}

	@Override
	public int orderReturn(ReturnModel model) {
		Optional<ReturnModel> returnModel = Optional.ofNullable(mypageDao.selectReturn(model));
		
		if(returnModel.isPresent()) {
			returnModel.get().setSeq(model.getSeq());
			returnModel.get().setRefund_bank(model.getRefund_bank());
			returnModel.get().setRefund_bank_name(model.getRefund_bank_name());
			returnModel.get().setRefund_bank_num(model.getRefund_bank_num());
			
			if(mypageDao.updateOrderReturn(returnModel.get()) > 0 &&
				mypageDao.insertOrderReturn(returnModel.get()) > 0) {
				return 1;
			}
		}

		return 0;
	}

	@Override
	public ProductModel returnInfo(ProductModel model) {
		
		return mypageDao.returnInfo(model);
	}

	@Override
	public List<ReturnModel> returnHistory(ReturnModel model, String loginID) {
		model.setLoginID(loginID);
		model.setStartSeq((model.getCpage()-1) * model.getPageSize());
		model.setStartDate(dateFormat(model.getStartDate()));
		model.setEndDate(dateFormat(model.getEndDate()));
		
		return mypageDao.returnHistory(model);
	}

	@Override
	public int returnHistoryCnt(ReturnModel model, String loginID) {
		model.setLoginID(loginID);
		
		return mypageDao.returnHistoryCnt(model);
	}
	
	public String dateFormat(String date) {
		if(date.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			date = (dateFormat.format(today));
		}
		
		return date;
	}




}
