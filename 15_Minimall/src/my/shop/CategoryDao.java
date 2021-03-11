package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CategoryDao {
	private static CategoryDao instance;
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private CategoryDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");// java:/comp/env는 내부적으로 존재하는 폴더 이곳에 초기설정정보(Context.xml)를 집어넣는다.
			DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");// Context.xml의 내용중 jdbc/OracleDB 라는 이름을 가진 정보
			conn = ds.getConnection();
			System.out.println("conn : "+ conn);
		} catch (NamingException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static CategoryDao getInstance() {
		if(instance == null) {
			instance = new CategoryDao();
		}
		
		return instance;
	}
	
	
	public int insertCategory(CategoryBean cbean) {
		int cnt=-1;
		String sql = "insert into category values(catseq.nextval,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, cbean.getCode());
			ps.setString(2, cbean.getCname());
			cnt= ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(ps !=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}
	
	public ArrayList<CategoryBean> getAllCategory() {
		ArrayList<CategoryBean> list = new ArrayList<CategoryBean>();
		String sql = "select * from category order by cnum";
		try {
			ps = conn.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next()) {
				int cnum = rs.getInt("cnum");
				String code = rs.getString("code");
				String cname = rs.getString("cname");
				CategoryBean cbean =  new CategoryBean(cnum,code,cname);
				list.add(cbean);
				
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
			
			if(ps !=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	public int deleteCategory(int cnum){
		int cnt=-1;
		String sql =  "delete from category where cnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(ps !=null) {
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
