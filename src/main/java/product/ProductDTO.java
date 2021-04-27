package product;

public class ProductDTO {

	private Integer product_code;
	private String product_name;
	private String user_id;
	private Integer category_no;
	private Integer min_price;
	private Integer max_price;
	private Integer current_price;
	private String regist_date;
	private String end_date;
	private String discription;
	private String thumnail;
	
	public Integer getProduct_code() {
		return product_code;
	}
	public void setProduct_code(Integer product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getCategory_no() {
		return category_no;
	}
	public void setCategory_no(Integer category_no) {
		this.category_no = category_no;
	}
	public Integer getMin_price() {
		return min_price;
	}
	public void setMin_price(Integer min_price) {
		this.min_price = min_price;
	}
	public Integer getMax_price() {
		return max_price;
	}
	public void setMax_price(Integer max_price) {
		this.max_price = max_price;
	}
	public Integer getCurrent_price() {
		return current_price;
	}
	public void setCurrent_price(Integer current_price) {
		this.current_price = current_price;
	}
	public String getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	
}
