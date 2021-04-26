package board;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBConnection;

public class BoardDAO {

	//게시판 작성
	public int board_AddAction(String board_date, String title, String discriprion) {
		Connection conn = null;
		String sql = "INSERT INTO BOARD(board_date, title, discriprion) VALUES(?, ?, ?)";
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board_date);
			pstmt.setString(2, title);
			pstmt.setString(3, discriprion);
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
}
