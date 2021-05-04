package cash;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Vector;

import user.UserDTO;
import util.DBConnection;

public class CashDAO {
	
	//캐쉬충전
	public int chargeCash (String user_id,String time,String charge_withdraw,int amount,int total) {
		Connection conn = null;
		String sql = "INSERT INTO cash(user_id, time, charge_withdraw, amount, total) VALUES(?, ?, ?, ?,?)";
		PreparedStatement pstmt = null;
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time2 = new Date();
		
		time = format.format(time2);
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			pstmt.setString(2, time);
			pstmt.setString(3, charge_withdraw);
			pstmt.setInt(4, amount);
			pstmt.setInt(5, total);
			pstmt.executeUpdate();
			return 	1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		return -1;
	}
	
	//아이디당 캐쉬기록가져오기
	public CashDTO infoCash(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		CashDTO cashDTO = new CashDTO();
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM cash WHERE user_id=? order by time desc limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cashDTO = new CashDTO();
				cashDTO.setCash_no(rs.getInt("cash_no"));
				cashDTO.setUser_id(rs.getString("user_id"));
				cashDTO.setAmount(rs.getInt("amount"));
				cashDTO.setTotal(rs.getInt("total"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		return cashDTO;
	}
	
	//캐쉬기록
	public Vector<CashDTO> chargeCashList(String user_id) {  
		Vector<CashDTO> v = new Vector<CashDTO>(); 
		String SQL = "SELECT * FROM cash WHERE user_id=? order by time desc"; 
		Connection conn = null;
		conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				CashDTO cashDTO = new CashDTO();
				cashDTO = new CashDTO();
				cashDTO.setCash_no(rs.getInt("cash_no"));
				cashDTO.setUser_id(rs.getString("user_id"));
				cashDTO.setDatetime(rs.getString("time"));
				cashDTO.setCharge_withdraw(rs.getString("charge_withdraw"));
				cashDTO.setAmount(rs.getInt("amount"));
				cashDTO.setTotal(rs.getInt("total"));
				cashDTO.setProcess_state(rs.getString("process_state"));
				
				v.add(cashDTO); 
				}
				conn.close();
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		return v;
	}
	//보증금환불
	public boolean refund(int product_code, int old_price, String old_user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		
		String refundDate = format.format(time);
		try {
			conn = DBConnection.getConnection();
			String sql = "select total from cash where user_id=? order by time desc limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, old_user);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String sql1 = "Insert into cash(user_id, time, charge_withdraw, amount, total, product_code) values(?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1,old_user);
				pstmt.setString(2, refundDate);
				pstmt.setString(3, "보증금 환불");
				pstmt.setInt(4, old_price);
				pstmt.setInt(5, rs.getInt("total")+old_price);
				pstmt.setInt(6, product_code);
				pstmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;    }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
		return result;
	}
	//경매
	public boolean auction(int product_code, int new_price, String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		
		String auctionDate = format.format(time);
		try {
			conn = DBConnection.getConnection();
			String sql = "select total from cash where user_id=? order by time desc limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String sql1 = "Insert into cash(user_id, time, charge_withdraw, amount, total, product_code) values(?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1,user_id);
				pstmt.setString(2, auctionDate);
				pstmt.setString(3, "입찰 보증금");
				pstmt.setInt(4, new_price);
				pstmt.setInt(5, rs.getInt("total")-new_price);
				pstmt.setInt(6, product_code);
				pstmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;    }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
		return result;
	}

	//탈퇴할때 현재 캐시가 남아있으면 탈퇴가 안되는 부분
	public int cashing(String id, String password){
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result3 = 0;
		
		try {
			conn = DBConnection.getConnection();
			sql =  "select * from cash where user_id=? and total != 0 order by time desc limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			result3 = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;    }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return result3;
	}
	
	//판매자 판매 금액 인계
	public int saleMoney(int product_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		LocalDateTime now = LocalDateTime.now();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from cash c inner join product p on c.user_id=p.user_id where p.product_code=? order by c.time desc limit 1;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_code);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String sql1 = "Insert into cash(user_id, time, charge_withdraw, amount, total, product_code) values(?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, rs.getString("p.user_id"));
				pstmt.setString(2, now.toString());
				pstmt.setString(3, "판매금");
				pstmt.setInt(4, rs.getInt("p.current_price"));
				pstmt.setInt(5, rs.getInt("c.total")+rs.getInt("p.current_price"));
				pstmt.setInt(6, product_code);
				pstmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;    }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
		return -1;
	}
}
	