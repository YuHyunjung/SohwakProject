package cash;

public class CashDTO {
	private int cash_no;
	private String user_id;
	private String time;
	private String charge_withdraw;
	private int amount;
	private int total;
	private String process_state;
	
	public int getCash_no() {
		return cash_no;
	}
	public void setCash_no(int cash_no) {
		this.cash_no = cash_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDatetime() {
		return time;
	}
	public void setDatetime(String time) {
		this.time = time;
	}
	public String getCharge_withdraw() {
		return charge_withdraw;
	}
	public void setCharge_withdraw(String charge_withdraw) {
		this.charge_withdraw = charge_withdraw;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getProcess_state() {
		return process_state;
	}
	public void setProcess_state(String process_state) {
		this.process_state = process_state;
	}
	
	public boolean canBidding(int new_price) {
		if(total < new_price) {
			return false;
		}
		
		return true;
	}
}
