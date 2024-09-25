package kr.happyjob.study.direction.model;


//제품정보 테이블
public class TB_item_info {
	
	private String item_code;		//PK : 품목코드	
	private String item_name;		//품목명
	private String major_class;		//대분류
	private String sub_class;		//소분류
	private String manufac;			//제조업체
	private String item_stand;		//규격
	private int item_price;			//단가
	private int item_surtax;		//부가세
	private String item_note;		//비고
	private int provide_value;		//공급가액
	private String equipment_type;	//장비구분
	private String img_path;		//이미지저장경로
	private String product_detail;	//상세정보
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getMajor_class() {
		return major_class;
	}
	public void setMajor_class(String major_class) {
		this.major_class = major_class;
	}
	public String getSub_class() {
		return sub_class;
	}
	public void setSub_class(String sub_class) {
		this.sub_class = sub_class;
	}
	public String getManufac() {
		return manufac;
	}
	public void setManufac(String manufac) {
		this.manufac = manufac;
	}
	public String getItem_stand() {
		return item_stand;
	}
	public void setItem_stand(String item_stand) {
		this.item_stand = item_stand;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_surtax() {
		return item_surtax;
	}
	public void setItem_surtax(int item_surtax) {
		this.item_surtax = item_surtax;
	}
	public String getItem_note() {
		return item_note;
	}
	public void setItem_note(String item_note) {
		this.item_note = item_note;
	}
	public int getProvide_value() {
		return provide_value;
	}
	public void setProvide_value(int provide_value) {
		this.provide_value = provide_value;
	}
	public String getEquipment_type() {
		return equipment_type;
	}
	public void setEquipment_type(String equipment_type) {
		this.equipment_type = equipment_type;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	
	//db에 없는데??
	/*
	private String product_name;				//제품명
	private int product_price;					//가격
	private String model_name;					//모델명
	private String product_manufacturer;		//제조사
	*/
	
	
}
