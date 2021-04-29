package cash;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import util.DBConnection;

public class CashDAO {
	// 캐시 충전
	public int chargeCash (
			String user_id,
			String time,
			String charge_withdraw,
			int amount
			) {
		Connection conn = null;
		String sql = "INSERT INTO sohwak.cash(user_id, time, charge_withdraw, amount) VALUES(?, ?, ?, ?)";
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
	
	// 캐시 충전 내역 조회
	public Vector<CashDTO> chargeCashList() {  // 리턴 형식이 Vector<ReviewDTO>인 메소드 선언
		Vector<CashDTO> v = new Vector<CashDTO>();  // 데이터베이스에서 가져온 ReviewDTO 속성값을 저장할 객체 생성 
		// 데이터베이스에 적용할 SQL문 선언
					String SQL = "SELECT * FROM sohwak.cash WHERE user_id=test";  // 평점 기준으로 내림차순 출력
					// SQL문을 실행시키고 실제 데이터베이스에 매개 변수로 들어온 값들을 저장
					Connection conn = null;
					conn = DBConnection.getConnection();
					PreparedStatement pstmt = null;

		try {
			
			pstmt = conn.prepareStatement(SQL);
			// SQL문을 실행
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				// 데이터베이스에서 가져온 각 속성값을 ReviewDTO 객체에 저장
				CashDTO cashDTO = new CashDTO();
				cashDTO = new CashDTO();
				cashDTO.setCash_no(rs.getInt("cash_no"));
				cashDTO.setUser_id(rs.getString("user_id"));
				cashDTO.setDatetime(rs.getString("time"));
				cashDTO.setCharge_withdraw(rs.getString("charge_withdraw"));
				cashDTO.setAmount(rs.getInt("amount"));
				cashDTO.setTotal(rs.getInt("total"));
				cashDTO.setProcess_state(rs.getString("process_state"));
				
				v.add(cashDTO);  // reviewDTO 값을 v에 하나씩 추가
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
	
	
	// 캐시 충전 내역 조회
//	public ArrayList<CashDTO> chargeCashList() {
//		ArrayList<CashDTO> list = new ArrayList<CashDTO>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			conn = DBConnection.getConnection();
//			String sql = "SELECT * FROM sohwak.c WHERE user_id=test";
//			pstmt = conn.prepareStatement(sql);
//			//pstmt.setString(1, id);
//			ResultSet rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				CashDTO cashDTO = new CashDTO();
//				cashDTO = new CashDTO();
//				cashDTO.setCash_no(rs.getInt("cash_no"));
//				cashDTO.setUser_id(rs.getString("user_id"));
//				cashDTO.setTime(rs.getString("time"));
//				cashDTO.setCharge_withdraw(rs.getString("charge_withdraw"));
//				cashDTO.setAmount(rs.getInt("amount"));
//				cashDTO.setTotal(rs.getInt("total"));
//				cashDTO.setProcess_state(rs.getString("process_state"));
//				list.add(cashDTO);
//			}
//		}catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			try{
//                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
//                if ( conn != null ){ conn.close(); conn=null;    }
//            }catch(Exception e){
//                throw new RuntimeException(e.getMessage());
//            }
//		}
//		return list;
//	}
}