package kr.happyjob.study.direction.model;


//창고테이블
public class TB_storage {
	
	private String storage_code;		//PK : 창고코드
	private String storage_name;		//창고명
	private String storage_loc;			//창고위치
	private String storage_detail_loc;	//창고상세위치
	private String storage_loc_num;		//창고우편번호
	private String storage_manager;		//창고담당자
	public String getStorage_code() {
		return storage_code;
	}
	public void setStorage_code(String storage_code) {
		this.storage_code = storage_code;
	}
	public String getStorage_name() {
		return storage_name;
	}
	public void setStorage_name(String storage_name) {
		this.storage_name = storage_name;
	}
	public String getStorage_loc() {
		return storage_loc;
	}
	public void setStorage_loc(String storage_loc) {
		this.storage_loc = storage_loc;
	}
	public String getStorage_detail_loc() {
		return storage_detail_loc;
	}
	public void setStorage_detail_loc(String storage_detail_loc) {
		this.storage_detail_loc = storage_detail_loc;
	}
	public String getStorage_loc_num() {
		return storage_loc_num;
	}
	public void setStorage_loc_num(String storage_loc_num) {
		this.storage_loc_num = storage_loc_num;
	}
	public String getStorage_manager() {
		return storage_manager;
	}
	public void setStorage_manager(String storage_manager) {
		this.storage_manager = storage_manager;
	}
	
	
	
}
