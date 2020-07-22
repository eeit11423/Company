package company.attendance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import company.attendance.model.Leave;
import company.member.model.MemberBean;
import company.attendance.service.LeaveService;
import company.attendance.validators.AttendanceLeaveValidator;

@Controller
@RequestMapping(value ="attendance/leave/")
@SessionAttributes({"leave"})
public class LeaveController {
	public LeaveController() { }

	@Autowired
	LeaveService service;
	
	@RequestMapping("leave")
	public String leavelist(Model model) {
		List<Leave> list = service.getLeave();
		model.addAttribute("leave",list);
		return "attendance/leave/leave";
	}
	
	
	@GetMapping(value="/insertLeave", produces= {"text/html"})
	public String insertLeave(Model model) {
		model.addAttribute("leave", new Leave());
		System.out.println("OK?");
		return "attendance/leave/insertLeave";
	}

	@PostMapping(value = "/saveInsertLeave", consumes = "application/x-www-form-urlencoded")
	public String saveInsertPunchTime(@ModelAttribute("leave") Leave leave, BindingResult bindingResult, Model model,
			HttpServletRequest request) {
		AttendanceLeaveValidator validator = new AttendanceLeaveValidator();
		validator.validate(leave, bindingResult);
		if (bindingResult.hasErrors()) {
			return "attendance/leave/insertLeave";
		}
		int n = service.saveLeave(leave);
		if (n == 1) {
			return "redirect:/attendance/leave/queryLeave";
		} else {
			FieldError error = new FieldError("punch", "punchDate",leave.getLeaveDate(), false, null, null,  (n==-1 ? "日期重複" : "資料庫錯誤"));
			bindingResult.addError(error);
			return "attendance/leave/insertLeave";
		}
	}
	
	@GetMapping("/queryLeave")
	public String  getQueryLeave()  {
		return "attendance/leave/queryLeave";
	}
	
	@GetMapping("/backLeave")
	public String  backLeave()  {
		return "redirect:/attendance/leave/leave";
	}
	
	@GetMapping("/getAllMember")
	public ResponseEntity<List<MemberBean>>  getAllMember(){
		System.out.println("-----------------------SSSSS");
		List<MemberBean> list = service.getAllMember();
		ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}
	
	@GetMapping("/queryLeaveData")
	public ResponseEntity<List<Leave>> getLeaveData(
			@RequestParam(value="memberNumber", defaultValue = "0") String memberNumber,
			@RequestParam(value="selectdate", defaultValue = "0") String selectdate ){ 
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
	
	@PutMapping("/leave/update/{key}")   
	public String updateLeave(
			@PathVariable Integer key, Leave leave) {
		service.updateLeave(leave);
		System.out.println("hi");
		return "redirect:/attendance/leave/queryLeave";
	}

	@DeleteMapping("/leave/update/{key}")
	public String deletePunchTime(@PathVariable Integer key, Model model, HttpServletRequest req) {
		service.deleteLeaveByLeaveId(key);
		return "redirect:/attendance/leave/queryLeave";
	}
	
	@ModelAttribute("leave")
	public Leave leaveModelAttribute(Model model) {
		Leave leave = new Leave();
		return leave;
	}
	
}
