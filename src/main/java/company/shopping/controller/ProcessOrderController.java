package company.shopping.controller;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;


// OrderConfirm.jsp 呼叫本程式。
import company.member.model.MemberBean;
import company.shopping.model.OrderBean;
import company.shopping.model.OrderItemBean;
import company.shopping.model.ShoppingBean;
import company.shopping.model.ShoppingCart;
import company.shopping.service.OrderService;

@Controller
@SessionAttributes({"ShoppingCart", "memberBean","shoppingBean"})
public class ProcessOrderController {
	@Autowired
	ServletContext context;
	
	@Autowired
	OrderService orderService;
	
	@PostMapping("/ProcessOrder")
	protected String processOrder(Model model, 
			@RequestParam("orderAddress") String orderAddress,
			WebRequest webRequest, SessionStatus status
			) {
		
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}
		
		ShoppingCart sc = (ShoppingCart) model.getAttribute("ShoppingCart");
		if (sc == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			return "redirect: " + context.getContextPath() + "/login";
		}
		// 如果使用者取消訂單

		String memberNumber = memberBean.getMemberNumber();   						// 取出會員代號
		double orderTotalPrice = sc.getSubtotal();  	// 計算訂單總金額 
		Date today = new Date();   									// 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		OrderBean ob = new OrderBean();
		ob.setMemberNumber(memberNumber);
		ob.setOrderDate(today);
		ob.setOrderAddress(orderAddress);
		ob.setOrderTotalPrice(orderTotalPrice);
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		
		Map<Integer, OrderItemBean> content = sc.getContent();
		
		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = content.keySet();
		for(Integer i : set) {
			OrderItemBean oib = content.get(i);
			oib.setOrderBean(ob);
			oib.setOrderDate(today);
			oib.setShoppingAmount(oib.getShoppingAmount()*oib.getOrderItemsNumber());
			items.add(oib);
		
		}
		
		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		ob.setItems(items);  
		try {
			orderService.persistOrder(ob);
//			status.setComplete();
//			webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
			System.out.println("Order Process OK");
			return "forward:" + "removeShoppingCart";
		} catch(RuntimeException ex){
			String message = ex.getMessage();
			String shortMsg = "" ;   
			shortMsg =  message.substring(message.indexOf(":") + 1);
			System.out.println(shortMsg);
			model.addAttribute("OrderErrorMessage", "處理訂單時發生異常: " + shortMsg  + "，請調正訂單內容" );
			return "redirect: " + context.getContextPath() + "/login";
		}
	}
	@ModelAttribute("ShoppingCart")
	public ShoppingCart createShopping(Model model) {
		ShoppingCart shoppingCart = new ShoppingCart();
		System.out.println("在Ch04Controller1類別內的@ModelAttribute修飾的方法中,新建ShoppingCart物件=" + shoppingCart);
		return shoppingCart;
	}
	
	@ModelAttribute("ShoppingBean")
	public ShoppingBean createshoppingBean(Model model) {
		ShoppingBean shoppingBean=new ShoppingBean();
		return shoppingBean;
	}
}