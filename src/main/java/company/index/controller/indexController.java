package company.index.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import company.index.model.indexBean;
import company.index.service.indexService;
import company.member.model.MemberBean;

@Controller
@SessionAttributes({"memberBean","indexBean"})
public class indexController {
	@Autowired
	indexService service;
	@Autowired
	ServletContext context;


//	@RequestMapping("/index") //讀取所有產品測試
//	public String getmemberByDepart(Model model) {
//		List<indexBean> ib = service.getAllProducts();
//		model.addAttribute("indexBean", ib);
//
//		return "redirect: " + context.getContextPath() + "/";
//	}


	@GetMapping("/index/allindexUpdateDelete") // 後台show出全部商品
	public String allindexUpdateDeletelist(Model model, HttpServletRequest req) {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}

		List<indexBean> beans = service.getAllProducts();
		System.out.println(beans.toString());
		model.addAttribute("indexBean", beans);
		return "index/allindexUpdateDelete";
	}

	@GetMapping("/index/add1")
	public String getAddindex(Model model) {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}

		indexBean ib = new indexBean();
		model.addAttribute("indexBean", ib);

		return "index/addindex";
	}

	@PostMapping("/index/add1") // 新增一筆商品
	public String processAddNewProductForm(@ModelAttribute("indexBean") indexBean ib, BindingResult result,
			Model model) {
		
//		CheckaddProductVaildator validator=new CheckaddProductVaildator();
//		validator.validate(bb, result);
//		if (result.hasErrors()) {
//			return "shopping/addProduct";
//		}
	
		MultipartFile productImage = ib.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		ib.setIndexfileName(originalFilename);

		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				ib.setIndexImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常");
			}
		}
		ib.setIndexDate(new Timestamp(System.currentTimeMillis()));
      try {
    	  service.addindexpicture(ib);
	} catch (org.hibernate.exception.ConstraintViolationException e) {
		result.rejectValue("memberNumber", "", "商品已存在，請重新輸入");
		 return "index/addindex";
	} catch (Exception e) {
		result.rejectValue("memberNumber", "", "資料新增出現問題請洽系統人員");
	   System.out.println("新增品項有問題");
	   return "index/addindex";
	}
		

		return "redirect:/index/allindexUpdateDelete";
	}
//
	@GetMapping("/index/picture/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "\\resources\\images\\noimg01.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		indexBean bean = service.getindexId(id);
		if (bean != null) {
			Blob blob = bean.getIndexImage();
			filename = bean.getIndexfileName();
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

	@GetMapping("/index/sh/{id}")
	public String update(@PathVariable("id") Integer id, Model model) {
		indexBean indexBean = service.getindexId(id);
		model.addAttribute(indexBean);
		return "index/updateindex";
	}
//
	@PostMapping("/index/sh/{id}")
	public String modify(@ModelAttribute("indexBean") indexBean ib, BindingResult result, Model model,
			@PathVariable Integer id, HttpServletRequest request) {
		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		if (memberBean == null) {
			return "redirect: " + context.getContextPath() + "/login";
		}

		
//		CheckaddProductVaildator validator=new CheckaddProductVaildator();
//		validator.validate(ss, result);
//		if (result.hasErrors()) {
//			result.rejectValue("memberNumber", "", "資料更新出現問題請洽系統人員");
//			System.out.println("result hasErrors(), ShoppingBean=" + ss);
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println("更新有錯誤：" + error);
//			}
//			return "shopping/updateProduct";
//		}
		ib.setIndexId(id);
		MultipartFile productImage = ib.getProductImage();
		if (productImage.getSize() == 0) {
			indexBean original = service.getindexId(id);
			ib.setIndexImage(original.getIndexImage());
		} else {
			String originalFilename = productImage.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1)
				ib.setIndexfileName(originalFilename);
		}

		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				ib.setIndexImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常");
			}
		}
		try {
			service.update(ib);
		} catch (Exception e) {
			result.rejectValue("memberNumber", "", "資料新增出現問題請洽系統人員");
			System.out.println("更新有問題,請洽系統人員");
			 return "shopping/updateProduct";
		}
		

		return "redirect:/index/allindexUpdateDelete";
	}

	@RequestMapping("/index/sh1/{id}")
	public String delete(@ModelAttribute("indexBean") indexBean ib, @PathVariable("id") Integer id) {
		ib.setIndexId(id);
	
		service.delete(id);
		return "redirect:/index/allindexUpdateDelete";
	}

	@ModelAttribute("indexBean") // 先抓取圖檔避免更新會有空值
	public void getShoppingId(@PathVariable(value = "id", required = false) Integer id, Model model) {
		if (id != null) {
			indexBean indexBean = service.getindexId(id);
			model.addAttribute("indexBean", indexBean);
		} else {
			indexBean indexBean = new indexBean();
			model.addAttribute("indexBean", indexBean);
		}
	}
	




}
