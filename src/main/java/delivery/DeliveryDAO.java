package delivery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;

import util.DBConnection;

public class DeliveryDAO {

	//배송정보 입력
	public int infoDelivery(int product_code, String receiver, String delivery_address, String delivery_phone, String message) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			conn = DBConnection.getConnection();
			String sql = "INSERT INTO delivery(product_code, receiver, delivery_address, delivery_phone, message, state) VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_code);
			pstmt.setString(2, receiver);
			pstmt.setString(3, delivery_address);
			pstmt.setString(4, delivery_phone);
			pstmt.setString(5, message);
			pstmt.setString(6, "배송지입력완료");
			result = pstmt.executeUpdate();
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
	//배송정보확인
	public DeliveryDTO deliveryHistory(int product_code){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM delivery WHERE product_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_code);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				DeliveryDTO dto = new DeliveryDTO();
				dto.setProduct_code(rs.getInt("product_code"));
				dto.setReceiver(rs.getString("receiver"));
				dto.setDelivery_address(rs.getString("delivery_address"));
				dto.setDelivery_phone(rs.getString("delivery_phone"));
				dto.setMessage(rs.getString("message"));
				dto.setTracking_no(rs.getString("tracking_no"));
				dto.setDelivery_company(rs.getString("delivery_company"));
				dto.setTracking_date(rs.getString("tracking_date"));
				dto.setState(rs.getString("state"));
				return dto;
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
		
		return null;
	}
	
	//송장번호입력
	public int inputTracking(String tracking_no,String delivery_company, int product_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		LocalDateTime dateTime = LocalDateTime.now();
		try {
			conn = DBConnection.getConnection();
			String sql = "UPDATE delivery SET tracking_no=?, delivery_company=?, tracking_date=?, state=? where product_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tracking_no);
			pstmt.setString(2, delivery_company);
			pstmt.setString(3, dateTime.toString());
			pstmt.setString(4, "송장입력완료");
			pstmt.setInt(5, product_code);
			result = pstmt.executeUpdate();
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
	
	//구매확정
	public int confirm(int product_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			conn = DBConnection.getConnection();
			String sql = "UPDATE delivery SET state=? where product_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "구매확정");
			pstmt.setInt(2, product_code);
			result = pstmt.executeUpdate();
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
}
