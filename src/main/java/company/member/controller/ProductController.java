package company.member.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.xml.transform.Source;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sun.mail.handlers.image_gif;

import company.member.model.ForgetBean;
import company.member.model.LoginBean;
import company.member.model.MemberBean;
import company.member.model.ResignBean;
import company.member.service.MemberSerivce;
import company.member.service.ResignSerivce;
import company.member.validate.ChangePasswdValidator;
import company.member.validate.CheckaddVaildator;
import company.member.validate.ForgetPasswd;
import company.member.validate.LoginBeanValidator;

@Controller
@SessionAttributes("memberBean")
public class ProductController {
	private static final String ChangePasswd = null;
	@Autowired
	MemberSerivce service;
	@Autowired
	ServletContext context;
	@Autowired
	ResignSerivce reservice;

	@RequestMapping("/register")
	public String register(Model model) {
		return "index";
	}

	@RequestMapping("/members")
	public String list(Model model, HttpSession session) {
		try {
			MemberBean mb = (MemberBean) session.getAttribute("memberBean");
			System.out.println(mb.getMemberNumber());
			List<MemberBean> list = service.getAllMember();
			model.addAttribute("members", list);
			return "member/select";
		} catch (Exception e) {
			System.out.println("錯誤");
			return "redirect:/login";
		}

	}
	

	@RequestMapping("/test2")
	public String getmemberList(Model model) {
		List<String> list = service.getAllMembers();
		System.out.println("------**************");
		System.out.println(list);
		model.addAttribute("memberList", list);
		return "member/department";
	}

//	部門
	@RequestMapping("/members/{category}")
	public String getmemberByDepart(@PathVariable("category") String category, Model model) {
		List<MemberBean> department = service.getMember(category);
		model.addAttribute("members", department);
		System.out.println("部門");
		return "member/select";
	}

	// JSON 部門
	@RequestMapping("/membersdepart/{category}")
	public ResponseEntity<List<MemberBean>> queryAllmemberdepart(@PathVariable("category") String category,
			Model model) {
		List<MemberBean> department = service.getMember(category);
		ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(department, HttpStatus.OK);
		model.addAttribute("members", department);
		System.out.println("JSON 部門");
		return re;
	}

	@GetMapping("/register/add3")
	public String addnewProduct(Model model, HttpServletRequest request,
			@CookieValue(value = "MemberNumber", required = false) String user) {
		MemberBean mb = new MemberBean();

		model.addAttribute("memberbean", mb);
		return "member/addmember2";
	}

	@PostMapping("/register/add3")
	public String addnewproductform(@ModelAttribute("memberbean") MemberBean mb, Model model, BindingResult result) {
		MultipartFile productImage = mb.getProductImage();

		CheckaddVaildator validator = new CheckaddVaildator();
		validator.validate(mb, result);
		if (service.idExists(mb.getMemberNumber())) {
			result.rejectValue("memberNumber","","帳號已存在，請重新輸入");
			return "member/addmember2";
		}

		if (result.hasErrors()) {
			return "member/addmember2";
		} else {

			String originalFilename = productImage.getOriginalFilename();
			mb.setMemberfilename(originalFilename);
			if (productImage != null && !productImage.isEmpty()) {
				try {
					byte[] b = productImage.getBytes();
					Blob blob = new SerialBlob(b);
					mb.setMemberPicture1(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常");
				}
			}
			mb.setMemberRegisterDate(new Timestamp(System.currentTimeMillis()));
			service.saveMember(mb);
			return "redirect:/register/add3";
		}
	}
	
	
	@GetMapping("/getPicture/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "\\resources\\images\\noimg01.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		MemberBean bean = service.getProductById(id);
		if (bean != null) {
			Blob blob = bean.getMemberPicture1();
			filename = bean.getMemberfilename();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("發生錯誤" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}

		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediatype" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);
		return responseEntity;

	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	@RequestMapping("/delect/{id}")
	public String delete(@PathVariable("id") Integer id) {
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAA");
		System.out.println(id);
		List<MemberBean> mb = service.getOneMemberID(id);
		System.out.println(mb+"OOOOOOOOOOOOOOOOOOOOOOOO");
		ResignBean rBean = new ResignBean();
		
		reservice.saveId(mb);
		service.deleted(id);
		return "redirect:/members";
	}

	// 修改
	@GetMapping("/update/{id}")
	public String showDataForm(@PathVariable("id") Integer id, Model model) {
		MemberBean memberbean = service.getProductById(id);

		model.addAttribute("member", memberbean);
		return "member/update";
	}

	@PostMapping("/update/{id}")
	public String updatememberform(@ModelAttribute("member") MemberBean mb, Model model,@PathVariable("id") Integer id,
			HttpServletRequest request) {
		mb.setMemberId(mb.getMemberId());

		MultipartFile productImage = mb.getProductImage();

		if (productImage.getSize() == 0) {

		} else {
			String originalFilename = productImage.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				mb.setMemberfilename(originalFilename);
			}

			if (productImage != null && !productImage.isEmpty()) {
				try {
					byte[] b = productImage.getBytes();
					Blob blob = new SerialBlob(b);
					mb.setMemberPicture1(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常");
				}
			}
		}
		service.updateMember(mb);
		return "redirect:/personal/{id}";
	}

	@GetMapping("/login")
	public String LoginContext(HttpServletRequest request, Model model,
			@CookieValue(value = "user", required = false) String user,
			@CookieValue(value = "password", required = false) String password,
			@CookieValue(value = "rm", required = false) Boolean rm) {
		if (user == null)
			user = "";
		if (password == null) {
			password = "";
		}
		if (rm != null) {
			rm = Boolean.valueOf(rm);
		} else {
			rm = false;
		}
		LoginBean lb = new LoginBean(user, password, rm);
		model.addAttribute("loginBean", lb);

		return "member/login";
	}

	@PostMapping("/login")
	public String LoginContextCheck(@ModelAttribute("loginBean") LoginBean lb, Model model, BindingResult result,
			HttpServletRequest request, HttpServletResponse response) {

		MemberBean mmm = service.login(lb.getUserId(), lb.getPassword());

		LoginBeanValidator validator = new LoginBeanValidator();
		validator.validate(lb, result);
		if (result.hasErrors()) {

			return "member/login";
		} else if (mmm == null) {
			result.rejectValue("invalidCredentials", "", "*該帳號不存在或密碼錯誤");
			return "member/login";
		} else {
			model.addAttribute("memberBean", mmm);
			mmm = (MemberBean) model.getAttribute("memberBean");
			if (mmm.getMemberPassword().equals("1234")) {
				processCookies(lb, request, response);
				return "redirect:/updatee/"+mmm.getMemberId()+"";
			}else if(mmm.getMemberPassword().equals("@8M75K")) {
				return "redirect:/updatepasswd/"+mmm.getMemberId()+"";
			}
			else {
				processCookies(lb, request, response);
			return "redirect:/";
			}			
		}
	}

	private void processCookies(LoginBean bean, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		String userId = bean.getUserId();
		String password = bean.getPassword();
		Boolean rm = bean.isRememberMe();

		// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
		if (rm) {
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(7 * 24 * 60 * 60); // Cookie的存活期: 七天
			cookieUser.setPath(request.getContextPath());

			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(request.getContextPath());
		} else { // 使用者沒有對 RememberMe 打勾
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookieUser.setPath(request.getContextPath());

			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);

	}

	public void Gmailsend(String email) {
		System.out.println("email");
		System.out.println(email);
		String host = "smtp.gmail.com";
		int port = 587;
		String username = "lintest546@gmail.com";
		String password = "0928103546";// your password
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		String div = "忘記密碼， 您的密碼已預設成，"+"<h2 style='color:red'>"+"@8M75K"+"</h2>"+"，請登入後修改密碼";
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("lintest546@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject("忘記密碼.");
			message.setContent(div,"text/html;charset=UTF-8");

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);
			Transport.send(message);
			System.out.println("HIHIHI");
		} catch (MessagingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
//		return "redirect:/";
	}

	// 更新方法
	@ModelAttribute
	public void getMember(@PathVariable(value = "id", required = false) Integer id, Model model) {
		System.out.println("@model.getMemeber");
		if (id != null) {
			MemberBean member = service.getProductById(id);
			model.addAttribute("member", member);
		}
	}

	// 分類部門查詢
	@ModelAttribute("memberList")
	public List<String> getCatrgoryList() {
		return service.getAllMembers();
	}

	@RequestMapping("loginout")
	public String getLogOut(SessionStatus status) {
		System.out.println("執行session,setComplete();");
		System.out.println("以登出");
		status.setComplete();
		return "redirect:/";
	}

	@GetMapping("/forgetpwd")
	public String forgetpwd(Model model, HttpServletRequest request) {
		ForgetBean mb1 = new ForgetBean();
		model.addAttribute("forgot", mb1);
		return "member/forget";
	}

	@PostMapping("/forgetpwd")
	public String forgotpwds(@ModelAttribute("forgot") ForgetBean mb, Model model, BindingResult result,
			HttpServletRequest request, HttpServletResponse response) {
		List<String> list = service.seachMemberaccount();
		ForgetPasswd validator = new ForgetPasswd();
		validator.validate(mb, result);

		if (list.contains(mb.getMemberEmail())) {
			System.out.println("有");
			try {
				Gmailsend(mb.getMemberEmail());
			} catch (Exception e) {
				e.printStackTrace();
				return "member/error";
			}
			
			service.updatePasswd(mb.getMemberEmail());
			return "redirect:/login";
		} else {
			result.rejectValue("invalidCredentials", "", "該帳號不存在");
			return "member/forget";
		}
//		return "index";
	}
// 第一次登入修改	
	@GetMapping("/updatee/{id}")
	public String showDataForm2(@PathVariable("id") Integer id, Model model) {
		MemberBean memberbean = service.getProductById(id);

		model.addAttribute("member", memberbean);
		return "member/firstlogin";
	}

	@PostMapping("/updatee/{id}")
	public String updatememberform2(@ModelAttribute("member") MemberBean mb, Model model, @PathVariable Integer id,
			HttpServletRequest request) {
		mb.setMemberId(id);

		MultipartFile productImage = mb.getProductImage();

		if (productImage.getSize() == 0) {

		} else {
			String originalFilename = productImage.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				mb.setMemberfilename(originalFilename);
			}

			if (productImage != null && !productImage.isEmpty()) {
				try {
					byte[] b = productImage.getBytes();
					Blob blob = new SerialBlob(b);
					mb.setMemberPicture1(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常");
				}
			}
		}
		service.updateMember(mb);
		return "redirect:/";
	}
	
//更改密碼
	
	@GetMapping("/updatepasswd/{id}")
	public String ChangePasswd(@PathVariable("id") Integer id,Model model) {
		System.out.println("=============");
		System.out.println(id);
		MemberBean mb = new MemberBean();
		model.addAttribute("changepwd",mb);
		return "member/ChangePasswd" ;
	}
	@PostMapping("/updatepasswd/{id}")
	public String ChangePasswdShow(@ModelAttribute("changepwd") MemberBean mb, Model model,BindingResult result,@PathVariable("id") Integer id) {
		System.out.println(id);
		ChangePasswdValidator validator = new ChangePasswdValidator();
		validator.validate(mb, result);
		if (result.hasErrors()) {
			return "member/ChangePasswd";
		}
		boolean check;
		check = service.CheckPassword(mb.getMemberPassword(),mb.getMemberNewPassword(), id);
		if (check == true) {
			return "redirect:/";
		}
		else {
			result.rejectValue("memberPassword", "", "*該舊密碼不存在或密碼錯誤");
			return "member/ChangePasswd";
		}
	}
	
	
//會員資料修改
	@GetMapping("/personalUpdate/{id}")
	public String showDataPersonal(@PathVariable("id") Integer id, Model model) {
		return "member/updateyouself";
	}

	@PostMapping("/personalUpdate/{id}")
	public String updatememberPersonal(@ModelAttribute("member") MemberBean mb, Model model, @PathVariable Integer id,
			HttpServletRequest request) {
		mb.setMemberId(id);

		MultipartFile productImage = mb.getProductImage();

		if (productImage.getSize() == 0) {

		} else {
			String originalFilename = productImage.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				mb.setMemberfilename(originalFilename);
			}

			if (productImage != null && !productImage.isEmpty()) {
				try {
					byte[] b = productImage.getBytes();
					Blob blob = new SerialBlob(b);
					mb.setMemberPicture1(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常");
				}
			}
		}
		service.updateMember(mb);
		return "redirect:/personal";
	}
	
	
	@RequestMapping("/personal/{id}")
	public String showallpersonal(@PathVariable Integer id,Model model ,HttpSession session) {
		MemberBean mb = service.getProductById(id);
		List<MemberBean> list = service.getOneMember(mb.getMemberNumber());
		model.addAttribute("onemember", list);
		
		return "member/personal2";
	}	
	
	@RequestMapping("/showpersonal/{id}")
	public String show(@PathVariable Integer id,Model model ,HttpSession session) {
		
		try {
			MemberBean mb = (MemberBean) session.getAttribute("memberBean");
			System.out.println(mb.getMemberNumber());
			List<MemberBean> list = service.getOneMember(mb.getMemberNumber());
			model.addAttribute("onemember", list);
			System.out.println(list);
			MemberBean memberbean = service.getProductById(mb.getMemberId());
			model.addAttribute("member", memberbean);
			return "member/personal";
		} catch (Exception e) {
			System.out.println("錯誤");
			return "redirect:/login";
//			return "redirect: " + context.getContextPath() + "/login";
		}
	}	
	@PostMapping("/showpersonal/{id}")
	public String updatememberform1(@ModelAttribute("member") MemberBean mb, Model model, @PathVariable Integer id,
			HttpServletRequest request) {
		System.out.println(id);
		System.out.println(mb.getMemberId());
		System.out.println("+++++++++++++++++++++showpersonal");
		mb.setMemberId(mb.getMemberId());

		MultipartFile productImage = mb.getProductImage();

		if (productImage.getSize() == 0) {

		} else {
			String originalFilename = productImage.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				mb.setMemberfilename(originalFilename);
			}

			if (productImage != null && !productImage.isEmpty()) {
				try {
					byte[] b = productImage.getBytes();
					Blob blob = new SerialBlob(b);
					mb.setMemberPicture1(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常");
				}
			}
		}
		service.updateMember(mb);
		return "redirect:/showpersonal/"+mb.getMemberId()+"";
	}
	
	@RequestMapping(value="test",method =RequestMethod.GET)
	public String getaaaa1() {
		
		return "member/test";
	}
	
	@RequestMapping(value="/register/test",method = RequestMethod.POST)
	public String getaaaa(@RequestParam("uploadFile")MultipartFile tfile,HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("=================================================JIJIJI");
		    request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        //判斷文件是否爲空
	        if(tfile==null) {
	        	System.out.println("NULL+");
	        }else {
	        	System.out.println("file="+tfile);
			} //把spring文件上傳的MultipartFile轉換成CommonsMultipartFile類型
	        
	        CommonsMultipartFile cf= (CommonsMultipartFile)tfile; //獲取本地存儲路徑
	        File file = new  File("C:\\fileupload");
	        //創建一個目錄 （它的路徑名由當前 File 對象指定，包括任一必須的父路徑。）
	        if (!file.exists()) file.mkdirs();
	        //新建一個文件
	       
	        File file1 = new File("C:\\fileupload\\" +"test" + ".csv");
	        //將上傳的文件寫入新建的文件中
	        try {
	            cf.getFileItem().write(file1);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        MemberBean bean = new MemberBean();
	    	try (InputStreamReader isr = new InputStreamReader(new FileInputStream("C://fileupload/test.csv"));
					BufferedReader reader = new BufferedReader(isr)) {
				ArrayList<String> list1 = new ArrayList<String>();
				String line = null;
				reader.readLine();
				while ((line = reader.readLine()) != null) {
					System.out.println("++++++++++++++++++++++++++++++++++");
					System.out.println(line);
					String item[] = line.split(",");
					
					for (int i = 0; i < item.length; i++) {
						list1.add(item[i].trim());
					}
					MemberBean mb = new MemberBean();
					mb.setMemberNumber(list1.get(1));
					mb.setMemberPassword(list1.get(2));
					mb.setMemberName(list1.get(3));
					mb.setMemberDepartment(list1.get(4));
					mb.setMemberPerformance(list1.get(5));
					mb.setMemberAdmin(list1.get(6));
					mb.setMemberSalary(Integer.valueOf(list1.get(7)));
					mb.setMemberGender(list1.get(8));
					mb.setMemberAddress(list1.get(9));
					mb.setMemberPhone(list1.get(10));
					mb.setMemberBirthdaay(list1.get(11));
					mb.setMemberEmail(list1.get(12));
					service.updateMember(mb);
					System.out.println("HIHIHI+++++++++++++++");
//					service.updateCsv(list1.get(0), list1.get(1), list1.get(2), list1.get(3));
					list1.clear();
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("error");
			}

		return "redirect:/register/add3";
	}
	@RequestMapping(value = "downloadExcel", method = RequestMethod.GET)
	public void downloadExcel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("in downloadExcel");
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("Datatypes in Java");
		List<MemberBean> list = service.getAllMember();
		System.out.println(list.size());
		int x = list.size();
		System.out.println(list);
		System.out.println(list.get(0));
		System.out.println(list.get(0).getMemberNumber());
		int n = 0;
		Map<Integer,MemberBean> map = new LinkedHashMap<Integer, MemberBean>();
		for (int i = 0 ; i < x ; i++) {
			map.put(i, list.get(i));
		}
		System.out.println(map);
		Row row = null;
		Cell cell = null;
		for(int r = 0; r < 1; r++){
		    row = sheet.createRow(r);
		    for(int c = 0; c <14; c++){
		    	cell = row.createCell(c);
		    	 switch (c) {
					case 0:
						cell.setCellValue("");
						break;
					case 1:
						cell.setCellValue("員工編號");
						break;
					case 2:
						cell.setCellValue("員工姓名");
						break;
					case 3:
						cell.setCellValue("員工密碼");
						break;
					case 4:
						cell.setCellValue("員工地址");
						break;
					case 5:
						cell.setCellValue("員工身分");
						break;
					case 6:
						cell.setCellValue("員工電話");
						break;
					case 7:
						cell.setCellValue("員工生日");
						break;
					case 8:
						cell.setCellValue("員工薪資");
						break;
					case 9:
						cell.setCellValue("員工性別");
						break;
					case 10:
						cell.setCellValue("員工信箱");
						break;
					case 11:
						cell.setCellValue("員工部門");
						break;
					case 12:
						cell.setCellValue("到職日期");
						break;
					case 13:
						cell.setCellValue("照片檔名");
						break;
		    }
		}
		    	
		}
		for(int r = 1; r <= x; r++){
		    row = sheet.createRow(r);
		    for(int c = 0; c < 14; c++){
		        cell = row.createCell(c);
		        switch (c) {
				case 0:
					cell.setCellValue((map.get(r-1)).getMemberId());
					break;
				case 1:
					cell.setCellValue((map.get(r-1)).getMemberNumber());
					break;
				case 2:
					cell.setCellValue((map.get(r-1)).getMemberName());
					break;
				case 3:
					cell.setCellValue((map.get(r-1)).getMemberPassword());
					break;
				case 4:
					cell.setCellValue((map.get(r-1)).getMemberAddress());
					break;
				case 5:
					cell.setCellValue((map.get(r-1)).getMemberAdmin());
					break;
				case 6:
					cell.setCellValue((map.get(r-1)).getMemberPhone());
					break;
				case 7:
					cell.setCellValue((map.get(r-1)).getMemberBirthdaay());
					break;
				case 8:
					cell.setCellValue((map.get(r-1)).getMemberSalary());
					break;
				case 9:
					cell.setCellValue((map.get(r-1)).getMemberGender());
					break;
				case 10:
					cell.setCellValue((map.get(r-1)).getMemberEmail());
					break;
				case 11:
					cell.setCellValue((map.get(r-1)).getMemberDepartment());
					break;
				case 12:
					cell.setCellValue((map.get(r-1)).getMemberRegisterDate());
					break;
				case 13:
					cell.setCellValue((map.get(r-1)).getMemberfilename());
					break;
//				case 14:
//					cell.setCellValue((map.get(r)).getMemberPicture1());
//					break;
//				case 15:
//					cell.setCellValue((map.get(r)).getProductImage());
//					break;
//				case 16:
//					cell.setCellValue((map.get(r)).getMemberNumber());
//					break;
				default:
					break;
				}
		    }
		}
		String filename = "會員訂單報表.xlsx";
		String headerFileName = new String(filename.getBytes(), "ISO8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=" + headerFileName);
		OutputStream out = null;
		try {
			out = new BufferedOutputStream(response.getOutputStream());
			workbook.write(out);
		} catch (IOException e) {
			System.out.println("excel匯出有誤");
		} finally {
			try {
				out.close();
				workbook.close();
			} catch (IOException e) {
				System.out.println("讀取內容有誤");
			}
		}
	}

	// JSON 全部
//	@RequestMapping("/memberjson")
//	public ResponseEntity<List<MemberBean>>alllist() {
//			List<MemberBean> list = service.getAllMember();
//			ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(list,HttpStatus.OK);
//			System.out.println("JSON 全部");
//			return re;
//
//	}
//	@GetMapping("test3")
//	public String getaaaa() {
//		return "department";
//	}

//	@RequestMapping(value = "/members")
//	public ResponseEntity<List<MemberBean>> queryAllmemberforJson(Model model) {
//		List<MemberBean> mBeans = service.getAllMember();
//		ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(mBeans, HttpStatus.OK);
//		return re;
//	}

}
