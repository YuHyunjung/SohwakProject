package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;

public class CategoryDAO {
	
	//카테고리리스트
	public List<CategoryDTO> findCategory(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<CategoryDTO> categoryList = new ArrayList<>(); 
		
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM category";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCategoryNo(rs.getInt("category_no"));
				dto.setCategory(rs.getString("category_list"));
				categoryList.add(dto);
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
		
		return categoryList;
	}
	
}
