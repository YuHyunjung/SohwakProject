package user;

public class UserDTO {
	private String id;
	private String pwd;
	private int pwdCode;
	private String answer;
	private String name;
	private String phone;
	private String email;
	private int bankCode;
	private String accountNum;
	private String  join;
	private String drop;
	private String dropDate;
	private int virtualAccount;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getPwdCode() {
		return pwdCode;
	}
	public void setPwdCode(int pwdCode) {
		this.pwdCode = pwdCode;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBankCode() {
		return bankCode;
	}
	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	public String getJoin() {
		return join;
	}
	public void setJoin(String join) {
		this.join = join;
	}
	public String getDrop() {
		return drop;
	}
	public void setDrop(String drop) {
		this.drop = drop;
	}
	public String getDropDate() {
		return dropDate;
	}
	public void setDropDate(String dropDate) {
		this.dropDate = dropDate;
	}
	public int getVirtualAccount() {
		return virtualAccount;
	}
	public void setVirtualAccount(int virtualAccount) {
		this.virtualAccount = virtualAccount;
	}
	

}
