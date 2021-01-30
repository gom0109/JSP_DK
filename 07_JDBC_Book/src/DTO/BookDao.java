package DTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	

	public BookDao() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "jspid";
		String password = "jsppw";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<BookBean> selectAll() {
		
		ArrayList<BookBean> list = new ArrayList<BookBean>();
		String sql = "select * from book order by no";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				int price = rs.getInt("price");
				String buy = String.valueOf(rs.getDate("buy"));
				String kind = rs.getString("kind");
				String bookstore = rs.getString("bookstore");
				int count = rs.getInt("count");

				BookBean bean = new BookBean(no, title, author, publisher, price, buy, kind, bookstore, count);
				list.add(bean);
				
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

			}if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
		

	}
	
	public int insertData(BookBean bean) {
		int cnt=-1;
		String title=bean.getTitle();
		String author=bean.getAuthor();
		String publisher=bean.getPublisher();
		int price =bean.getPrice();
		String buy=bean.getBuy();
		String kind=bean.getKind();
		String bookstore=bean.getBookstore();
		int count =bean.getCount();
		String sql = "insert into book values(bseq.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, author);
			ps.setString(3, publisher);
			ps.setInt(4, price);
			ps.setString(5, buy);
			ps.setString(6, kind);
			ps.setString(7, bookstore);
			ps.setInt(8, count);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return cnt;
		
		
		
	}
	public BookBean getBookByNo(int no2){
		BookBean bean = null;
		String sql = "select * from book where no = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no2);
			rs = ps.executeQuery();
			if(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				int price = rs.getInt("price");
				String buy = String.valueOf(rs.getDate("buy"));
				String kind = rs.getString("kind");
				String bookstore = rs.getString("bookstore");
				int count = rs.getInt("count");

				bean = new BookBean(no, title, author, publisher, price, buy, kind, bookstore, count);
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

			}if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return bean;
		
	}
	
	public int updateData(BookBean bean){
		System.out.println();
		int cnt = -1;
		int no = bean.getNo();
		String title=bean.getTitle();
		String author=bean.getAuthor();
		String publisher=bean.getPublisher();
		int price =bean.getPrice();
		String buy=bean.getBuy();
		String kind=bean.getKind();
		String bookstore=bean.getBookstore();
		int count =bean.getCount();
		
		String sql = "update book set title=?, author=?, publisher=?, price=?, buy=?, kind=?, bookstore=?, count=? where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, author);
			ps.setString(3, publisher);
			ps.setInt(4, price);
			ps.setString(5, buy);
			ps.setString(6, kind);
			ps.setString(7, bookstore);
			ps.setInt(8, count);
			ps.setInt(9, no);
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return cnt;
		
	}
	
	public int deleteData(int no) {
		int cnt=-1;
		String sql = "delete from book where no =?";
		try {
			ps =conn.prepareStatement(sql);
			ps.setInt(1, no);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return cnt;
		
	}
	
	public int deleteCheckData(String [] rowcheck){
		String x = "";
		int cnt=-1;
		for(int i=1;i<rowcheck.length;i++) {
			x = x+" or no="+ Integer.parseInt(rowcheck[i]);
		}
		String sql = "delete from book where no = ?"+x;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(rowcheck[0]));
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return cnt;
		
	}

}
