package kr.happyjob.study.product.dao;

import java.util.List;

import kr.happyjob.study.product.model.CartModel;
import kr.happyjob.study.product.model.ProductModel;

public interface ProductDao {
	
	public List<ProductModel> productList(ProductModel productInfo) throws Exception;
	
	public int productListCnt(ProductModel productInfo);
	
	public ProductModel productDetail(ProductModel productInfo) throws Exception;
	
	public int saveProduct(ProductModel productModel) throws Exception;

	public int productCart(CartModel cartModel);
	
	public Integer productDuplicateCheck(CartModel cartModel);
	
	public int countUpdate(CartModel cartModel);
	
	public int productPay(ProductModel productModel);
}
