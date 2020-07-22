package company.orderLunch.controller;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.mysql.cj.xdevapi.JsonArray;

@Controller
public class OrderLunchController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	//連線
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Company";
    String userid = "sa";
    String passwd = "sa123456";
    
    //sql
    private static final String SELECT_LUNCH_STORE = "SELECT STORE FROM LUNCHORDER ";
    private static final String SELECT_LUNCH_STORE_DETAIL = "SELECT * FROM LUNCHSTORE WHERE STORE=?";
    private static final String SELECT_STORE_LIST = "SELECT * FROM LUNCHORDER WHERE STORE = ? ";
    private static final String INSERT_LUNCH_ORDER = "INSERT INTO LUNCHORDER (ID,STORE,PRODUCT,PRICE,ORDERTIME,USERNAME) VALUES(?,?,?,?,?,?)";
    
    
	//導頁
	@GetMapping("/orderLunch/order")
	public String order(Model model) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps = con.prepareStatement(SELECT_LUNCH_STORE);
			rs=ps.executeQuery();
			List<String> list = new ArrayList<String>();
			while (rs.next()) {
				list.add(rs.getString("STORE"));
			}
			model.addAttribute("storeList",list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "orderLunch/order";
	}
	
	@RequestMapping(value = "/orderLunch/insertMenu",method = RequestMethod.POST )
	public void insertOrder(HttpServletRequest request, HttpServletResponse response) {
		String sale = request.getParameter("sale");
		String price = request.getParameter("price");
//		Connection con = null;
//		PreparedStatement ps = null;
//		try {
//			
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			ps = con.prepareStatement(INSERT_LUNCH_ORDER);
//			ps.setInt(1, 1);
//			ps.setNString(2,"麥當勞");
//			ps.setString(3, "麥脆雞");
//			ps.setInt(4,100);
//			ps.setDate(5, new java.sql.Date(System.currentTimeMillis()));
//			ps.setInt(6, 1001);
//			ps.execute();
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
	}
	@RequestMapping(value="/orderLunch/selectStoreList",method = RequestMethod.POST)
	public void selectStore(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		String store = request.getParameter("store");
		//取得商家資料
		List<Map<String, String>> storeList = new ArrayList<Map<String,String>>();
		List<Map<String, String>> foodList = new ArrayList<Map<String,String>>();
		String listJson="";
		try {
			response.setContentType("text/html;charset=UTF-8");
		     request.setCharacterEncoding("UTF-8");
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			//取得商家資料
			ps2=con.prepareStatement(SELECT_LUNCH_STORE_DETAIL);
			ps2.setString(1, store);
			rs2 = ps2.executeQuery();
			while(rs2.next()) {
				Map<String, String> storeDetail = new HashMap<String, String>();
				storeDetail.put("store", rs2.getString("store"));
				storeDetail.put("product", rs2.getString("product"));
				storeDetail.put("price", rs2.getString("price"));
				storeDetail.put("endDate", rs2.getString("enddate"));
				storeList.add(storeDetail);
				}
			ps=con.prepareStatement(SELECT_STORE_LIST);
			ps.setString(1, store);
			rs = ps.executeQuery();
			while(rs.next()) {
				Map<String, String> food = new HashMap<String, String>();
				food.put("product", rs.getString("product"));
				food.put("price", rs.getString("price"));
				food.put("userName", rs.getString("userName"));
				foodList.add(food);
			}
			listJson = JSON.toJSONString(storeList);
			PrintWriter out =response.getWriter();
			out.print(listJson);
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
