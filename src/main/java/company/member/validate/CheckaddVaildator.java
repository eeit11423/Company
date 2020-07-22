package company.member.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import company.member.model.MemberBean;

public class CheckaddVaildator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberNumber", "","*請輸入帳號");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberPassword", "","*請輸入密碼");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberSalary", "","*請輸入薪資");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberDepartment", "","*請輸入部門");
		MemberBean mb  = (MemberBean) target;
		
		if (mb.getMemberNumber() != null  && mb.getMemberNumber().contains(" ")) {
			errors.rejectValue("memberNumber","" ,"帳號內容不得有空白");
		}
		if (mb.getMemberPassword() != null && mb.getMemberPassword().contains(" ")) {
			errors.rejectValue("memberPassword", "","密碼內容不得有空白");
		}
	

	}

}
