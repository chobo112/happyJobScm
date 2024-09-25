package kr.happyjob.study.direction.model;


//수주테이블(주문받은거)
public class TB_obtain {
	
	private Long seq;				//pk : 시퀀스
	private String company_code;	//pk : 기업코드
	private String item_code;		//item_info : 품목코드
	private String obtain_date;		//수주일자
	private int obtain_count;		//주문개수
	private String returnYN;		//반품요청여부 : 0-N, 1-반품요청(Y)
	private String depositYN;		//입금여부	   : 0-미입금, 1-입금
	private String delivery_date;	//납품 희망일자
	public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
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

	
	
}
