package kr.happyjob.study.responsibilities.vo;

public class ReturnVO {
	private int seq;
	private int storage_code;
	private String item_code;
	private String return_order_date;
	private int return_count;
	private String signYN;
	private String refund_bank;
	private String refund_bank_num;
	private String refund_bank_name;
	private int cust_id;
	private int inventory_count;
	
	public int getInventory_count() {
		return inventory_count;
	}
	public void setInventory_count(int inventory_count) {
		this.inventory_count = inventory_count;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getStorage_code() {
		return storage_code;
	}
	public void setStorage_code(int storage_code) {
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
	
}
