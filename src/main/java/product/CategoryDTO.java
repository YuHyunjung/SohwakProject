package product;

public class CategoryDTO {
	/*
	 * category_no	int	 primary key,
     * category_list char(30) 
	 * */
	private Integer categoryNo;
	private String category;
	
	public Integer getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
