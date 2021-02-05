package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BoardDao {
	private static BoardDao instance;//BoardDao생성자의 주소를 담을 공간
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private String user = "jspid";
	private String password = "jsppw";
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	private BoardDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}

	public ArrayList<BoardBean> getArticles(int start, int end){
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		
		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";	
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean article= new BoardBean();
				//int num = rs.getInt("num");
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip")); 

				lists.add(article);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) 
					ps.close();
				if(rs!=null)
					rs.close();
//				if(conn!=null)
//					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return lists;
	}//
	
	public int getArticleCount() {
		
		int cnt=0;
		String sql = "select count(*) cnt from board";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt("cnt");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return cnt;
	}
	public int insertArticle(BoardBean bean) {
		int cnt=-1;
		String sql = "insert into board(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip) values(board_seq.nextval,?,?,?,?,?,board_seq.currval,?,?,?,?)"; 
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getWriter());
			ps.setString(2, bean.getEmail());
			ps.setString(3, bean.getSubject());
			ps.setString(4, bean.getPasswd());
			ps.setTimestamp(5, bean.getReg_date());
			ps.setInt(6, 0);
			ps.setInt(7, 0);
			ps.setString(8, bean.getContent());
			ps.setString(9, bean.getIp());
			cnt= ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return cnt;
	}
	public BoardBean getArticle(int num) {
		BoardBean bean = null;
		String sql2 = "update board set readcount= readcount+1 where num=?";
		String sql = "select * from board where num=?";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, num);
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));
				bean.setContent(rs.getString("content"));
				bean.setIp(rs.getString("ip")); 

				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}return bean;
		
				
	}
	public BoardBean updateGetArticle(int num) {
		BoardBean bean = null;
		String sql = "select * from board where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));
				bean.setContent(rs.getString("content"));
				bean.setIp(rs.getString("ip")); 

				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}return bean;
		
				
	}
	
	public int updateArticle(BoardBean bean) {
		String dbpw; 
		String sql2=  "select passwd from board where num = ?";
		
		int cnt =-1;
		String sql = "update board set writer=?, email=?, subject=?,  passwd=?, content=? where num=?";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, bean.getNum());
			rs = ps.executeQuery();
			if(rs.next()) {
				dbpw = rs.getString("passwd");
				if(dbpw.equals(bean.getPasswd())) {
					ps = conn.prepareStatement(sql);
					ps.setString(1, bean.getWriter());
					ps.setString(2, bean.getEmail());
					ps.setString(3, bean.getSubject());
					ps.setString(4, bean.getPasswd());
					ps.setString(5, bean.getContent());
					ps.setInt(6, bean.getNum());
					cnt= ps.executeUpdate();
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}return cnt;
		
		
	}
	
	
	public int deleteArticle(int num, String passwd) {
		int cnt =-1;
		String sql = "select passwd from board where num=?";
		try {
			ps =conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbpw = rs.getString("passwd");
				if(dbpw.equals(passwd)) {
					String sql2 = "delete from board where num=?";
					ps =conn.prepareStatement(sql2);
					ps.setInt(1, num);
					cnt = ps.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}
	public int replyArticle(BoardBean bean) {
		int cnt=-1;
		String sql = "update board set re_step = re_step+1 where ref=? and re_step>? ";
		String sql2 = "insert into board(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip) values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)"; 
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bean.getRef());
			ps.setInt(2, bean.getRe_step());
			ps.executeUpdate();
			ps = conn.prepareStatement(sql2);
			ps.setString(1, bean.getWriter());
			ps.setString(2, bean.getEmail());
			ps.setString(3, bean.getSubject());
			ps.setString(4, bean.getPasswd());
			ps.setTimestamp(5, bean.getReg_date());
			ps.setInt(6, bean.getRef());
			ps.setInt(7, bean.getRe_step()+1);
			ps.setInt(8, bean.getRe_level()+1);
			ps.setString(9, bean.getContent());
			ps.setString(10, bean.getIp());
			cnt= ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}

}
