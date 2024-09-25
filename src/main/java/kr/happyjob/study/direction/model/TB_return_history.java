package kr.happyjob.study.direction.model;


//반품이력테이블
public class TB_return_history {

	private String item_code;				//FK:품목코드
	private Long seq;						//FK: 수주시퀀스 bigint  
	private String storage_code;			//FK: 창고코드
	private String company_code;			//FK: 기업코드
	private String return_order_date;		//반품신청일자
	private String return_processing_date;	//반품처리일자
	private int return_count; 				//반품개수
	private String product_name;			//제품명
	private String refund_bank;				//은행
	private String refund_bank_num;			//계좌번호
	private String refund_bank_name;		//예금주
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public String getStorage_code() {
		return storage_code;
	}
	public void setStorage_code(String storage_code) {
		this.storage_code = storage_code;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
	
	
	
}
