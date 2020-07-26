package company.attendance.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
//import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import company.attendance.model.Leave;
import company.attendance.model.Punch;
import company.member.model.MemberBean;
import company.attendance.service.LeaveService;
import company.attendance.validators.AttendanceLeaveValidator;

@Controller
@RequestMapping(value ="attendance/leave/")
@SessionAttributes({"leave","memberBean","punch"})
public class LeaveController {
	public LeaveController() { }

	@Autowired
	LeaveService service;
	
	@Autowired
	ServletContext context;
	
//	@RequestMapping("leave")
//	public String leavelist(Model model) {
//		List<Leave> list = service.getLeave();
//		model.addAttribute("leave",list);
//		return "attendance/leave/leave";
//	}
	
	@GetMapping("/memberLeave")
	public String  getMemberPunch(Model model)  {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
//		}
		}else {
			System.out.println(memberBean.getMemberName().length());
			List<Leave> list = service.getLeave(memberBean.getMemberName());
			model.addAttribute("memberleave",list);
			System.out.println("得到的Beannnnnnnnnnnnnn:" + list);
		return "attendance/leave/memberLeave" ;
		}
	}
	
	
	@GetMapping(value="/insertLeave", produces= {"text/html"})
	public String insertLeave(Model model) {
		model.addAttribute("leave", new Leave());
		System.out.println("OK?");
		return "attendance/leave/insertLeave";
	}
	
	@GetMapping(value="/memberInsertLeave", produces= {"text/html"})
	public String MemberInsertLeave(Model model) {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		model.addAttribute("leave", new Leave(null,memberBean.getMemberNumber(), memberBean.getMemberName(),memberBean.getMemberDepartment()));
		System.out.println("OK?");
		return "attendance/leave/memberInsertLeave";
	}

//	@PostMapping(value = "/saveInsertLeave", consumes = "multipart/form-data")
	@PostMapping("/saveInsertLeave")
	public String saveInsertPunchTime(@ModelAttribute("leave") Leave leave, BindingResult bindingResult, Model model,
			HttpServletRequest request) {
//		Punch punch = (Punch) model.getAttribute("punch");
		AttendanceLeaveValidator validator = new AttendanceLeaveValidator();
		validator.validate(leave, bindingResult);
		if (bindingResult.hasErrors()) {
			return "attendance/leave/insertLeave";
		}
		int n = service.saveLeave(leave);
		if (n == 1) {
			return "redirect:/attendance/leave/queryLeave";
		} else {
			FieldError error = new FieldError("leave", "leaveDate",leave.getLeaveDate(), false, null, null,  (n==-1 ? "日期重複" : "資料庫錯誤"));
			bindingResult.addError(error);
			return "attendance/leave/insertLeave";
		}
	}
	
	@PostMapping("/memberSaveInsertLeave")
	public String memberSaveInsertLeave(@ModelAttribute("leave") Leave leave, BindingResult bindingResult, Model model,
			HttpServletRequest request) {
		AttendanceLeaveValidator validator = new AttendanceLeaveValidator();
		validator.validate(leave, bindingResult);
		if (bindingResult.hasErrors()) {
			return "attendance/leave/memberInsertLeave";
		}
		int n = service.saveLeave(leave);
		if (n == 1) {
			return "redirect:/attendance/leave/memberLeave";
		} else {
			FieldError error = new FieldError("leave", "leaveDate",leave.getLeaveDate(), false, null, null,  (n==-1 ? "日期重複" : "資料庫錯誤"));
			bindingResult.addError(error);
			return "attendance/leave/memberInsertLeave";
		}
	}
	
	@GetMapping("/queryLeave")
	public String  getQueryLeave()  {
		return "attendance/leave/queryLeave";
	}
	
	@GetMapping("/getAllMember")
	public ResponseEntity<List<MemberBean>>  getAllMember(){
		List<MemberBean> list = service.getAllMember();
		ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}
	
	@GetMapping("/queryLeaveData")
	public ResponseEntity<List<Leave>> getLeaveData(
			@RequestParam(value="memberNumber", defaultValue = "all") String memberNumber,
			@RequestParam(value="selectdate", defaultValue = "all") String selectdate ){ 
		List<Leave> listTarget = service.queryLeave(memberNumber, selectdate);
		
		ResponseEntity<List<Leave>> re = new ResponseEntity<>(listTarget, HttpStatus.OK);
		return re;
	}
	
	@GetMapping(value="/leaveEdit/{leaveId}", produces= {"text/html"})
	public String editLeaveFromLeaveId(@PathVariable Integer leaveId, Model model) {
		Leave leave = service.editLeaveFromLeaveId(leaveId);
		model.addAttribute(leave);
		return "attendance/leave/updateLeave";
	}
	
	@PostMapping("/leave/update/{key}")   
	public String updateLeave(
			@PathVariable Integer key, Leave leave) {
		service.updateLeave(leave);
		System.out.println("hi");
		return "redirect:/attendance/punch/queryPunchTime";
	}

	@GetMapping("/deleteLeave/{key}")
	public String deletePunchTime(@PathVariable Integer key, Model model, HttpServletRequest req) {
		service.deleteLeaveByLeaveId(key);
		return "redirect:/attendance/punch/queryPunchTime";
	}
	
	@ModelAttribute("leave")
	public Leave leaveModelAttribute(Model model) {
		Leave leave = new Leave();
		return leave;
	}
	
	@ModelAttribute("punch")
	public Punch punchModelAttribute(Model model) {
		Punch punch = new Punch();
		return punch;
	}
	
}
