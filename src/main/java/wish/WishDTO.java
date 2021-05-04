package wish;

import product.ProductDTO;

public class WishDTO extends ProductDTO{
	private int wish_code;

	private String user_id;

	public int getWish_code() {
		return wish_code;
	}
	public void setWish_code(int wish_code) {
		this.wish_code = wish_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	

}
