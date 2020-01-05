package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.tools.classfile.Opcode.Set;

public class BoardDao {

	public Board selectOne(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setGrp(rs.getInt("grp"));
				b.setGrplevel(rs.getInt("grplevel"));
				b.setGrpstep(rs.getInt("grpstep"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getTimestamp("regdate"));
				return b;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;

	}

	public void readcntadd(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set readcnt = readcnt + 1 where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
	}

	// 현재 등록된 게시물 번호 중 최댓값을 리턴
	public int maxnum() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select ifnull(max(num),0) from board");// 이프널로 써서 널값을 안받고 숫자로 받음
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return 0;

	}

	public boolean insert(Board board) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into board" + "(num, name, pass, subject, content, file1, regdate,"
				+ "readcnt, grp,grplevel,grpstep)" + "values(?,?,?,?,?,?,now(),0,?,?,?)";
		// 리드카운트는 처음에 무조건 0이기때문에 0
		// grpstep은 기본값이기때문에 0이라는 값이 들어가게되어있음
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getFile1());
			pstmt.setInt(7, board.getGrp());
			pstmt.setInt(8, board.getGrplevel());
			pstmt.setInt(9, board.getGrpstep());
			pstmt.executeUpdate();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}

	public int boardCount() { // 현재 전체 게시글이 몇개인지
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return 0;

	}

	public List<Board> list(int pageNum, int limit) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from board order by grp desc, grpstep asc limit ?,?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNum - 1) * limit);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setGrp(rs.getInt("grp"));
				b.setGrplevel(rs.getInt("grplevel"));
				b.setGrpstep(rs.getInt("grpstep"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getTimestamp("regdate"));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;

	}

//	2. 같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가하기.
	public void grpStepAdd(int Grp, int Grpstep) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update board set grpstep = grpstep+1 where grp =? and grpstep>?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Grp);
			pstmt.setInt(2, Grpstep);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
	}

	public boolean update(Board b) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set name = ?, subject = ?, content = ? , file1 = ? where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getName());
			pstmt.setString(2, b.getSubject());
			;
			pstmt.setString(3, b.getContent());
			pstmt.setString(4, b.getFile1());
			pstmt.setInt(5, b.getNum());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}

	public String passcheck(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pass from board where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString("pass");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return null;
	}
	
	public void delete(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from board where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
	}
}
