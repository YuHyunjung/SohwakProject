package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mysql.cj.protocol.Resultset;

import util.DBConnection;

public class UserDAO {
	
	//아이디 중복확인-TEST
	public boolean confirmID(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean result = false;
		
		try {
			conn = DBConnection.getConnection();
			sql = "SELECT user_id from user where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			result = rs.next();	//true면 아이디 존재
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
	
	//회원가입
	public int join(String id, String pwd, int pwdCode, String answer, String name, String phone, String email, int bankCode, String account, String joinDate) {
		Connection conn = null;
		String sql = "INSERT INTO USER(user_id, user_password, password_code, password_answer, user_name, user_phone, user_email, bank_code, user_account, user_join) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
		PreparedStatement pstmt = null;
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		
		joinDate = format.format(time);
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setInt(3, pwdCode);
			pstmt.setString(4, answer);
			pstmt.setString(5, name);
			pstmt.setString(6, phone);
			pstmt.setString(7, email);
			pstmt.setInt(8, bankCode);
			pstmt.setString(9, account);
			pstmt.setString(10, joinDate);
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
	
	//회원정보 확인
	public UserDTO info(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		UserDTO userDTO = new UserDTO();
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM user WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userDTO = new UserDTO();
				userDTO.setId(rs.getString("user_id"));
				userDTO.setPwd(rs.getString("user_password"));
				userDTO.setPwdCode(rs.getInt("password_code"));
				userDTO.setAnswer(rs.getString("password_answer"));
				userDTO.setName(rs.getString("user_name"));
				userDTO.setPhone(rs.getString("user_phone"));
				userDTO.setEmail(rs.getString("user_email"));
				userDTO.setBankCode(rs.getInt("bank_code"));
				userDTO.setAccountNum(rs.getString("user_account"));
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
		return userDTO;
	}
	
	//회원정보수정
	public int modify(UserDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "UPDATE user SET user_password=?, password_answer=?,user_email=? WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getAnswer());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getId());
			
			return 	pstmt.executeUpdate();
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
	
	
	//로그인
	public boolean loginCheck(String id, String password){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean result = false;
		
		try {
			conn = DBConnection.getConnection();
			sql = "select user_id from user where user_id=? and user_password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			result = rs.next();	//true면 로그인성공
		}catch(Exception e) {
			e.printStackTrace();
		}try{
            if ( pstmt != null ){ pstmt.close(); pstmt=null; }
            if ( conn != null ){ conn.close(); conn=null;    }
        }catch(Exception e){
            throw new RuntimeException(e.getMessage());
        }
		
		return result;
		
	}
	
	//회원탈퇴 - 수정중
	public int deleteUser(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = -1;
		
		try {
			conn = DBConnection.getConnection();
			sql = "DELETE FROM user WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}try{
            if ( pstmt != null ){ pstmt.close(); pstmt=null; }
            if ( conn != null ){ conn.close(); conn=null;    }
        	}catch(Exception e){
        		throw new RuntimeException(e.getMessage());
        }
		return result;
	}
}

