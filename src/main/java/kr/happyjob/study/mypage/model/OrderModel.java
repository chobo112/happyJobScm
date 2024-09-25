package kr.happyjob.study.mypage.model;

public class OrderModel {
	private int seq;
	private String item_code;
	private String obtain_date;
	private int obtain_count;
	private String returnYN;
	private String depositYN;
	private String delivery_date;
	private int cust_id;

	private String item_name;
	private int item_price;

	// 날짜 계산
	private String startDate;
	private String endDate;

	// paging
	private String loginID;
	private int startSeq;
	private int pageSize;
	private int cpage;

	@Override
	public String toString() {
		return "OrderModel [seq=" + seq + ", item_code=" + item_code + ", obtain_date=" + obtain_date
				+ ", obtain_count=" + obtain_count + ", returnYN=" + returnYN + ", depositYN=" + depositYN
				+ ", delivery_date=" + delivery_date + ", cust_id=" + cust_id + ", item_name=" + item_name
				+ ", item_price=" + item_price + " startDate=" + startDate + " endDate = " + endDate + "]";
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getObtain_date() {
		return obtain_date;
	}

	public void setObtain_date(String obtain_date) {
		this.obtain_date = obtain_date;
	}

	public int getObtain_count() {
		return obtain_count;
	}

	public void setObtain_count(int obtain_count) {
		this.obtain_count = obtain_count;
	}

	public String getReturnYN() {
		return returnYN;
	}

	public void setReturnYN(String returnYN) {
		this.returnYN = returnYN;
	}

	public String getDepositYN() {
		return depositYN;
	}

	public void setDepositYN(String depositYN) {
		this.depositYN = depositYN;
	}

	public String getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}

	public int getCust_id() {
		return cust_id;
	}

	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public int getStartSeq() {
		return startSeq;
	}

	public void setStartSeq(int startSeq) {
		this.startSeq = startSeq;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCpage() {
		return cpage;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
