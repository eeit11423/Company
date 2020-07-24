package company.shopping.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import company.member.model.MemberBean;
import company.shopping.model.ShoppingBean;

public class CheckaddProductVaildator implements Validator {

	private static final Integer Integer = null;
	
	boolean insertMode = true;
	
	public CheckaddProductVaildator() {
	}

	public CheckaddProductVaildator(boolean insertMode) {
		this.insertMode = insertMode;
	}
	
	

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {

		ShoppingBean sb= (ShoppingBean) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberNumber", "","會員編號不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "shoppingname", "","商品名稱資料不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "shoppingProductTotal", "","商品數量不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "shoppingProductPrice", "","商品價格不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productrelation", "","商品敘述不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "shoppingProductDiscount", "","商品折扣不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "shoppingType", "","商品種類不能空白");
			
		
		if (insertMode) {
			if (sb.getProductImage().isEmpty()) {
				errors.rejectValue("productImage","", "必須挑選圖片");
			}
		}


	}

}
