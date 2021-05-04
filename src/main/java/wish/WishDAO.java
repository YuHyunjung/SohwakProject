package wish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import product.ProductDTO;
import util.DBConnection;

public class WishDAO {
	
	//ȸ������
	public int wish(int product_code,String user_id) {
		Connection conn = null;
		String sql = "INSERT INTO wish(product_code, user_id) VALUES(?, ?)";
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_code);
			pstmt.setString(2, user_id);
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
	
	public int deleteWish(String user_id) {
		Connection conn = null;
		String sql = "DELETE FROM wish WHERE user_id = ?";
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
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
	
	public List<WishDTO> wishList(String user_id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<WishDTO> wishList = new ArrayList<>(); 
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT B.*,A.wish_code FROM wish A LEFT JOIN product B ON A.product_code = B.product_code"
					+ " WHERE A.user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				WishDTO dto = new WishDTO();
				dto.setProduct_code(rs.getInt("product_code"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setCategory_no(rs.getInt("category_no"));
				dto.setMin_price(rs.getInt("min_price"));
				dto.setMax_price(rs.getInt("max_price"));
				dto.setCurrent_price(rs.getInt("current_price"));
				dto.setRegist_date(rs.getString("regist_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setDiscription(rs.getString("product_discription"));
				dto.setThumnail(rs.getString("thumnail"));
				dto.setImg1(rs.getString("img1"));
				dto.setImg2(rs.getString("img2"));
				dto.setWish_code(rs.getInt("wish_code"));

				wishList.add(dto);
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
		
		return wishList;
	}
	
	
	
}

