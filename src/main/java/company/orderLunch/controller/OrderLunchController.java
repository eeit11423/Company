package company.orderLunch.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import company.rearend.service.GraphService;
@Controller
public class OrderLunchController {
	@Autowired
	GraphService graphservice;
	//導頁
	@GetMapping("/orderLunch/order")
	public String list(Model model) {
		return "orderLunch/order";
	}
}
