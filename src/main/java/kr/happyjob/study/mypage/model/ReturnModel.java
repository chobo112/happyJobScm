package kr.happyjob.study.mypage.model;

public class ReturnModel {
	private int seq;
	private String storage_code;
	private String item_code;
	private String return_order_date;
	private String return_processing_date;
	private int return_count;
	private String signYN;
	private String refund_bank;
	private String refund_bank_num;
	private String refund_bank_name;
	private int cust_id;

	private String item_name;
	private int item_price;
	private String obtain_date;

	private String startDate;
	private String endDate;

	// paging
	private String loginID;
	private int startSeq;
	private int pageSize;
	private int cpage;

	@Override
	public String toString() {
		return "ReturnModel [seq=" + seq + ", storage_code=" + storage_code + ", item_code=" + item_code
				+ ", return_order_date=" + return_order_date + ", return_processing_date=" + return_processing_date
				+ ", return_count=" + return_count + ", signYN=" + signYN + ", refund_bank=" + refund_bank
				+ ", refund_bank_num=" + refund_bank_num + ", refund_bank_name=" + refund_bank_name + ", cust_id="
				+ cust_id + "]";
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getStorage_code() {
		return storage_code;
	}

	public void setStorage_code(String storage_code) {
		this.storage_code = storage_code;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getReturn_order_date() {
		return return_order_date;
	}

	public void setReturn_order_date(String return_order_date) {
		this.return_order_date = return_order_date;
	}

	public String getReturn_processing_date() {
		return return_processing_date;
	}

	public void setReturn_processing_date(String return_processing_date) {
		this.return_processing_date = return_processing_date;
	}

	public int getReturn_count() {
		return return_count;
	}

	public void setReturn_count(int return_count) {
		this.return_count = return_count;
	}

	public String getSignYN() {
		return signYN;
	}

	public void setSignYN(String signYN) {
		this.signYN = signYN;
	}

	public String getRefund_bank() {
		return refund_bank;
	}

	public void setRefund_bank(String refund_bank) {
		this.refund_bank = refund_bank;
	}

	public String getRefund_bank_num() {
		return refund_bank_num;
	}

	public void setRefund_bank_num(String refund_bank_num) {
		this.refund_bank_num = refund_bank_num;
	}

	public String getRefund_bank_name() {
		return refund_bank_name;
	}

	public void setRefund_bank_name(String refund_bank_name) {
		this.refund_bank_name = refund_bank_name;
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

	public String getObtain_date() {
		return obtain_date;
	}

	public void setObtain_date(String obtain_date) {
		this.obtain_date = obtain_date;
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

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
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
