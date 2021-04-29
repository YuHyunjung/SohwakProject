package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;

public class ProductDAO {
	
	//상품등록
	public boolean registProduct(String product_name, String user_id, int category_no, int min_price, int max_price, int current_price,String regist_date, String end_time, String end_date, String product_discription,String filename1,String filename2,String filename3){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "INSERT INTO PRODUCT(product_name, user_id, category_no, min_price, max_price, current_price, regist_date, end_date, product_discription,thumnail,img1,img2) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(10, filename1);
			pstmt.setString(11, filename2);
			pstmt.setString(12, filename3);
			pstmt.executeUpdate();
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
	
	//상품가져오기
	public List<ProductDTO> findProducts(int category_no){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<ProductDTO> productyList = new ArrayList<>(); 
		
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM product WHERE category_no=? ORDER BY regist_date DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category_no);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
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

				productyList.add(dto);
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
		
		return productyList;
	}
	
	//상품상세보기
	public ProductDTO getProduct(int product_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ProductDTO dto = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from product where product_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_code);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ProductDTO();
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
		return dto;
	}
	
	//총 카운트 (페이징)
	public int getCount(int category_no) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ProductDTO dto = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select count(*) from product where category_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category_no);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
	
}
