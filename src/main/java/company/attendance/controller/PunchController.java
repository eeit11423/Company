package company.attendance.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import company.member.model.MemberBean;
import company.attendance.model.Punch;
import company.attendance.service.LeaveService;
import company.attendance.service.PunchService;
import company.attendance.validators.AttendancePunchValidator;

@Controller
@RequestMapping(value ="attendance/punch/")
@SessionAttributes({"punch", "memberBean"})
public class PunchController {
	public PunchController() { }

	@Autowired
	PunchService service;
	
	@Autowired
	LeaveService leaveService;
	
	@Autowired
	ServletContext context;
	
	@GetMapping("/memberPunch")
	public String  getMemberPunch(Model model)  {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
//		}
		}else {
			System.out.println(memberBean.getMemberName().length());
			List<Punch> list = service.getPunchTime(memberBean.getMemberName());
			model.addAttribute("memberpunch",list);
			
		return "attendance/punch/memberPunch" ;
		}
	}
//	//搜尋登入員工的punch資料
//	已停用
//	@RequestMapping("punch")
//	public String punch( Model model) {
//		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
//		if (memberBean == null) {
//			return "redirect: " + context.getContextPath() + "/login";
//		}else {
//			System.out.println(memberBean.getMemberName());
//			List<Punch> list = service.getPunchTime(memberBean.getMemberName());
//			model.addAttribute("punch",list);
//			return "attendance/punch/punch";
//		}
//	}
	
//	//搜尋所有人punch資料
//	@RequestMapping("punch")
//	public String punch( Model model) {
//			List<Punch> list = service.getPunchTime();
//			model.addAttribute("punch",list);
//			return "attendance/punch/punch";
//	}
	
	@GetMapping("/punchWorkOn")
	public String punchWorkOn(Model model) {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		service.punchWorkOn(memberBean.getMemberId());
		return "redirect:/attendance/punch/memberPunch";
	}
	
	
	@GetMapping("/punchWorkOff")
	public String punchWorkOff(Model model) {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		Timestamp workWorkOn = service.getWorkOnTime(memberBean.getMemberId());
		if(workWorkOn != null){
			service.punchWorkOff(memberBean, workWorkOn);
		}
		return "redirect:/attendance/punch/memberPunch";
	}
	
//	@GetMapping("/workOnTime")
//	public String WorkOnTime(Model model) {
//		Timestamp workOnTime = service.getWorkOnTime();
//		model.addAttribute("time", workOnTime);
//		return "attendance/punch/punch";
//	}
	
	//管理者新增
	@GetMapping(value="/insertPunchTime", produces= {"text/html"})
	public String insertPunchTime(Model model) {
		model.addAttribute("punch", new Punch());
		return "attendance/punch/insertPunchTime";
	}
	//員工新增
	@GetMapping(value="/memberInsertPunchTime", produces= {"text/html"})
	public String memberInsertPunchTime(Model model) {
		System.out.println("=========進入新增頁面=========");
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		model.addAttribute("punch", new Punch(null,memberBean.getMemberNumber(), memberBean.getMemberName(),memberBean.getMemberDepartment()));
		return "attendance/punch/memberInsertPunchTime";
	}	
	
	@PostMapping(value = "/saveInsertPunchTime", consumes = "application/x-www-form-urlencoded")   
	public String saveInsertPunchTime(@ModelAttribute("punch") Punch punch, BindingResult bindingResult, Model model,
			HttpServletRequest request) {
		AttendancePunchValidator validator = new AttendancePunchValidator();
		validator.validate(punch, bindingResult);
		if (bindingResult.hasErrors()) {
			return "redirect:/attendance/punch/insertPunchTime";
		}
		int n = service.savePunchTime(punch);
		if (n==1) {
			return "redirect:/attendance/punch/queryPunchTime";
		} else {
			FieldError error = new FieldError("punch", "punchDate",punch.getPunchDate(), false, null, null,  (n==-1 ? "日期重複" : "資料庫錯誤"));
			bindingResult.addError(error);
			return "attendance/punch/insertPunchTime";
		}
	}
	
	@PostMapping(value = "/memberSaveInsertPunchTime", consumes = "application/x-www-form-urlencoded")   
	public String memberSaveInsertPunchTime(@ModelAttribute("punch") Punch punch, BindingResult bindingResult, Model model,
			HttpServletRequest request) {
		AttendancePunchValidator validator = new AttendancePunchValidator();
		validator.validate(punch, bindingResult);
		if (bindingResult.hasErrors()) {
			return "redirect:/attendance/punch/memberInsertPunchTime";
		}
		int n = service.savePunchTime(punch);
		if (n==1) {
			return "redirect:/attendance/punch/memberPunch";
		} else {
			FieldError error = new FieldError("punch", "punchDate",punch.getPunchDate(), false, null, null,  (n==-1 ? "日期重複" : "資料庫錯誤"));
			bindingResult.addError(error);
			return "attendance/punch/memberInsertPunchTime";
		}
	}
	
	@GetMapping("/queryPunchTime")
	public String  getQueryPunchTime()  {
		return "attendance/punch/queryPunchTime";
	}

	@GetMapping("/getAllMember")
	public ResponseEntity<List<MemberBean>>  getAllMember(){
		List<MemberBean> list = service.getAllMember();
		ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}
	
	@GetMapping("/queryPunchTimeData")
	public ResponseEntity<Map<String, Object>> queryPunchTime(
			@RequestParam(value="memberNumber", defaultValue = "all") String memberNumber,
			@RequestParam(value="selectdate", defaultValue = "all", required = false) String selectdate, Model model){ 
			List<Punch> listTarget = service.queryPunchTime(memberNumber, selectdate);
			Map<String, Object> map =  new HashMap<>();
			map.put("punchtimes", listTarget);
		
			ResponseEntity<Map<String, Object>> re = new ResponseEntity<>(map, HttpStatus.OK);
			return re;
	}
	
	
	@GetMapping("/queryPunchTimeDataByPunchLate")
	public ResponseEntity<Map<String, Object>> queryPunchTimeByPunchLate(
			@RequestParam(value="memberNumber", defaultValue = "all") String memberNumber,
			@RequestParam(value="selectdate", defaultValue = "all", required = false) String selectdate,
			@RequestParam(value="punchLate", defaultValue = "遲到", required = false) String punchLate, Model model){ 
		List<Punch> listTarget = service.queryPunchTimeByPunchLate(memberNumber, selectdate, punchLate);
		Map<String, Object> map =  new HashMap<>();
		map.put("punchtimes", listTarget);
		
		ResponseEntity<Map<String, Object>> re = new ResponseEntity<>(map, HttpStatus.OK);
		return re;
	}
	
	@GetMapping("/queryPunchTimeDataByPunchEarly")
	public ResponseEntity<Map<String, Object>> queryPunchTimeByPunchEarly(
			@RequestParam(value="memberNumber", defaultValue = "all") String memberNumber,
			@RequestParam(value="selectdate", defaultValue = "all", required = false) String selectdate,
			@RequestParam(value="punchEarly", defaultValue = "早退", required = false) String punchEarly, Model model){ 
		List<Punch> listTarget = service.queryPunchTimeByPunchEarly(memberNumber, selectdate, punchEarly);
		Map<String, Object> map =  new HashMap<>();
		map.put("punchtimes", listTarget);
		
		ResponseEntity<Map<String, Object>> re = new ResponseEntity<>(map, HttpStatus.OK);
		return re;
	}
	
	@GetMapping("/queryAttendanceData")
	public ResponseEntity<Map<String, List<?>>> queryAttendanceDataByPunch(
			@RequestParam(value="memberNumber", defaultValue = "all") String memberNumber,
			@RequestParam(value="selectdate", defaultValue = "all", required = false) String selectdate, Model model){ 
		Map<String, List<?>> attendance = service.queryAttendanceData(memberNumber, selectdate);
		System.out.println("attendance得到的List："+attendance);
//		System.out.println(attendance);
//		System.out.println(attendance.get(1));
		ResponseEntity<Map<String, List<?>>> re = new ResponseEntity<>(attendance, HttpStatus.OK);
		return re;
	}
	
	@GetMapping("/queryAttendanceDataByPunchLate")
	public ResponseEntity<Map<String, List<?>>> queryAttendanceDataByPunchLate(
			@RequestParam(value="punchLate", defaultValue = "遲到", required = false) String punchLate,
			@RequestParam(value="memberNumber", defaultValue = "all") String memberNumber,
			@RequestParam(value="selectdate", defaultValue = "all", required = false) String selectdate, Model model){ 
		Map<String, List<?>> attendance = service.queryAttendanceDataByPunchLate(memberNumber, selectdate, punchLate);
		System.out.println("attendance得到的List："+attendance);
//		System.out.println(attendance);
//		System.out.println(attendance.get(1));
		ResponseEntity<Map<String, List<?>>> re = new ResponseEntity<>(attendance, HttpStatus.OK);
		return re;
	}
	
	@GetMapping("/queryAttendanceDataByPunchEarly")
	public ResponseEntity<Map<String, List<?>>> queryAttendanceDataByPunchEarly(
			@RequestParam(value="punchLate", defaultValue = "早退", required = false) String punchEarly,
			@RequestParam(value="memberNumber", defaultValue = "all") String memberNumber,
			@RequestParam(value="selectdate", defaultValue = "all", required = false) String selectdate, Model model){ 
		Map<String, List<?>> attendance = service.queryAttendanceDataByPunchEarly(memberNumber, selectdate, punchEarly);
		System.out.println("attendance得到的List："+attendance);
//		System.out.println(attendance);
//		System.out.println(attendance.get(1));
		ResponseEntity<Map<String, List<?>>> re = new ResponseEntity<>(attendance, HttpStatus.OK);
		return re;
	}
	
	@GetMapping("/queryAttendanceDataByLeave")
	public ResponseEntity<Map<String, List<?>>> queryAttendanceDataByLeave(
			@RequestParam(value="punchLate", defaultValue = "all", required = false) String leave,
			@RequestParam(value="memberNumber", defaultValue = "all") String memberNumber,
			@RequestParam(value="selectdate", defaultValue = "all", required = false) String selectdate, Model model){ 
		Map<String, List<?>> attendance = service.queryAttendanceDataByLeave(memberNumber, selectdate, leave);
		System.out.println("attendance得到的List："+attendance);
//		System.out.println(attendance);
//		System.out.println(attendance.get(1));
		ResponseEntity<Map<String, List<?>>> re = new ResponseEntity<>(attendance, HttpStatus.OK);
		return re;
	}
	
	@GetMapping(value="/punchTimeEdit/{punchId}", produces= {"text/html"})
	public String editPunchtimeFromPunchId(@PathVariable Integer punchId, Model model) {
			Punch punch = service.editPunchtimeFromPunchId(punchId);
			model.addAttribute(punch);
			return "attendance/punch/updatePunchTime";
	}
	
	@PostMapping("/punchTime/update/{key}")   
	public String updatePunchTime(
			@PathVariable Integer key, Punch punch) {
		
		service.updatePunchTime(punch);
		System.out.println("hi");
		return "redirect:/attendance/punch/queryPunchTime";
	}

	@GetMapping("/deletePunchTime/{key}")  
	public String deletePunchTime(@PathVariable Integer key, Model model, HttpServletRequest req) {
		service.deletePunchTimeByPunchId(key);
		return "redirect:/attendance/punch/queryPunchTime";
	}
	
	@ModelAttribute("punch")
	public Punch punchModelAttribute(Model model) {
		Punch punch = new Punch();
		return punch;
	}
	
//	@ModelAttribute("memberBean")
//	public MemberBean modelAttribute(HttpServletRequest req, Model model) {
//		MemberBean memberbean = new MemberBean();
//		return memberbean;
//	}
}
