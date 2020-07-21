package company.train.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import company.train.model.CompanyBean;
import company.train.model.RosterBean;
import company.train.model.TrainingBean;
import company.train.service.ProductService;

@Controller
public class TrainingController {
	@Autowired
	ProductService service;
	@Autowired
	ServletContext ctx;
	@Autowired
	ServletContext context;
	

	@Autowired
	public void setService(ProductService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/{trainingId}", method = RequestMethod.GET)
	public String oneproduct(@PathVariable("trainingId") Integer trainingId, Model model){
		 TrainingBean products = service.getProductById(trainingId);
		model.addAttribute("product", products);
		return "/train/product";
	}
	
	
	@RequestMapping("/train/trainAllProducts")//所有課程
	public String list(Model model) {
		List<TrainingBean> list = service.getAllProducts();
		model.addAttribute("trainAllProducts",list);
		return "/train/trainAllProducts";
	}
	@ModelAttribute("CategoryList")
	public List<String> getcategory(){
		System.out.println("=======================");
		System.out.println("Hello");
		List<String> ssString = service.getAllCategories();
		System.out.println(ssString);
		return ssString ; 	
	}
	@RequestMapping("/queryByCategory")
	public String getCategoryList(Model model) {
		List<String>  list = service.getAllCategories();
		model.addAttribute("categoryList", list);
		return "types/category";
	}
	@RequestMapping("/productss/{category}")
	public String getProductsByCategory(@PathVariable("category") String category, Model model){
		List<TrainingBean> productss = service.getProductsByCategory(category);
		model.addAttribute("productss", productss);
		return "productss";
	}
	@RequestMapping("train/trainproduct/{id}")
	public String getProductById(@PathVariable("id") Integer id, Model model){
		System.out.println("++++++++++++++++++++++++++=");
		System.out.println("HAHA");
		System.out.println("+++++++++++++++++++++++++++++++");
		model.addAttribute("product", service.getProductById(id));
		return "train/trainproduct";
	}
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
	@GetMapping("/getTrainPicture/{trainingId}")
	public ResponseEntity<byte[]>  getPicture(HttpServletRequest req, 
											  @PathVariable Integer trainingId){
		String noImagePath = "\\resources\\images\\NoImage.jpg";
		ResponseEntity<byte[]> re = null;
		TrainingBean bean = service.getProductById(trainingId);
		
		ByteArrayOutputStream baos = null;
		InputStream is = null;
		try {
			Blob blob = bean.getPictureFile();
			if (blob != null) {
				is = blob.getBinaryStream();
			} else {
				;
			}
			if (is == null) {
				is = ctx.getResourceAsStream(noImagePath);
			}
			baos = new ByteArrayOutputStream(); 
			int len = 0;
			byte[] b = new byte[819200];
			while ((len= is.read(b))!= -1) {
				baos.write(b, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		byte[] b0 = baos.toByteArray();
		
		String Strfilename = bean.getPictureName();
		String mimeType = null;
		MediaType mediaType = null;
		if ( Strfilename != null) {
			mimeType = ctx.getMimeType(Strfilename);
//			mediaType = MediaType.valueOf(mimeType);
		} else {
			mimeType = ctx.getMimeType(noImagePath);
//			mediaType = MediaType.valueOf(mimeType);
		}
		mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<>(b0, headers, HttpStatus.OK);
		return re;
	}
	//如下為空白表單
	@RequestMapping(value = "/trainProduct/add", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		TrainingBean bb = new TrainingBean();
	    model.addAttribute("trainingBean", bb); 
	    return "train/addTrainProduct";
	}
	
	@RequestMapping(value = "/trainProduct/add", method = RequestMethod.POST)
	public String processAddNewProductFormTrain(@ModelAttribute("trainingBean") TrainingBean bb, BindingResult result) {

		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
//		if (bb.getStock() == null) {
//			bb.setStock(0);
//		}
		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setpictureName(originalFilename);
		//  建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty() ) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setPictureFile(blob);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		service.addProduct(bb);
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists()) imageFolder.mkdirs();
			File file = new File(imageFolder, bb.getTrainingId() + ext);
			productImage.transferTo(file);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		return "redirect:/train/trainAllProducts";
	}
	
	@ModelAttribute("companyList")
	public Map<Integer, String> getCompanyList(){
		 Map<Integer, String> companyMap = new HashMap<>();
		 List<CompanyBean>  list = service.getCompanyList();
		 for(CompanyBean cb : list) {
			 companyMap.put(cb.getId(), cb.getName());
		 }
		return companyMap;
	}
	
	
	@GetMapping("train/deleteTrain/{trainingId}")
	public String delete(@PathVariable ("trainingId") Integer trainingId) {
		System.out.println("");
		service.delete(trainingId);	

		return "redirect:/train/trainAllProducts"; //
	}
	
	@GetMapping("train/updateTrain/{trainingId}")
	public String showDataForm(@PathVariable("trainingId") Integer trainingId, Model model) {
		TrainingBean trainingbean = service.getProductById(trainingId);
		model.addAttribute("updatePic",trainingbean);
		return "train/update";
	}
	@PostMapping("train/updateTrain/{trainingId}")
	public String modify(
			@ModelAttribute("updatePic")  TrainingBean tb, //這邊的updatePic是從
			BindingResult result, 
			Model model,
			@PathVariable Integer trainingId, 
			HttpServletRequest request) {
		
		tb.setTrainingId(trainingId);//////////更新不設定圖片會顯示NULL
		MultipartFile productImage = tb.getProductImage();
		if (productImage.getSize() == 0) {
		} else {
			String originalFilename = productImage.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				tb.setpictureName(originalFilename);
			}
			if (productImage != null && !productImage.isEmpty()) {
				try {
					byte[] b = productImage.getBytes();
					Blob blob = new SerialBlob(b);
					tb.setPictureFile(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常");
				}
			}
		}
		service.updateTraining(tb);		
		return "redirect:/train/trainAllProducts";
	}
	
	// 更新方法
		@ModelAttribute
		public void getTraining(@PathVariable(value = "trainingId", required = false) Integer trainingId, Model model) {
			if (trainingId != null) {
				TrainingBean training = service.getProductById(trainingId);
				model.addAttribute("updatePic", training);//updatePic 為預設值可做更改其他地' 也要做改動
			}
		}
		
//		@RequestMapping(value="/rosters",method=RequestMethod.GET)
//		public String getAddstar(Model model) {
//			RosterBean rb = new RosterBean();
//			model.addAttribute("rosterBean",rb);
//			return "rosters";
//		}
		
		@RequestMapping("/score")
		public String getAllStar(HttpServletRequest request, Model model) {
			
			String rosterStr1 	= request.getParameter("question1");
			String rosterStr2 	= request.getParameter("question2");
			String rosterStr3 	= request.getParameter("question3");
			String rosterStr4 	= request.getParameter("question4");
			String rosterStr5 	= request.getParameter("question5");

//			System.out.println(rosterStr1+"============================a");
			int starsum1 = Integer.parseInt(rosterStr1.trim());
			int starsum2 = Integer.parseInt(rosterStr2.trim());
			int starsum3 = Integer.parseInt(rosterStr3.trim());
			int starsum4 = Integer.parseInt(rosterStr4.trim());
			int starsum5 = Integer.parseInt(rosterStr5.trim());
			int star = starsum1+starsum2+starsum3+starsum4+starsum5;
			int id = 1 ; 
			service.addscore(star, id);
			return "index";
		}
}

