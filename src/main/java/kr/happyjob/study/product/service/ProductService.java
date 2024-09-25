package kr.happyjob.study.product.service;

import java.util.List;

import kr.happyjob.study.product.model.CartModel;
import kr.happyjob.study.product.model.ProductModel;

public interface ProductService {
	
	public List<ProductModel> productList(ProductModel productInfo) throws Exception;
	
	public int productListCnt(ProductModel productInfo);
	
	public ProductModel productDetail(ProductModel productInfo) throws Exception;
	
	public int saveProduct(ProductModel productModel) throws Exception;
	
	public int productPay(ProductModel productModel, String loginID) throws Exception;

	public int productCart(CartModel cartModel, String loginID);
}
