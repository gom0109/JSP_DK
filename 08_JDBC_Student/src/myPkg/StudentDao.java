package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String password = "jsppw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public StudentDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}// StudentDao()

	public ArrayList<StudentBean> selectall() {
		ArrayList<StudentBean> list = new ArrayList<StudentBean>();
		String sql = "select * from student order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				int year = rs.getInt("year");
				int month = rs.getInt("month");
				int day = rs.getInt("day");
				String hobby = rs.getString("hobby");
				int c = rs.getInt("c");
				int java = rs.getInt("java");
				int jsp = rs.getInt("jsp");
				int sum = rs.getInt("sum");
				StudentBean bean = new StudentBean(num, id, passwd, name, year, month, day, hobby, c, java, jsp, sum);
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

	public int insertData(StudentBean bean) {
		int cnt = -1;
		String sql = "insert into student values (stu_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, bean.getId());
			ps.setString(2, bean.getPasswd());
			ps.setString(3, bean.getName());
			ps.setInt(4, bean.getYear());
			ps.setInt(5, bean.getMonth());
			ps.setInt(6, bean.getDay());
			ps.setString(7, bean.getHobby());
			ps.setInt(8, bean.getC());
			ps.setInt(9, bean.getJava());
			ps.setInt(10, bean.getJsp());
			ps.setInt(11, bean.getSum());
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

	public StudentBean selectByNum(int num) {
		StudentBean bean = null;
		String sql = "select * from student where num =?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			while (rs.next()) {
				
				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				int year = rs.getInt("year");
				int month = rs.getInt("month");
				int day = rs.getInt("day");
				String hobby = rs.getString("hobby");
				int c = rs.getInt("c");
				int java = rs.getInt("java");
				int jsp = rs.getInt("jsp");
				int sum = rs.getInt("sum");
				bean = new StudentBean(num, id, passwd, name, year, month, day, hobby, c, java, jsp, sum);

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

	public int updateData(StudentBean bean) {
		int cnt = -1;
		String sql = "update student set id=?, passwd=?, name=?, year=?, month=?, day=?, hobby=?, c=?, java=?, jsp=?, sum=? where num = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getPasswd());
			ps.setString(3, bean.getName());
			ps.setInt(4, bean.getYear());
			ps.setInt(5, bean.getMonth());
			ps.setInt(6, bean.getDay());
			ps.setString(7, bean.getHobby());
			ps.setInt(8, bean.getC());
			ps.setInt(9, bean.getJava());
			ps.setInt(10, bean.getJsp());
			ps.setInt(11, bean.getSum());
			ps.setInt(12, bean.getNum());
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
	
	public int deleteByNum(int num){
		int cnt = -1;
		String sql =" delete from student where num = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
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
	
	
	public int deleteAll(String [] checkone) {
		int cnt =-1;
		String x = "";
		for(int i=1;i<checkone.length;i++) {
			x = x+ " or num = "+Integer.parseInt(checkone[i]);
		}
		
		
		String sql = "delete from student where num = ?"+x;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(checkone[0]));
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
	public boolean checkid(String userid) {
		boolean flag = false;
		String sql = "select * from student where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if(rs.next()) {
				flag = true;
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
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return flag;
	}

}
