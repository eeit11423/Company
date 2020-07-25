package company.shopping.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import company.member.model.MemberBean;
import company.shopping.model.OrderBean;
import company.shopping.model.OrderItemBean;
import company.shopping.service.OrderService;


@Controller
@SessionAttributes({"ShoppingCart", "memberBean","shoppingBean"})
public class OrderListController {

	@Autowired
	ServletContext context;
	
	@Autowired
	OrderService orderService;
	
	@GetMapping("/orderList/list")
	protected String orderList(Model model) {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}

//		ServletContext sc = getServletContext();
//		WebApplicationContext ctx = WebApplicationContextUtils
//										.getWebApplicationContext(sc);
//		OrderService os = ctx.getBean(OrderService.class);
		List<OrderBean> memberOrders = orderService.getMemberOrders(memberBean.getMemberNumber());
		model.addAttribute("memberOrders", memberOrders);
		return "shopping/order/OrderList";
	}
	
	@GetMapping("/shopping/order/ShowOrderDetail/{memberNumber}/{orderNo}")
	protected String orderDetail(Model model,@PathVariable("memberNumber") Integer mn,
			@PathVariable("orderNo") Integer no
			 	) {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}
		System.out.println("no="+no);
		OrderBean ob = orderService.getOrder(no);
		model.addAttribute("OrderBean", ob);
//		System.out.println(ob.getItems().toString());
		List<OrderItemBean> oibBean=orderService.getmemberitems(no);
		model.addAttribute("OrderItemBean", oibBean);
		
		return "shopping/order/ShowOrderDetail";
	}           
}
