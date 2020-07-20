package company.activity.controller;
//package activity.controller;
//
//import java.sql.Timestamp;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import activity.model.Activity;
//import activity.model.Join;
//import activity.service.JoinService;
//import activity.validators.ActivityValidator;
//
//@Controller
//@RequestMapping("/activity_join")
//public class JoinController {
//
//	@Autowired
//	JoinService joinService;
//	
//	// ##################這裡是有關參加活動的方法##################
//
//		// 本方法於新增時，送出空白的表單讓使用者輸入資料
//		@GetMapping(value = "/join/{id}")
//		public String showEmptyJoinForm(@PathVariable("id") Integer id, Model model) {
//			Activity activity = activityService.get(id);
//			model.addAttribute(activity);
//			Join join = new Join();
//			join.setActivityId(id);
//			
//			Timestamp joinTime = new Timestamp(System.currentTimeMillis());
//			join.setJoinTime(joinTime);
//			model.addAttribute("join", join);
//
//			return "activity/join";
//		}
//
//		// 當使用者填妥資料按下Submit按鈕後，本方法接收將瀏覽器送來的會員資料，新進行資料的檢查，
//		// 若資料有誤，轉向寫入錯誤訊息的網頁，若資料無誤，則呼叫Service元件寫入資料庫
//		@PostMapping(value = "/join/{id}")
//		// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
//		public String addJoin(@ModelAttribute("join") /* @Valid */ Join join, BindingResult result, Model model,
//				HttpServletRequest request) {
//			ActivityValidator validator = new ActivityValidator();
//			// 呼叫Validate進行資料檢查
//			validator.validate(join, result);
//
//			
//
//			try {
//				joinService.save(join);
//			} catch (Exception ex) {
//				System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
//				result.rejectValue("activityId", "", "請通知系統人員...");
//				return "activity/join";
//			}
//
//			return "redirect:/activity/showAllActivities";
//		}
//
//		// 刪除一筆紀錄
//		// 由這個方法刪除記錄...
//		@DeleteMapping("/join/{id}")
//		public String deleteJoin(@PathVariable("id") Integer id) {
//			joinService.delete(id);
//			return "redirect:/activity/showAllActivities";
//		}
//
//}
