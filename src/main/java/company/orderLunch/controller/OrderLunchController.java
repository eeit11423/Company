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
    private static final String SELECT_LUNCH_ORDER = "SELECT * FROM LUNCHORDER WHERE USERNAME=?";
    private static final String SELECT_LUNCH_STORE = "SELECT DISTINCT STORE FROM LUNCHSTORE WHERE ENDDATE >GETDATE()-1";
    private static final String SELECT_LUNCH_STORE_MENU = "SELECT * FROM LUNCHSTORE WHERE STORE = ? AND ENDDATE >GETDATE()-1";
    private static final String SELECT_LUNCH_STORE_MENU_PRICE = "SELECT * FROM LUNCHSTORE WHERE id = ? AND ENDDATE >GETDATE()-1";
    private static final String SELECT_LUNCH_STORE_DETAIL = "SELECT * FROM LUNCHSTORE WHERE STORE = ? AND ENDDATE >GETDATE()-1";
    private static final String SELECT_STORE_LIST = "SELECT * FROM LUNCHORDER WHERE STORE = ? ";
    private static final String SELECT_MAX_ORDER_ID =  "SELECT MAX (ID)+1 AS ID FROM LUNCHORDER";
    private static final String INSERT_LUNCH_ORDER = "INSERT INTO LUNCHORDER (ID,STORE,PRODUCT,PRICE,QUANTITY,USERNAME) VALUES(?,?,(SELECT PRODUCT FROM LUNCHSTORE WHERE ID=?),?,?,?)";
    private static final String INSERT_LUNCH_STORE = "INSERT INTO LUNCHSTORE(ID,STORE,PRODUCT,PRICE,ENDDATE) VALUES((SELECT MAX(ID)+1 AS ID FROM LUNCHSTORE),?,?,?,?)";
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
	
	@RequestMapping(value = "/orderLunch/resetStore",method = RequestMethod.POST )
	public void resetOrder(HttpServletRequest request, HttpServletResponse response) {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		String listJson = "";
		try {
			response.setContentType("text/html;charset=UTF-8");
		    request.setCharacterEncoding("UTF-8");
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps = con.prepareStatement(SELECT_LUNCH_STORE);
			rs=ps.executeQuery();
			List<String> list = new ArrayList<String>();
			while (rs.next()) {
				list.add(rs.getString("STORE"));
			}
			listJson = JSON.toJSONString(list);
			PrintWriter out =response.getWriter();
			out.print(listJson);
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/orderLunch/insertStore",method = RequestMethod.POST )
	public void insertOrder(HttpServletRequest request, HttpServletResponse response) {
		String store = request.getParameter("store");
		String date = request.getParameter("date");
		String menu = request.getParameter("menu");
		String price = request.getParameter("price");
		Connection con = null;
		PreparedStatement ps = null;
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps = con.prepareStatement(INSERT_LUNCH_STORE);
			ps.setString(1, store);
			ps.setString(2,menu);
			ps.setString(3, price);
			ps.setString(4, date);
			ps.execute();
			PrintWriter out =response.getWriter();
			out.print("success");
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
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
	
	@RequestMapping(value="/orderLunch/getStoreMenuList",method = RequestMethod.POST)
	public void getStoreMenuList(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String store = request.getParameter("store");
		List<Map<String, String>> menuList = new ArrayList<Map<String,String>>();
		String listJson="";
		try {
			response.setContentType("text/html;charset=UTF-8");
		     request.setCharacterEncoding("UTF-8");
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps=con.prepareStatement(SELECT_LUNCH_STORE_MENU);
			ps.setString(1, store);
			rs = ps.executeQuery();
			while(rs.next()) {
				Map<String, String> menu = new HashMap<String, String>();
				menu.put("product", rs.getString("product"));
				menu.put("id", rs.getString("id"));
				menuList.add(menu);
			}
			listJson = JSON.toJSONString(menuList);
			PrintWriter out =response.getWriter();
			out.print(listJson);
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//取得商品價格
	@RequestMapping(value="/orderLunch/getStoreMenuPrice",method = RequestMethod.POST)
	public void getStoreMenuPrice(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String menuId = request.getParameter("menu");
		List<Map<String, String>> menuList = new ArrayList<Map<String,String>>();
		String listJson="";
		try {
			response.setContentType("text/html;charset=UTF-8");
		     request.setCharacterEncoding("UTF-8");
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps=con.prepareStatement(SELECT_LUNCH_STORE_MENU_PRICE);
			ps.setString(1, menuId);
			rs = ps.executeQuery();
			while(rs.next()) {
				Map<String, String> menu = new HashMap<String, String>();
				menu.put("price", rs.getString("price"));
				menu.put("id", rs.getString("id"));
				menuList.add(menu);
			}
			listJson = JSON.toJSONString(menuList);
			PrintWriter out =response.getWriter();
			out.print(listJson);
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//寫入訂單
	@RequestMapping(value="/orderLunch/addOrder",method = RequestMethod.POST)
	public void addOrder(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps2 = null;
		String store = request.getParameter("store");
		String menu = request.getParameter("menu");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");
		String userName = request.getParameter("userName");
		List<Map<String, String>> menuList = new ArrayList<Map<String,String>>();
		String listJson="";
		try {
			response.setContentType("text/html;charset=UTF-8");
		     request.setCharacterEncoding("UTF-8");
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ps=con.prepareStatement(SELECT_MAX_ORDER_ID);
			rs = ps.executeQuery();
			Map<Object, Object> order = new HashMap<Object, Object>();
			while(rs.next()) {
				order.put("id", rs.getInt("id"));
			}
			
			ps2=con.prepareStatement(INSERT_LUNCH_ORDER);
			ps2.setInt(1, (int) order.get("id"));
			ps2.setString(2, store);
			ps2.setString(3, menu);
			ps2.setString(4, price);
			ps2.setInt(5, Integer.parseInt(quantity));
			ps2.setString(6, userName);
			ps2.execute();
			PrintWriter out =response.getWriter();
			out.print("success");
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//寫入訂單
		@RequestMapping(value="/orderLunch/seachOrder",method = RequestMethod.POST)
		public void seachOrder(HttpServletRequest request, HttpServletResponse response) {
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			String listJson="";
			String userName = request.getParameter("userName");
			try {
				response.setContentType("text/html;charset=UTF-8");
			     request.setCharacterEncoding("UTF-8");
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				ps=con.prepareStatement(SELECT_LUNCH_ORDER);
				ps.setString(1, userName);
				rs = ps.executeQuery();
				List<Map<String, String>> orderList = new ArrayList<Map<String,String>>();
				while(rs.next()) {
					Map<String, String> order = new HashMap<String, String>();
					order.put("id", rs.getString("id"));
					order.put("store", rs.getString("store"));
					order.put("product", rs.getString("product"));
					order.put("price", rs.getString("price"));
					order.put("quantity", rs.getString("quantity"));
					orderList.add(order);
				}
				listJson = JSON.toJSONString(orderList);
				PrintWriter out =response.getWriter();
				out.print(listJson);
				out.close();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
}
