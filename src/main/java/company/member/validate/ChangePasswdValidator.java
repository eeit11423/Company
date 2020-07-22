package company.member.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import company.member.model.MemberBean;



public class ChangePasswdValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberPassword", "","*請輸入舊密碼");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberNewPassword", "","*請輸入新密碼");
		
		MemberBean mb  = (MemberBean) target;
		
		if (mb.getMemberPassword() != null  && mb.getMemberPassword().contains(" ")) {
			errors.rejectValue("memberPassword","" ,"內容不得有空白");
		}
		if (mb.getMemberNewPassword() != null && mb.getMemberNewPassword().contains(" ")) {
			errors.rejectValue("memberNewPassword", "","內容不得有空白");
		}
	

	}

}
