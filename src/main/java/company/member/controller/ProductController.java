package company.member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import company.member.model.LoginBean;
import company.member.model.MemberBean;
import company.member.service.MemberSerivce;
import company.member.validate.LoginBeanValidator;



@Controller
@SessionAttributes("memberBean")
public class ProductController {
	@Autowired
	MemberSerivce service;
	@Autowired
	ServletContext context;

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
			return "select";
		} catch (Exception e) {
			System.out.println("錯誤");
			return "redirect:/login";
		}

	}
//	@RequestMapping("/members")
//	public String list(Model model, HttpSession session) {
//			List<MemberBean> list = service.getAllMember();
//			model.addAttribute("members", list);
//			return "select";
//
//	}
//	@RequestMapping("/test2")
//	public String getmemberList(Model model) {
//		List<String> list = service.getAllMembers();
//		System.out.println("------**************");
//		System.out.println(list);
//		model.addAttribute("memberList",list);
//		return "types/category";
//	}
	
	@RequestMapping("/members/{category}")
	public String getmemberByDepart(@PathVariable("category") String category,Model model) {	
		List<MemberBean> department = service.getMember(category);
		model.addAttribute("members",department);
		return "select";
	}

//	@RequestMapping(value = "/members")
//	public ResponseEntity<List<MemberBean>> queryAllmemberforJson(Model model) {
//		List<MemberBean> mBeans = service.getAllMember();
//		ResponseEntity<List<MemberBean>> re = new ResponseEntity<>(mBeans, HttpStatus.OK);
//		return re;
//	}

	@GetMapping("/register/add")
	public String addnewProduct(Model model, HttpServletRequest request,
			@CookieValue(value = "MemberNumber", required = false) String user) {
		MemberBean mb = new MemberBean();
		model.addAttribute("memberbean", mb);
		return "register";
	}

	@PostMapping("/register/add")
	public String addnewproductform(@ModelAttribute("memberbean") MemberBean mb, Model model) {
		MultipartFile productImage = mb.getProductImage();
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
		service.saveMember(mb);
		return "redirect:/members";
	}

	@GetMapping("/getPicture/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "\\resources\\images\\noimg01.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		MemberBean bean = service.getProductById(id);
		System.out.println("========="+service.getProductById(id));
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
		System.out.println(id);

		service.deleted(id);
		return "redirect:/members";
	}

	// 修改
	@GetMapping("/update/{id}")
	public String showDataForm(@PathVariable("id") Integer id, Model model) {
		MemberBean memberbean = service.getProductById(id);

		model.addAttribute("member", memberbean);
		return "update";
	}

	@PostMapping("/update/{id}")
	public String updatememberform(@ModelAttribute("member") MemberBean mb, Model model, @PathVariable Integer id,
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
		return "redirect:/members";
	}

	@GetMapping("login")
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
		LoginBean mb = new LoginBean(user, password, rm);
		model.addAttribute("memberBeans", mb);

		return "login";
	}

	@PostMapping("login")
	public String LoginContextCheck(@ModelAttribute("memberBeans") LoginBean mb, Model model,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		
		MemberBean mmm = service.login(mb.getUserId(), mb.getPassword());
		
		LoginBeanValidator validator = new LoginBeanValidator();	
		validator.validate(mmm, result);
		if (result.hasErrors()) {

			return "login";
		}
		if (mmm == null) {
			return "redirect:/login";
		} else {
			model.addAttribute("memberBean", mmm);
			mmm = (MemberBean) model.getAttribute("memberBean");
//			if (mmm.getMemberPassword().equals("1234")) {
//				return "firstlogin";
//			}
			processCookies(mb, request, response);
			return "index";
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

	@RequestMapping("test")
	public String Gmailsend() {
		System.out.println("email");
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

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("lintest546@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("k0928103546@gmail.com"));
			message.setSubject("測試寄信.");
			message.setText("妹妹哈搂, \n\n 測試 測試 測試 測試 測試 測試 email !");

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);
			Transport.send(message);
			System.out.println("HIHIHI");
		} catch (MessagingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return "redirect:/";
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
	//分類查詢
	@ModelAttribute("memberList")
	public List<String> getCatrgoryList(){
		return service.getAllMembers();
	}

	@RequestMapping("loginout")
	public String getLogOut(SessionStatus status) {
		System.out.println("執行session,setComplete();");
		System.out.println("以登出");
		status.setComplete();
		return "redirect:/";
	}

}
