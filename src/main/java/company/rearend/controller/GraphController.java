package company.rearend.controller;


import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;



import company.member.model.MemberBean;
import company.rearend.service.GraphService;
import company.shopping.model.ShoppingBean;
@Controller
public class GraphController {
	@Autowired
	GraphService graphservice;
	//會員資料
	@GetMapping("/rearend/allSalary")
	public String list(Model model) {
		System.out.println("=========================================================a");
		List<MemberBean> beans =graphservice.getAllSalary();
		
		model.addAttribute("graph", beans);
		return "rearend/allSalary";
	}//會員資料AJEX
	@GetMapping("/rearend/allSalary_ajax")
	public ResponseEntity<List<MemberBean>>  allSalary_ajax() {
		System.out.println("=========================================================a");
		//List<MemberBean> beans =graphservice.getAllSalary();
		//model.addAttribute("graph", beans);
		List<MemberBean> products = graphservice.getMemberBySalary(null);
		ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(products, HttpStatus.OK);
		return re;
	}
	@GetMapping("/rearend/allSpeople_ajax")
	public ResponseEntity<List<MemberBean>>  allPeople_ajax() {
		System.out.println("=========================================================a");
		//List<MemberBean> beans =graphservice.getAllSalary();
		//model.addAttribute("graph", beans);
		List<MemberBean> products = graphservice.getMemberBypeople(null);
		ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(products, HttpStatus.OK);
		return re;
	}
	@GetMapping("/rearend/Salaryex")
	public String aa() {
	
		return "rearend/Salaryex";
	}
	@GetMapping("/rearend/myindex")
	public String bb() {
	
		return "rearend/myindex";
	}
}
