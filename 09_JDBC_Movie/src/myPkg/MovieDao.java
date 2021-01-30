package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MovieDao {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private String user = "jspid";
	private String password = "jsppw";
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public MovieDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MovieBean> selectAll() {
		ArrayList<MovieBean> list = new ArrayList<MovieBean>();
		String sql = "select * from movie order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String genre = rs.getString("genre");
				String time = rs.getString("time");
				int partner = rs.getInt("partner");
				String memo = rs.getString("memo");
				MovieBean bean = new MovieBean(num, id, name, age, genre, time, partner, memo);
				list.add(bean);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	public int insertData(MovieBean bean) {
		int cnt = -1;
		String sql = "insert into movie values(mv_seq.nextval,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getName());
			ps.setInt(3, bean.getAge());
			ps.setString(4, bean.getGenre());
			ps.setString(5, bean.getTime());
			ps.setInt(6, bean.getPartner());
			ps.setString(7, bean.getMemo());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return cnt;

	}

	public MovieBean selectByNum(int num) {
		MovieBean bean = null;
		String sql = "select * from movie where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String genre = rs.getString("genre");
				String time = rs.getString("time");
				int partner = rs.getInt("partner");
				String memo = rs.getString("memo");
				bean = new MovieBean(num, id, name, age, genre, time, partner, memo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return bean;

	}

	public int updateData(MovieBean bean) {
		int cnt = -1;
		String sql = "update movie set name=?,age=?,genre=?,time=?,partner=?,memo=? where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getName());
			ps.setInt(2, bean.getAge());
			ps.setString(3, bean.getGenre());
			ps.setString(4, bean.getTime());
			ps.setInt(5, bean.getPartner());
			ps.setString(6, bean.getMemo());
			ps.setInt(7, bean.getNum());
			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return cnt;
	}

	public int deleteData(int num) {
		int cnt = -1;
		String sql = "delete from movie where num =?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return cnt;
	}
	
	public int cDelete(String [] cone){
		int cnt =-1;
		String x="";
		for(int i=1;i<cone.length;i++) {
			x += " or num="+Integer.parseInt(cone[i]);
		}
		String sql = "delete from movie where num=?"+x;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(cone[0]));
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
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
