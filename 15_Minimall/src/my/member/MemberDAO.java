package my.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	private MemberDAO() throws Exception {// 안적으면 public 기본생성자가 생긴다.
		Context initContext = new InitialContext();// 초기설정정보를 읽어온다
		Context envContext = (Context) initContext.lookup("java:/comp/env");// java:/comp/env는 내부적으로 존재하는 폴더 이곳에 초기설정정보(Context.xml)를 집어넣는다.
		DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");// Context.xml의 내용중 jdbc/OracleDB 라는 이름을 가진 정보
		conn = ds.getConnection();
	}

	public static MemberDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	public int insertData(MemberDTO dto) {
		int cnt=-1;
		String sql = "insert into members(no, name, id, password, rrn1, rrn2, email, hp1,hp2,hp3,joindate) values(memseq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getRrn1());
			ps.setString(5, dto.getRrn2());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getHp1());
			ps.setString(8, dto.getHp2());
			ps.setString(9, dto.getHp3());
			ps.setString(10, dto.getJoindate());
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;
		
	}
	
	public String getMemberByRrn(MemberDTO dto) {
		String id = null;
		String sql = "select id from members where name=? and rrn1=? and rrn2=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getRrn1());
			ps.setString(3, dto.getRrn2());
			rs=ps.executeQuery();
			while(rs.next()) {
				id = rs.getString("id");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return id;
	}
	
	public String getPwById(MemberDTO dto) {
		String password = null;
		String sql = "select password from members where id=? and name=? and rrn1=? and rrn2=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getRrn1());
			ps.setString(4, dto.getRrn2());
			rs = ps.executeQuery();
			if(rs.next()) {
				password = rs.getString("password");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return password;
	}
	
	public boolean searchId(String id) {
		System.out.println(id);
		boolean flag = false;
		String sql = "select id from members where id = ?";
		try {
			ps= conn.prepareStatement(sql);
			ps.setString(1, id);
			rs= ps.executeQuery();
			if(rs.next()) {
				flag =true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		System.out.println(flag);
		return flag;
	}
	
	public MemberDTO getMemberInfo(String mid,String mpassword) {
		MemberDTO dto = null;
		String sql ="select * from members where id = ? and password = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			ps.setString(2, mpassword);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = getMembetDto(rs);
				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		return dto;
	}
	public MemberDTO getMembetDto(ResultSet rs) throws SQLException {
		int no = rs.getInt("no");
		String  name= rs.getString("name");
		String id= rs.getString("id");
		String password = rs.getString("password");
		String rrn1 = rs.getString("rrn1");
		String rrn2 = rs.getString("rrn2");
		String email = rs.getString("email");
		String hp1 = rs.getString("hp1");
		String hp2 = rs.getString("hp2");
		String hp3 = rs.getString("hp3");
		String joindate = rs.getString("joindate");
		MemberDTO dto = new MemberDTO(no, name, id, password, rrn1, rrn2, email, hp1, hp2, hp3, joindate);
		return dto;
	}
}
