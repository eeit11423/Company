package company.activity.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

import company.activity.model.Activity;
import company.activity.model.Datecheck;
import company.activity.service.ActivityService;

@Controller
@RequestMapping("/activity")
@SessionAttributes("datecheck123")
public class cateByDateController {
	
	@Autowired
	ActivityService activityService;
	
	@RequestMapping("/cateByDate")
	public String home() {
		return "activity/cateByDate";
	}

	@RequestMapping("/cateByDate.do") 
	public String check(Datecheck datecheck, Model model){ 

		//#############這裡還需要改###############
	if(datecheck.getBegin()==null || datecheck.getEnd()==null) {
		return "activity/error";
		
	}else if(datecheck.getBegin()==datecheck.getEnd() || (datecheck.getEnd()).before(datecheck.getBegin())){
		return "activity/error";
	}
	else{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String beginString = sdf.format(datecheck.getBegin());
		String endString = sdf.format(datecheck.getEnd());
		
		System.out.println("######################"+beginString); 
		System.out.println("######################"+endString); 
		System.out.println("A. atecheck=" + datecheck);
		model.addAttribute("datecheck123" , datecheck);
		
		return "redirect:/activity/cateByDate2.do";		
	}
	
	} 
	
	@GetMapping("/cateByDate2.do")
	public String list(Model model) {
		Datecheck datecheck = (Datecheck) model.getAttribute("datecheck123");
		System.out.println("B. atecheck=" + datecheck);
		List<Activity> activities = activityService.getActivitiesByDate(datecheck.getBegin(), datecheck.getEnd());
		System.out.println(activities); 
		model.addAttribute("activities", activities);
		model.addAttribute("datecheck123", datecheck);
		
		return "activity/cateByDate2";
	}
	
	//#############要加入這個才跑得出結果#############
	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// java.util.Date
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		CustomDateEditor ce = new CustomDateEditor(dateFormat, true); 
		binder.registerCustomEditor(Date.class, ce);

	}
	
}
