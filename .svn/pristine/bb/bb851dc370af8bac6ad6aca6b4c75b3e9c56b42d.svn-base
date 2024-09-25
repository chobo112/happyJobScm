package kr.happyjob.study.direction.model;

import java.util.Date;

//@Data
//발주(주문 시킬거)

public class TB_order {



	private String item_code;		//item_info pk : 품목코드 fk
	private String product_name;	//제품명
	private Date order_date;		//발주일자
	private int order_count;		//발주개수
	private String order_company;	//발주회사명
	private int signYN;				//임원승인여부 : 0-미승인, 1-승인
	private int depositYN;			//입금여부 	   : 0-미입금, 1-입금
	
	
	//조회용 제품테이블
	//제품테이블(item) : item_code(제품명) item_name(제품번호)
	private String item_name;
	
	//검색용
	//Map<Sting, Object> resultMap = new HashMap<>();
	private Date searchStDate;
	private Date searchEdDate;
	
	public Date getOrder_date() {
		return order_date;
	}


	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}


	public Date getSearchStDate() {
		return searchStDate;
	}


	public void setSearchStDate(Date searchStDate) {
		this.searchStDate = searchStDate;
	}


	public Date getSearchEdDate() {
		return searchEdDate;
	}


	public void setSearchEdDate(Date searchEdDate) {
		this.searchEdDate = searchEdDate;
	}


	public String getItem_code() {
		return item_code;
	}


	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}



	public int getOrder_count() {
		return order_count;
	}


	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}


	public String getOrder_company() {
		return order_company;
	}


	public void setOrder_company(String order_company) {
		this.order_company = order_company;
	}


	public int getSignYN() {
		return signYN;
	}


	public void setSignYN(int signYN) {
		this.signYN = signYN;
	}


	public int getDepositYN() {
		return depositYN;
	}


	public void setDepositYN(int depositYN) {
		this.depositYN = depositYN;
	}


	public String getItem_name() {
		return item_name;
	}


	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
}
