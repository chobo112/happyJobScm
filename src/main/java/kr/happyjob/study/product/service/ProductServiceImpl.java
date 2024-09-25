package kr.happyjob.study.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.product.dao.ProductDao;
import kr.happyjob.study.product.model.CartModel;
import kr.happyjob.study.product.model.ProductModel;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDao productDao;
	
	@Override
	public List<ProductModel> productList(ProductModel productInfo) throws Exception {

		return productDao.productList(productInfo);
	}

	@Override
	public int saveProduct(ProductModel productModel) throws Exception {

		return productDao.saveProduct(productModel);
	}

	@Override
	public ProductModel productDetail(ProductModel productInfo) throws Exception {

		return productDao.productDetail(productInfo);
	}

	@Override
	public int productPay(ProductModel productModel, String loginID) throws Exception {
		ProductModel productPayInfo = productDao.productDetail(productModel);
		
		productPayInfo.setLoginID(loginID);
		productPayInfo.setCount(productModel.getCount());
		productPayInfo.setTotal(productPayInfo.getCount() * productPayInfo.getItem_price());
		
		return productDao.productPay(productPayInfo);
	}

	@Override
	public int productCart(CartModel cartModel, String loginID) {

		cartModel.setLoginID(loginID);
		
		Integer check = productDao.productDuplicateCheck(cartModel);
		
		int result;
		
		if(check != null) {
			cartModel.setObtain_count(cartModel.getObtain_count()+ check);
			
			result = productDao.countUpdate(cartModel);
		} else {
			result = productDao.productCart(cartModel); 
		}

		return result; 
	}

	@Override
	public int productListCnt(ProductModel productInfo) {

		return productDao.productListCnt(productInfo);
	}

}
