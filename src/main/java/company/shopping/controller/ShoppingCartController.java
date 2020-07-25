package company.shopping.controller;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import company.member.model.MemberBean;
import company.shopping.model.OrderBean;
import company.shopping.model.OrderItemBean;
import company.shopping.model.ShoppingBean;
import company.shopping.model.ShoppingCart;
import company.shopping.service.ShoppingService;
import javassist.compiler.ast.Variable;



@Controller
@SessionAttributes({"ShoppingCart", "memberBean","shoppingBean"})
public class ShoppingCartController {
	@Autowired
	ServletContext context;
	@Autowired
	ShoppingService service;
	
	@GetMapping("/shoppingCart") //連到購物車
	protected String showCartContent(Model model) {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}
		return  "shopping/shoppingCart";
		
	}
	@PostMapping("/shopping/addToCartOneProduct") //單向商品加入購物車用的是此請求導回單向商品頁面
	protected String addToCartOneProduct(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		

		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}
	
		HttpSession session = request.getSession(false); 
		if (session == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}
		
		// 取出存放在session物件內的ShoppingCart物件
		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		// 如果找不到ShoppingCart物件
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			System.out.println("新建ShoppingCart...");
			model.addAttribute("ShoppingCart", cart);   
		}
		String ShoppingIdStr = request.getParameter("shoppingId");
		int ShoppingId  = Integer.parseInt(ShoppingIdStr.trim());
		
		String orderItemsNumberStr	= request.getParameter("orderItemsNumber" + "");
		Integer orderItemsNumber = 0 ; 

//		@SuppressWarnings("unchecked")
//		Map<Integer, ShoppingBean> ShoppingMap = (Map<Integer, ShoppingBean>) session.getAttribute("ShoppingMap");
		ShoppingBean bean = service.getshoppingId(ShoppingId);
//		String pageNo 		= request.getParameter("pageNo");
//		if (pageNo == null || pageNo.trim().length() == 0){
//			pageNo = (String) model.getAttribute("pageNo") ;
//			if (pageNo == null){
//			   pageNo = "1";
//			} 
//		} 
		
		try{
			// 進行資料型態的轉換
			orderItemsNumber = Integer.parseInt(orderItemsNumberStr.trim());
		} catch(NumberFormatException e){
			throw new ServletException(e); 
		}
		OrderItemBean oib = new  OrderItemBean();
		// 將訂單資料(價格，數量，折扣與BookBean)封裝到OrderItemBean物件內
		try {
			
			oib.setOrderItemsNumber(orderItemsNumber);
			oib.setShoppingId(ShoppingId);
			oib.setShoppingProductName(bean.getShoppingname());
			oib.setProductrelatio(bean.getProductrelation());
			oib.setShoppingProductPrice(bean.getShoppingProductPrice());
			oib.setShoppingProductDiscount(bean.getShoppingProductDiscount());
			oib.setShoppingType(bean.getShoppingType());
			oib.setShoppingAmount(bean.getShoppingProductDiscount()*bean.getShoppingProductPrice()*(orderItemsNumber));
			} catch (Exception e) {
			e.printStackTrace();
			System.out.println("單品項加入購物車有問題(addToCartOneProduct)方法");
		}
		
//		System.out.println(oib.toString());
		try {
			cart.addToCart(ShoppingId, oib);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("單品項加入購物車有問題");
			return "redirect:/";
		}
		// 將OrderItem物件內加入ShoppingCart的物件內
		
		return "shopping/oneProduct";
		
	}
	@PostMapping("/shopping/addToCart")
	protected String buyBook(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		
		System.out.println("x==============="+request.getParameter("x"));
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}
	
		HttpSession session = request.getSession(false); 
		if (session == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}
		
		// 取出存放在session物件內的ShoppingCart物件
		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		// 如果找不到ShoppingCart物件
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			System.out.println("新建ShoppingCart...");
			model.addAttribute("ShoppingCart", cart);   
		}
		String ShoppingIdStr = request.getParameter("shoppingId");
		int ShoppingId  = Integer.parseInt(ShoppingIdStr.trim());
		
		String orderItemsNumberStr	= request.getParameter("orderItemsNumber" + "");
		Integer orderItemsNumber = 0 ; 

//		@SuppressWarnings("unchecked")
//		Map<Integer, ShoppingBean> ShoppingMap = (Map<Integer, ShoppingBean>) session.getAttribute("ShoppingMap");
		ShoppingBean bean = service.getshoppingId(ShoppingId);
//		String pageNo 		= request.getParameter("pageNo");
//		if (pageNo == null || pageNo.trim().length() == 0){
//			pageNo = (String) model.getAttribute("pageNo") ;
//			if (pageNo == null){
//			   pageNo = "1";
//			} 
//		} 
		
		try{
			// 進行資料型態的轉換
			orderItemsNumber = Integer.parseInt(orderItemsNumberStr.trim());
		} catch(NumberFormatException e){
			throw new ServletException(e); 
		}
		// 將訂單資料(價格，數量，折扣與BookBean)封裝到OrderItemBean物件內
		OrderItemBean oib = new  OrderItemBean();
		oib.setOrderItemsNumber(orderItemsNumber);
		oib.setShoppingId(ShoppingId);
		oib.setShoppingProductName(bean.getShoppingname());
		oib.setProductrelatio(bean.getProductrelation());
		oib.setShoppingProductPrice(bean.getShoppingProductPrice());
		oib.setShoppingProductDiscount(bean.getShoppingProductDiscount());
		oib.setShoppingType(bean.getShoppingType());
		oib.setShoppingAmount(bean.getShoppingProductDiscount()*bean.getShoppingProductPrice()*orderItemsNumber);
		
//		System.out.println(oib.toString());
		try {
			cart.addToCart(ShoppingId, oib);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("商城加入購物車有問題");
			return "redirect:/";
		}
		// 將OrderItem物件內加入ShoppingCart的物件內
		
		
		return  "redirect:/shopping/allProducts";
	}
	

	@GetMapping("/shoppingCart/delete/{id}") //刪除購物車單品項目
	protected String delete(Model model,WebRequest webRequest,@PathVariable("id") Integer id
			) {
		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		cart.deleteBook(id);
		return "redirect: " + context.getContextPath() + "/shoppingCart";
	}

	
	@PostMapping("/UpdateItem/{key}/{newQty}")   //更新購物車商品買賣數量
	protected String  update(Model model,WebRequest webRequest,
			@PathVariable ("key") Integer shoppingId,@PathVariable ("newQty") Integer newQty){
		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		

		try{
			// 進行資料型態的轉換
			cart.modifyQty(shoppingId,newQty);
		} catch(Exception e){
			e.printStackTrace();
			System.out.println("購物車更新數量有問題");
			return "redirect:/";
		}
	
		return "redirect: " + context.getContextPath() + "/shoppingCart";
	}
	
	@GetMapping("/OrderConfirm")   //結帳地址
	protected String  OrderConfirm(Model model,WebRequest webRequest){

		return "/shopping/OrderConfirm";
	}
	
	@ModelAttribute("ShoppingCart")
	public ShoppingCart createShopping(Model model) {
		ShoppingCart shoppingCart = new ShoppingCart();
		System.out.println("在Ch04Controller1類別內的@ModelAttribute修飾的方法中,新建ShoppingCart物件=" + shoppingCart);
		return shoppingCart;
	}
	
	@ModelAttribute("shoppingBean")
	public ShoppingBean createshoppingBean(Model model) {
		ShoppingBean shoppingBean=new ShoppingBean();
		return shoppingBean;
	}

}
