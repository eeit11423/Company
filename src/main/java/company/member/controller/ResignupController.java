package company.member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import company.member.model.MemberBean;
import company.member.model.ResignBean;
import company.member.service.MemberSerivce;
import company.member.service.ResignSerivce;

@Controller
public class ResignupController {
	@Autowired
	MemberSerivce service;
	@Autowired
	ServletContext context;
	@Autowired
	ResignSerivce reservice;
	
	@RequestMapping("/Resignup")
	public String resignupmember(Model model) {
		List<ResignBean> rb = reservice.getAllResignMember();
		System.out.println("+++++++++++++++++++++++++++++++");
		System.out.println(rb);
		model.addAttribute("resign",rb);
		return "member/Resignup";
	}
	
	@GetMapping("/getPicture1/{id}")
	public ResponseEntity<byte[]> getPicture(Model model,HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "\\resources\\images\\noimg01.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		model.getAttribute("resign");
		System.out.println();
		ResignBean bean = reservice.getProduct1ById(id);
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

	@RequestMapping("/delect1/{id}")
	public String delete(@PathVariable("id") Integer id) {
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAA");
		System.out.println(id);
		List<ResignBean> rb = reservice.getOneMemberID(id);
		System.out.println(rb+"OOOOOOOOOOOOOOOOOOOOOOOO");
		ResignBean rBean = new ResignBean();
		
		service.saveId(rb);
		reservice.deleted(id);
		return "redirect:/Resignup";
	}

}
