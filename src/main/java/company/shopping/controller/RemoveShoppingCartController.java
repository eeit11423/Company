package company.shopping.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

@Controller
@SessionAttributes({ "ShoppingCart" })
public class RemoveShoppingCartController {

	@Autowired
	ServletContext context;
	@RequestMapping("removeShoppingCart")
	public String removeCart(Model model, WebRequest webRequest, SessionStatus status) {
		System.out.println("removeShoppingCart OK");
		status.setComplete();
		webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
		return "redirect: " + context.getContextPath() + "/";
	}
}
