package company.activity.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import company.activity.model.Activity;
import company.activity.model.Department;
import company.activity.model.Join;
import company.activity.service.ActivityService;
import company.activity.service.DepartmentService;
import company.activity.service.JoinService;
import company.activity.validators.ActivityValidator;
import company.member.model.MemberBean;



@Controller
@RequestMapping("/activity")
@SessionAttributes({ "memberBean"})
public class ActivityController {
	String noImage = "/images/NoImage.png";
	String noImageFemale = "/images/NoImage_Female.jpg";
	String noImageMale = "/images/NoImage_Male.png";

	@Autowired
	ActivityService activityService;

	@Autowired
	DepartmentService departmentService;

	@Autowired
	ServletContext context;
	
	@Autowired
	JoinService joinService;

	// 顯示所有活動資料
	@GetMapping("/showAllActivities")
	public String list(Model model) {
		model.addAttribute("activities", activityService.getAllActivities());
		return "activity/activities";
	}

	// ############ 顯示分類活動資料
	@RequestMapping("/queryByActCategory")
	public String getActCategoryList(Model model) {
		List<String> list = activityService.getAllActCategories();
		model.addAttribute("actCategoryList", list);
		return "activity/types/actCategory";
	}

	@RequestMapping("/activities/{actCategory}")
	public String getActivitiesByActCategory(@PathVariable("actCategory") String actCategory, Model model) {
		List<Activity> activities = activityService.getActivitiesByActCategory(actCategory);
		model.addAttribute("activities", activities);
		return "activity/cateActivities";
	}

	// ############ 顯示日期篩選活動資料 還不知道該怎麼辦##############
//		@RequestMapping("/queryByDate")
//		public String getActCategoryList(Model model) {
//			List<String> list = activityService.getAllActCategories();
//			model.addAttribute("actCategoryList", list);
//			return "activity/types/beforeDate";
//		}

//		@RequestMapping("/activities/{beforeDate}")
//		public String getActivitiesByDate(@PathVariable("beforeDate") Date beforeDate, Model model) {
//			List<Activity> activities = activityService.getActivitiesByDate(beforeDate);
//			model.addAttribute("activities",activities);
//			return "activity/cateActivities";
//		}

	// ########與資料庫無關的選單分類##########

	@ModelAttribute("actCategoryAllList")
	public List<String> getActCategoryAllList() {
		List<String> actCategoryAllList = new ArrayList<String>();
		actCategoryAllList.add("藝術");
		actCategoryAllList.add("遊戲");
		actCategoryAllList.add("運動");
		actCategoryAllList.add("聯誼");
		return actCategoryAllList;
	}

	// 本方法於新增時，送出空白的表單讓使用者輸入資料
	@GetMapping(value = "/act")
	public String showEmptyForm(Model model) {
		Activity activity = new Activity();
//      下列敘述簡化測試時的資料輸入		
//		member.setAccount("a10225");
//		member.setName("Lisa Lee");
//		member.setEmail("www@gmail.com");
//		member.setWeight(65.5);
//		member.setGender("F");
//		member.setBirthday(java.sql.Date.valueOf("1988-7-5"));
		model.addAttribute("activity", activity);

		return "activity/insertActivity";
	}

	// 當使用者填妥資料按下Submit按鈕後，本方法接收將瀏覽器送來的會員資料，新進行資料的檢查，
	// 若資料有誤，轉向寫入錯誤訊息的網頁，若資料無誤，則呼叫Service元件寫入資料庫
	@PostMapping(value = "/act")
	// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
	public String add(@ModelAttribute("activity") /* @Valid */ Activity activity, BindingResult result, Model model,
			HttpServletRequest request) {
		ActivityValidator validator = new ActivityValidator();
		// 呼叫Validate進行資料檢查
		validator.validate(activity, result);
		if (result.hasErrors()) {
//          下列敘述可以理解Spring MVC如何處理錯誤			
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println("有錯誤：" + error);
//			}
			return "activity/insertActivity";
		}
		MultipartFile picture = activity.getOtherImage();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			activity.setFileName(originalFilename);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				activity.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		// 必須要找出對應的Department物件
		Department department = departmentService.getDepartment(activity.getDepartment().getId());
		activity.setDepartment(department);

		// 必須要找出對應的ActCategory物件
//		ActCategory actCategory = actCategoryService.getActCategory(activity.getActCategory().getId());
//		activity.setActCategory(actCategory);

		Timestamp postTime = new Timestamp(System.currentTimeMillis());
		activity.setPostTime(postTime);

		Timestamp updateTime = null;
		activity.setUpdateTime(updateTime);

		try {
			activityService.save(activity);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			result.rejectValue("activityTitle", "", "活動已存在，請重新輸入");
			return "activity/insertActivity";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("activityTitle", "", "請通知系統人員...");
			return "activity/insertActivity";
		}
//		// 將上傳的檔案移到指定的資料夾, 目前註解此功能
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists())
//				imageFolder.mkdirs();
//			File file = new File(imageFolder, "MemberImage_" + member.getId() + ext);
//			productImage.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
		return "redirect:/activity/showAllActivities";
	}

	// 當使用者需要修改時，本方法送回含有會員資料的表單，讓使用者進行修改
	// 由這個方法送回修改記錄的表單...
	@GetMapping(value = "/act/{id}")
	public String showDataForm(@PathVariable("id") Integer id, Model model) {
		Activity activity = activityService.get(id);
		model.addAttribute(activity);
		return "activity/updateActivity";
	}

	// 當將瀏覽器送來修改過的會員資料時，由本方法負責檢核，若無誤則寫入資料庫
	@PostMapping("/act/{id}")
	// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
	//
	public String modify(@ModelAttribute("activity") Activity activity, BindingResult result, Model model,
			@PathVariable Integer id, HttpServletRequest request) {
		ActivityValidator validator = new ActivityValidator();
		validator.validate(activity, result);
		if (result.hasErrors()) {
			System.out.println("result hasErrors(), activity=" + activity);
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "activity/insertActivity";
		}

		// 找到對應的department物件
		Department department = departmentService.getDepartment(activity.getDepartment().getId());
		activity.setDepartment(department);

		// 找到對應的Category物件
//		ActCategory actCategory = actCategoryService.getActCategory(activity.getActCategory().getId());
//		activity.setActCategory(actCategory);
//		Timestamp postTime = new Timestamp(System.currentTimeMillis());
//		activity.setPostTime(postTime);

		MultipartFile picture = activity.getOtherImage();

		if (picture.getSize() == 0) {
			// 表示使用者並未挑選圖片
//			Member original = memberService.get(id);
//			member.setImage(original.getImage());
		} else {
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				activity.setFileName(originalFilename);
			}

			// 建立Blob物件
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					activity.setImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		Timestamp updateTime = new Timestamp(System.currentTimeMillis());
		activity.setUpdateTime(updateTime);
		activityService.update(activity);
		return "redirect:/activity/showAllActivities";
	}

//	@RequestMapping(value = "/mem", method = RequestMethod.PUT)
//	public String update(Member member, Model model) {
//		System.out.println("member==>" + member);
//		// 找到對應的Hobby物件
//		Hobby hobby = hobbyService.getHobby(member.getHobby().getId());
//		// 找到對應的Category物件
//		Category category = categoryService.getCategory(member.getCategory().getId());
//		member.setCategory(category);
//		member.setHobby(hobby);
//		memberService.update(member);
//		return "redirect:/crm/showAllMembers";
//	}

	// 刪除一筆紀錄
	// 由這個方法刪除記錄...
	@PostMapping("/act2/{id}")
	public String delete(@PathVariable("id") Integer id) {
		activityService.delete(id);
		return "redirect:/activity/showAllActivities";
	}

	@GetMapping("/activity/picture/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		Activity activity = activityService.get(id);
		if (activity == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = activity.getFileName();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = activity.getImage();
		if (blob != null) {
			body = blobToByteArray(blob);
		} else {
			String path = null; // #############本段暫時不用
//			if (activity.getGender() == null || member.getGender().length() == 0) {
			path = noImageMale;
//			} else if (member.getGender().equals("M")) {
//				path = noImageMale;
//			} else {
//				path = noImageFemale;
//				;
//			}
			body = fileToByteArray(path);
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

		return re;
	}

	// ##############試圖解決無法顯示圖片的問題##############
	@GetMapping("/activities/activity/picture/{id}")
	public ResponseEntity<byte[]> getPicture2(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		Activity activity = activityService.get(id);
		if (activity == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = activity.getFileName();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = activity.getImage();
		if (blob != null) {
			body = blobToByteArray(blob);
		} else {
			String path = null; // #############本段暫時不用
//			if (activity.getGender() == null || member.getGender().length() == 0) {
			path = noImageMale;
//			} else if (member.getGender().equals("M")) {
//				path = noImageMale;
//			} else {
//				path = noImageFemale;
//				;
//			}
			body = fileToByteArray(path);
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

		return re;
	}
	// ##############試圖解決無法顯示圖片的問題##############
		@GetMapping("/picture/{id}")
		public ResponseEntity<byte[]> getPicture3(@PathVariable("id") Integer id) {
			byte[] body = null;
			ResponseEntity<byte[]> re = null;
			MediaType mediaType = null;
			HttpHeaders headers = new HttpHeaders();
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());

			Activity activity = activityService.get(id);
			if (activity == null) {
				return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
			}
			String filename = activity.getFileName();
			if (filename != null) {
				if (filename.toLowerCase().endsWith("jfif")) {
					mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
				} else {
					mediaType = MediaType.valueOf(context.getMimeType(filename));
					headers.setContentType(mediaType);
				}
			}
			Blob blob = activity.getImage();
			if (blob != null) {
				body = blobToByteArray(blob);
			} else {
				String path = null; // #############本段暫時不用
//				if (activity.getGender() == null || member.getGender().length() == 0) {
				path = noImageMale;
//				} else if (member.getGender().equals("M")) {
//					path = noImageMale;
//				} else {
//					path = noImageFemale;
//					;
//				}
				body = fileToByteArray(path);
			}
			re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

			return re;
		}
	@ModelAttribute
	public void commonData(Model model) {
		List<Department> departmentList = departmentService.getAllDepartments();
//		List<ActCategory> actCategoryList = actCategoryService.getAllActCategories();
//		Map<String, String> genderMap = new HashMap<>();
//		genderMap.put("M", "Male");
//		genderMap.put("F", "Female");
		model.addAttribute("departmentList", departmentList);
//		model.addAttribute("actCategoryList", actCategoryList);
//		model.addAttribute("genderMap", genderMap);
	}

	@ModelAttribute
	public void getActivity(@PathVariable(value = "id", required = false) Integer id, Model model) {
		System.out.println("@ModelAttribute.getActivity()...");
		if (id != null) {
			Activity activity = activityService.get(id);
			model.addAttribute("activity", activity);
		} else {
			Activity activity = new Activity();
			activity.setLogin("false");
			model.addAttribute("activity", activity);
		}
	}

	// 本方法可對WebDataBinder進行組態設定。除了表單資料外，絕大多數可以傳入控制器方法的
	// 參數都可以傳入以@InitBinder修飾的方法。本方法最常使用的參數為WebDataBinder。
	//
	// org.springframework.web.bind.WebDataBinder
	// 為 org.springframework.validation.DataBinder 的子類別，它將夾帶在請求物件內
	// 的請求參數綁定在JavaBean內。
	// registerCustomEditor(): 可對JavaBean內之特定型態自定該型態的屬性編輯器(PropertyEditor)
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		try (InputStream is = context.getResourceAsStream(path);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/index")
	public String home() {
		return "activity/index";
	}
	
	//##############詳細資料查詢###########
	
	@GetMapping("/activity")
	public String getActivitiesById(@RequestParam Integer id, Model model){
		model.addAttribute("activity", activityService.get(id));
		model.addAttribute("joins", joinService.getJoinsByActivityId(id));
		return "activity/activity";
	}
	
	@GetMapping("activities/activity")
	public String getActivitiesById2(@RequestParam Integer id, Model model){
		model.addAttribute("activity", activityService.get(id));
		model.addAttribute("joins", joinService.getJoinsByActivityId(id));
		return "activity/activity";
	}
	
	
	
	
	// ##################這裡是有關參加活動的方法##################
//%%%%%%%%%%%%%%%%%%%%%%%抓取session的memberBean資料%%%%%%%%%%%%%%%%%%%%%%%%%
			// 本方法於新增時，送出空白的表單讓使用者輸入資料
			@GetMapping(value = "/join/{id}")
			public String showEmptyJoinForm(@PathVariable("id") Integer id, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{		
				MemberBean mb = (MemberBean) model.getAttribute("memberBean");
				if (mb == null) {
					return "redirect: " + context.getContextPath() + "/login";
				}

				System.out.println("#########################"+mb.getMemberId());
				
				Activity activity = activityService.get(id);
				model.addAttribute("activity", activity);
				
				Integer mbId = mb.getMemberId();
				Integer aId = activity.getId();
				
				List<Join> list = joinService.getJoinsByActivityIdAndJoinMemberId(aId, mbId);
				
				if (list.size() == 0) {
					Join join = new Join();
					model.addAttribute("join", join);
					//＊＊＊＊＊改由前端抓取數值＊＊＊＊＊
//					join.setActivityId(activity.getId());
//					join.setActivityName(activity.getActivityTitle());
					return "activity/join";
				
				}else {
					System.out.println(list);
					model.addAttribute("joins", list);				
					return "activity/joinin";	
				}
			}

			// 當使用者填妥資料按下Submit按鈕後，本方法接收將瀏覽器送來的會員資料，新進行資料的檢查，
			// 若資料有誤，轉向寫入錯誤訊息的網頁，若資料無誤，則呼叫Service元件寫入資料庫
			@PostMapping(value = "/join/{id}")
			// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
			public String addJoin(@ModelAttribute("join") /* @Valid */ Join join,@PathVariable("id") Integer id, BindingResult result, Model model,
					HttpServletRequest request) {
//				//############每點籍參加，人數減1###########
				  Activity activity = activityService.get(id);
//				  Long num = joinService.getJoinCountsByActivityId(id);
//				  System.out.println("#########################n="+num);
				  Integer joinNum = activity.getJoinNum();
//				  Long total = joinNum-num-1;
//				  System.out.println("#########################j-n="+total);
//				  
//				  String s = String.valueOf(total);
//				  Integer t = Integer.valueOf(s);
//				  
//				  System.out.println("#########################t="+t);
				  Integer t = joinNum-1;

				try {
					//********似乎寫在裡面才抓得到資料
					activity.setJoinNum(t);
					Timestamp joinTime = new Timestamp(System.currentTimeMillis());
					join.setJoinTime(joinTime);
					joinService.save(join);
					activityService.update(activity); //要記得一起更新activity!!
				} catch (Exception ex) {
					System.out.println("請通知系統人員...");
					
					return "activity/join";
				}
				
		
				return "redirect:/activity/showAllActivities";
			}
			

//			// 刪除一筆紀錄
//			// 由這個方法刪除記錄...
			@PostMapping("/join2/{id}")
			public String deleteJoin(@PathVariable("id") Integer id) {
				
				Join join = joinService.get(id);
				

				try {
					
					Activity activity = activityService.get(join.getActivityId());
					Integer joinNum = activity.getJoinNum();
					Integer t = joinNum+1;
					//********似乎寫在裡面才抓得到資料
					activity.setJoinNum(t);
					activityService.update(activity); //要記得一起更新activity!!
				} catch (Exception ex) {
					System.out.println("請通知系統人員...");
					joinService.delete(id);
					return "activity/error2";
				}
				
				joinService.delete(id);
				return "redirect:/activity/queryJoinsByActMemberId";
			}
			
			// ############ 顯示個人活動資料
			@RequestMapping("/queryByActMemberId")
			public String getActMemberIdList(Model model,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
				MemberBean mb = (MemberBean) model.getAttribute("memberBean");
				if (mb == null) {
					return "redirect: " + context.getContextPath() + "/login";
				}

				Integer mbId = mb.getMemberId();
				List<Activity> list = activityService.getActivitiesByMemberId(mbId);
				model.addAttribute("actMemberIdList", list);
				return "activity/personal";}
				
			// ############ 顯示個人參加資料
			@RequestMapping("/queryJoinsByActMemberId")
			public String getJoinsByActMemberIdList(Model model,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
				MemberBean mb = (MemberBean) model.getAttribute("memberBean");
				if (mb == null) {
					return "redirect: " + context.getContextPath() + "/login";
				}

				Integer mbId = mb.getMemberId();
				List<Join> list = joinService.getJoinsByJoinMemberId(mbId);
				model.addAttribute("joins", list);
				return "activity/personal2";
			
			}
	
}
