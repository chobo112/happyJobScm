package kr.happyjob.study.executive.model;

public class StorageDetailModel {
	
	private String storage_code;
	private String storage_name;
	private String model_num;
	private String item_code;
	private String item_name;
	private String item_price;
	private String inventory_count;
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
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_price() {
		return item_price;
	}
	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}
	public String getInventory_count() {
		return inventory_count;
	}
	public void setInventory_count(String inventory_count) {
		this.inventory_count = inventory_count;
	}
	@Override
	public String toString() {
		return "InventoryModel [storage_code=" + storage_code + ", storage_name=" + storage_name + ", model_num="
				+ model_num + ", item_code=" + item_code + ", item_name=" + item_name + ", item_price=" + item_price
				+ ", inventory_count=" + inventory_count + "]";
	}
}
