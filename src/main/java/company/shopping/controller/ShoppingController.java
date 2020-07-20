package company.shopping.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import company.member.model.MemberBean;
import company.shopping.model.ShoppingBean;
import company.shopping.service.ShoppingService;



@Controller
@SessionAttributes({ "ShoppingCart", "memberBean", "shoppingBean","AllShoppingType" })
public class ShoppingController {
	@Autowired
	ShoppingService service;
	@Autowired
	ServletContext context;

	@GetMapping("/shopping/oneProduct")
	public String oneProduct(@RequestParam("id") Integer id, Model model) {
		ShoppingBean shoppingBean = service.getshoppingId(id);
		model.addAttribute("shoppingBean", shoppingBean);
		return "shopping/oneProduct";
	}
	
	@RequestMapping("/shoppingChange")
	public String getmemberByDepart(Model model) {	
		List<ShoppingBean> st = service.getALLShoppingType();
				model.addAttribute("shoppingType", st);
		
		return "shopping/shoppingChange";}
	@RequestMapping("/shoppingChange1")
	public String getmemberByDepart1(Model model) {	
		List<ShoppingBean> st = service.getALLShoppingType();
				model.addAttribute("shoppingType", st);
		
		return "shopping/shoppingChange1";}
	

	@RequestMapping("/shopping/{shoppingType1}") // 商品類型分類JSON
	public ResponseEntity<List<ShoppingBean>> getAllProductsJson(Model model,
			@PathVariable("shoppingType1") String shoppingType1, HttpServletRequest req) {
		System.out.println(shoppingType1);
		List<ShoppingBean> st = service.getshoppingType(shoppingType1);
		ResponseEntity<List<ShoppingBean>> re = new ResponseEntity<>(st, HttpStatus.OK);
		model.addAttribute("shoppingType", st);
		return re;
	}

	@GetMapping("/shopping/allProducts") // show出全部商品
	public String list(Model model, HttpServletRequest req) {
		List<ShoppingBean> beans = service.getAllProducts();
		model.addAttribute("products", beans);
		return "shopping/allProducts";
	}
	
	@GetMapping("/shopping/allProductsUpdateDelete") // 後台show出全部商品
	public String allProductsUpdateDeletelist(Model model, HttpServletRequest req) {
		List<ShoppingBean> beans = service.getAllProducts();
		model.addAttribute("products", beans);
		return "shopping/allProductsUpdateDelete";
	}

	@GetMapping("/products/add")
	public String getAddNewProductForm(Model model) {
		ShoppingBean bb = new ShoppingBean();
		model.addAttribute("shoppingBean", bb);

		return "shopping/addProduct";
	}

	@PostMapping("/products/add") //新增一筆商品
	public String processAddNewProductForm(@ModelAttribute("shoppingBean") ShoppingBean bb, BindingResult result,
			Model model) {
		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setShoppingfileName(originalFilename);

		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setShoppingProductImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常");
			}
		}
		bb.setShoppingDate(new Timestamp(System.currentTimeMillis()));

		service.addProduct(bb);
		return "redirect:/shopping/allProductsUpdateDelete";
	}

	@GetMapping("/shopping/picture/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "\\resources\\images\\noimg01.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ShoppingBean bean = service.getshoppingId(id);
		if (bean != null) {
			Blob blob = bean.getShoppingProductImage();
			filename = bean.getShoppingfileName();
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

	@GetMapping("/shopping/sh/{id}")   
	public String update(@PathVariable("id") Integer id, Model model) {
		ShoppingBean shoppingBean = service.getshoppingId(id);
		model.addAttribute(shoppingBean);
		return "shopping/updateProduct";
	}

	@PostMapping("/shopping/sh/{id}")
	public String modify(@ModelAttribute("shoppingBean") ShoppingBean ss, BindingResult result, Model model,
			@PathVariable Integer id, HttpServletRequest request) {
		ss.setShoppingId(id);
		MultipartFile productImage = ss.getProductImage();
			if (productImage.getSize() == 0) {
			ShoppingBean original = service.getshoppingId(id);
			ss.setShoppingProductImage(original.getShoppingProductImage());
		} else {
			String originalFilename = productImage.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) 
				ss.setShoppingfileName(originalFilename);
			}
		
		
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				ss.setShoppingProductImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常");
			}
		}
		service.update(ss);

		return "redirect:/shopping/allProductsUpdateDelete";
	}

	@RequestMapping("/shopping/sh1/{id}")
	public String delete(@ModelAttribute("shoppingBean") ShoppingBean ss,@PathVariable("id") Integer id) {
		ss.setShoppingId(id);
		System.out.println("刪除ID====================="+id);
		service.delete(id);
		return "redirect:/shopping/allProductsUpdateDelete";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		dateFormat.setLenient(false);
		CustomDateEditor ce = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, ce);
		// java.sql.Date
		DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat2.setLenient(false);
		CustomDateEditor ce2 = new CustomDateEditor(dateFormat2, true);
		binder.registerCustomEditor(java.sql.Date.class, ce2);

	}
	
	
	@GetMapping("/shopping/AllProductsNewtoOld") // show出全部商品新到舊
	public String AllProductsNewtoOld(Model model, HttpServletRequest req) {
		List<ShoppingBean> beans = service.getAllProductsNewtoOld();
		model.addAttribute("products", beans);
		return "shopping/allProducts";
	}
	@GetMapping("/shopping/AllProductsPriceLowtoHigh") // show出全部商品價格低到高
	public String AllProductsPriceLowtoHigh(Model model, HttpServletRequest req) {
		List<ShoppingBean> beans = service.getAllProductsPriceLowtoHigh();
		model.addAttribute("products", beans);
		return "shopping/allProducts";
	}
	@GetMapping("/shopping/AllProductsPriceHightoLow") // show出全部商品價格高到低
	public String AllProductsPriceHightoLow(Model model, HttpServletRequest req) {
		List<ShoppingBean> beans = service.getAllProductsPriceHightoLow();
		model.addAttribute("products", beans);
		return "shopping/allProducts";
	}
	
	

@ModelAttribute("shoppingBean") //先抓取圖檔避免更新會有空值
	public void getShoppingId(@PathVariable(value = "id", required = false) Integer id, Model model) {
		if (id != null) {
			ShoppingBean shoppingBean = service.getshoppingId(id);
			model.addAttribute("shoppingBean", shoppingBean);
		} else {
			ShoppingBean shoppingBean = new ShoppingBean();
			model.addAttribute("shoppingBean", shoppingBean);
		}
	}
	
	@ModelAttribute("AllShoppingType")
	public List<ShoppingBean> getALLShoppingType(){
		return service.getALLShoppingType();
	}


}
