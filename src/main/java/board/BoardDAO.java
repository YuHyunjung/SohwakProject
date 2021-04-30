package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



import util.DBConnection;

public class BoardDAO {

	//게시판 작성 // admin1
	public int board_AddAction(String title, String discriprion) {
		Connection conn = null;
		String sql = "INSERT INTO BOARD(title, discriprion) VALUES(?, ?)";
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, discriprion);
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
	
	//게시판 리스트
	public List<BoardDTO> findBoard(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		List<BoardDTO> boardList = new ArrayList<>(); 
		
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT board_code, board_date, title FROM board";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_code(rs.getInt("board_code"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setTitle(rs.getString("title"));
				boardList.add(dto);
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
		
		return boardList;
	}
	
	//게시물 상세보기
	public BoardDTO getDetail(int board_code) {
		Connection conn = null;
		String sql = "SELECT * FROM board where board_code=?";
		

		try {
			conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,board_code);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setTitle(rs.getString("title"));
				dto.setDiscriprion(rs.getString("discriprion"));
				dto.setBoard_date(rs.getString("board_date"));
				return dto;
			}
		}catch (Exception e) {
			e.printStackTrace();
		} return null;
	}
	
	//게시물 수정
	public int update(int board_code, String title, String discriprion) {
		Connection conn = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "UPDATE board SET title = ?, discriprion = ? where board_code = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,title);
			pstmt.setString(2,discriprion);
			pstmt.setInt(3,board_code);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} return -1;
	}
	
	//게시글 삭제
	public int delete(int board_code) {
		Connection conn = null;
		String sql = "DELETE from board where board_code=?";
		try {
			conn=DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_code);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}

