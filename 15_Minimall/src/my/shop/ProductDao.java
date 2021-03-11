package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	
	private static ProductDao instance;
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private ProductDao() {
		 
		try {
			Context initContext = new InitialContext();//초기설정정보를 읽어온다
			Context envContext =(Context)initContext.lookup("java:/comp/env");//java:/comp/env는 내부적으로 존재하는 폴더 이곳에 초기설정정보(Context.xml)를 집어넣는다.
			DataSource ds =  (DataSource)envContext.lookup("jdbc/OracleDB");//Context.xml의 내용중 jdbc/OracleDB 라는 이름을 가진 정보
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static ProductDao getInstance() {
		if(instance == null) {
			instance = new ProductDao();
		}
		return instance;
	}
	public int insertProduct(MultipartRequest mr) {
		int cnt=-1;
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into product values (catprod.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			ps.setString(2, mr.getParameter("pcategory_fk")+mr.getParameter("pcode"));
			ps.setString(3, mr.getParameter("pcompany"));
			ps.setString(4, mr.getFilesystemName("pimage"));
			ps.setString(5, mr.getParameter("pqty"));
			ps.setInt(6, Integer.parseInt(mr.getParameter("price")));
			ps.setString(7, mr.getParameter("pspec"));
			ps.setString(8, mr.getParameter("pcontents"));
			ps.setInt(9, Integer.parseInt(mr.getParameter("point")));
			ps.setString(10, sdf.format(d));
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
	public ArrayList<ProductBean> selectAllProd() {
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		String sql =  "select * from product order by pnum";
		try {
			ps = conn.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setPnum(rs.getInt("pnum"));
				bean.setPcategory_fk(rs.getString("pcategory_fk"));
				bean.setPname(rs.getString("pname"));
				bean.setPimage(rs.getString("pimage"));
				bean.setPrice(rs.getInt("price"));
				bean.setPcompany(rs.getString("pcompany"));
				bean.setPqty(rs.getInt("pqty"));
				list.add(bean);
				
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
	
	public ProductBean selectByNum(int pnum) {
		ProductBean bean = null;
		String sql = "select * from product where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);
			//System.out.println(ps);
			rs = ps.executeQuery();
			//System.out.println(rs);
			if(rs.next()) {
				
				bean = new ProductBean();
				bean.setPnum(rs.getInt("pnum"));
				bean.setPname(rs.getString("pname"));
				bean.setPcategory_fk(rs.getString("pcategory_fk"));
				bean.setPcompany(rs.getString("pcompany"));
				bean.setPimage(rs.getString("pimage"));
				bean.setPqty(rs.getInt("pqty"));
				bean.setPrice(rs.getInt("price"));
				bean.setPspec(rs.getString("pspec"));
				bean.setPcontents(rs.getString("pcontents"));
				bean.setPoint(rs.getInt("point"));
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
		//System.out.println(bean);
		//System.out.println(bean.getPcategory_fk());
		return bean;
	}

	/* public int updateByNum(MultipartRequest mr){ */
	public int updateByNum(ProductBean pbean){
		int cnt =-1;
		String sql = "update product set pcategory_fk=?, pname=?, pcompany=?, pimage=?, pqty=?, price=?, pspec=?, pcontents=?, point=? where pnum=?";
		try {
			ps= conn.prepareStatement(sql);
			ps.setString(1, pbean.getPcategory_fk());
			ps.setString(2, pbean.getPname());
			ps.setString(3, pbean.getPcompany());
			ps.setString(4, pbean.getPimage());
			ps.setInt(5, pbean.getPqty());
			ps.setInt(6, pbean.getPrice());
			ps.setString(7, pbean.getPspec());
			ps.setString(8, pbean.getPcontents());
			ps.setInt(9, pbean.getPoint());
			ps.setInt(10, pbean.getPnum());
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
	
	public int deleteByNum(int pnum) {
		int cnt=-1;
		String sql = "delete from product where pnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);
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
	
	public ArrayList<ProductBean> selectByPspec(String pspec){
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		String sql = "select * from product where pspec = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,pspec);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setPnum(rs.getInt("pnum"));
				bean.setPimage(rs.getString("pimage"));
				bean.setPname(rs.getString("pname"));
				bean.setPrice(rs.getInt("price"));
				bean.setPoint(rs.getInt("point"));
				list.add(bean);
				
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
	
	public ArrayList<ProductBean> selectByCate(String code){
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		String sql = "select * from product where pcategory_fk like ? order by pnum";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, code+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setPnum(rs.getInt("pnum"));
				bean.setPimage(rs.getString("pimage"));
				bean.setPname(rs.getString("pname"));
				bean.setPrice(rs.getInt("price"));
				bean.setPoint(rs.getInt("point"));
				list.add(bean);
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

}
































