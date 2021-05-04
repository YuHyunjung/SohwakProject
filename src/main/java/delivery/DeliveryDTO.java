package delivery;

public class DeliveryDTO {
	private int product_code;
	private String receiver;
	private String delivery_address;
	private String delivery_phone;
	private String message;
	private String tracking_no;
	private String delivery_company;
	private String tracking_date;
	private String state;
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getDelivery_address() {
		return delivery_address;
	}
	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}
	public String getDelivery_phone() {
		return delivery_phone;
	}
	public void setDelivery_phone(String delivery_phone) {
		this.delivery_phone = delivery_phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTracking_no() {
		return tracking_no;
	}
	public void setTracking_no(String tracking_no) {
		this.tracking_no = tracking_no;
	}
	public String getDelivery_company() {
		return delivery_company;
	}
	public void setDelivery_company(String delivery_company) {
		this.delivery_company = delivery_company;
	}
	public String getTracking_date() {
		return tracking_date;
	}
	public void setTracking_date(String tracString_date) {
		this.tracking_date = tracString_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
