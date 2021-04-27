package product;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.jsp.PageContext;

import util.DBConnection;

public class ProductDAO {
	//상품등록
	public boolean registProduct(String product_name, String user_id, int category_no, int min_price, int max_price, int current_price,String regist_date, String end_time, String end_date, String product_discription,String filename){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "INSERT INTO PRODUCT(product_name, user_id, category_no, min_price, max_price, current_price, regist_date, end_date, product_discription,thumnail) VALUES(?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_name);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, category_no);
			pstmt.setInt(4, min_price);
			pstmt.setInt(5, max_price);
			pstmt.setInt(6, current_price);
			pstmt.setString(7, regist_date);
			pstmt.setString(8, end_date+" "+end_time);
			pstmt.setString(9, product_discription);
			pstmt.setString(10, filename);
			pstmt.executeUpdate();
			
			result = true;	//성공하면 true
			if(result) {
				//리다이렉트 할껀데 sql 가져와야해
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
}
