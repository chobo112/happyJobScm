package kr.happyjob.study.direction.model;


//재고테이블
public class TB_inventory {

		private String storage_code;		//FK : 창고코드
		private String model_num;			//PK : 모델번호
		private String item_code;			//FK : 품목코드
		private String product_code;		//제품코드
		private int inventory_count; 		//재고개수 
		public String getStorage_code() {
			return storage_code;
		}
		public void setStorage_code(String storage_code) {
			this.storage_code = storage_code;
		}
		public String getModel_num() {
			return model_num;
		}
		public void setModel_num(String model_num) {
			this.model_num = model_num;
		}
		public String getItem_code() {
			return item_code;
		}
		public void setItem_code(String item_code) {
			this.item_code = item_code;
		}
		public String getProduct_code() {
			return product_code;
		}
		public void setProduct_code(String product_code) {
			this.product_code = product_code;
		}
		public int getInventory_count() {
			return inventory_count;
		}
		public void setInventory_count(int inventory_count) {
			this.inventory_count = inventory_count;
		}
		
		
		
	
}
