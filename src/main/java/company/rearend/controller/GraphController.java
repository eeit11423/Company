package company.rearend.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import company.member.model.MemberBean;
import company.rearend.service.GraphService;
import company.shopping.model.OrderItemBean;
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
		System.out.println("=========================================================b");
		//List<MemberBean> beans =graphservice.getAllSalary();
		//model.addAttribute("graph", beans);
		List<MemberBean> products = graphservice.getMemberBypeople(null);
		ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(products, HttpStatus.OK);
		return re;
	}//會員資料AJEX
	@GetMapping("/number")
	public String list1(Model model) {
		System.out.println("=========================================================a");
		List<MemberBean> beans =graphservice.getMemberNumberpeople(null);
		List<ShoppingBean> beans1 =graphservice.getShoppingNumber(null);
		
		model.addAttribute("MemberNumber", beans);
		model.addAttribute("SpringNumber", beans1);
		
		return "rearend/Salaryex";
	}

	@GetMapping("/orderprice")
	public String list2(Model model) {
		System.out.println("=========================================================a");
		List<OrderItemBean> beans =graphservice.getOrderprice(null);
		List<MemberBean> bean1 =graphservice.getMemberNumberpeople(null);
		List<ShoppingBean> beans2 =graphservice.getShoppingNumber(null);
		model.addAttribute("peopleNumber", bean1);
		model.addAttribute("priceNumber", beans2);
		model.addAttribute("price", beans);
		return "rearend/rearEnd";
	}
	
	
	
	
	@GetMapping("/rearend/Salaryex")
	public String aa() {
	
		return "rearend/Salaryex";
	}
	@GetMapping("/rearend/meindex")
	public String bb() {
	
		return "rearend/meindex";
	}
	
	@GetMapping("/rearendd")
	public String rearendd() {
	
		return "../../fragment/headerRearend";
	}
}
