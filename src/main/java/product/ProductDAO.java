package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
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
			String sql = "INSERT INTO PRODUCT(product_name, user_id, category_no, min_price, max_price, current_price, regist_date, end_date, product_discription,thumnail,img1,img2,state) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(13, "경매전");
			pstmt.executeUpdate();
			result = true;
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
	
	//상품삭제
	public int deleteProduct(int product_code, String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			conn = DBConnection.getConnection();
			String sql = "DELETE FROM product WHERE product_code=? and user_id=? and state='경매전'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_code);
			pstmt.setString(2, user_id);
			result = pstmt.executeUpdate();	//성공하면 1
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
	
	//상품수정
	public int update(int product_code,String product_name, String product_discription, String thumnail,String img1, String img2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "UPDATE product SET product_name = ?, product_discription = ? , thumnail=?, img1=?, img2=? where product_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,product_name);
			pstmt.setString(2,product_discription);
			pstmt.setString(3,thumnail);
			pstmt.setString(4,img1);
			pstmt.setString(5,img2);
			pstmt.setInt(6,product_code);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} return -1;
	}
	
	//카테고리별 가져오기
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
				dto.setState(rs.getString("state"));
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
	//상품검색1
	public List<ProductDTO> findProducts(int category_no,String keyword){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<ProductDTO> productyList = new ArrayList<>(); 
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM product WHERE category_no=? AND product_name LIKE ? ORDER BY regist_date DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category_no);
			pstmt.setString(2, "%"+keyword+"%");
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
				dto.setState(rs.getString("state"));
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
	
	
	//상품검색2
	public List<ProductDTO> findSearchProducts(String keyword){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<ProductDTO> productyList = new ArrayList<>(); 
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM product WHERE product_name LIKE ? ORDER BY regist_date DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
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
				dto.setState(rs.getString("state"));
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
	
	//상품가져오기
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
				dto.setBidder(rs.getString("bidder"));
				dto.setState(rs.getString("state"));
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
	
	//경매
	public int auction(int product_code, int new_price, String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			conn = DBConnection.getConnection();
			String sql = "update product set current_price=?, bidder=?,state='경매중' where product_code=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, new_price);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, product_code);
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
	
	//최대금액과 동일시 최종낙찰
	public int final_winbid(int product_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "update product set state='경매종료' where product_code=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_code);		
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
	
	//경매종료시간과 같을 경우 낙찰
	public int final_time(LocalDateTime now) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			conn = DBConnection.getConnection();
			String sql = "update product set state = '경매종료' where end_date < ? and state !='경매종료'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, now.toString());
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
	
	//경매참여내역
	public List<ProductDTO> attendAuction(String user_id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<ProductDTO> productyList = new ArrayList<>(); 
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM product WHERE bidder=? and state='경매중' ORDER BY regist_date DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProduct_code(rs.getInt("product_code"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setMin_price(rs.getInt("min_price"));
				dto.setMax_price(rs.getInt("max_price"));
				dto.setCurrent_price(rs.getInt("current_price"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setThumnail(rs.getString("thumnail"));
				dto.setBidder(rs.getString("bidder"));
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

	//최종낙찰내역
	public List<ProductDTO> purchaseHistory(String user_id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<ProductDTO> productyList = new ArrayList<>(); 
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM product WHERE bidder=? and state='경매종료'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProduct_code(rs.getInt("product_code"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setMin_price(rs.getInt("min_price"));
				dto.setMax_price(rs.getInt("max_price"));
				dto.setCurrent_price(rs.getInt("current_price"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setThumnail(rs.getString("thumnail"));
				dto.setBidder(rs.getString("bidder"));
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
	
	//판매내역
	public List<ProductDTO> purchaseList(String user_id){
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    List<ProductDTO> purchaseList = new ArrayList<>(); 
	      
	    try {
	         conn = DBConnection.getConnection();
	         String sql = "SELECT * FROM product WHERE user_id=? ORDER BY regist_date DESC";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, user_id);
	         ResultSet rs = pstmt.executeQuery();
	         while(rs.next()) {
	            ProductDTO dto = new ProductDTO();
	            dto.setProduct_code(rs.getInt("product_code"));
	            dto.setProduct_name(rs.getString("product_name"));
	            dto.setUser_id(rs.getString("user_id"));
	            dto.setMin_price(rs.getInt("min_price"));
	            dto.setMax_price(rs.getInt("max_price"));
	            dto.setCurrent_price(rs.getInt("current_price"));
	            dto.setEnd_date(rs.getString("end_date"));
	            dto.setDiscription(rs.getString("product_discription"));
	            dto.setThumnail(rs.getString("thumnail"));
	            dto.setBidder(rs.getString("bidder"));
	            dto.setState(rs.getString("state"));
	            purchaseList.add(dto);
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
	      
	      return purchaseList ;
	   }
	//탈퇴부분에서 경매중이거나 입찰자이면 탈퇴가 안되게하는부분 
	public int auctioning(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBConnection.getConnection();
			sql =  "select count(*) from product where (user_id=? or bidder=?) and state='경매중'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt("count(*)")==0) {
					return 1; //탈퇴가능
				}else {
					return 0;	//탈퇴불가능
				}
			}
			return 1;
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
		
		return -1;
	}
	


	
}
