package _00_init;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import company.index.model.indexBean;
import company.index.service.indexService;

@Controller
@SessionAttributes({"memberBean"})
public class HomeController {
	@Autowired
	indexService service;
	@Autowired
	ServletContext context;
	@RequestMapping("/")
	public String home(Model model) {
		List<indexBean> ib = service.getAllProducts();
		model.addAttribute("indexBean", ib);

		return "index";
	}
	@GetMapping("/score")
	public String score(Model model) {		
		return "score";
	}
}
