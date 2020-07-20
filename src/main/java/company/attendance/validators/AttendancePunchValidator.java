package company.attendance.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import company.attendance.model.Punch;

@Component
public class AttendancePunchValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
//		System.out.println(clazz.getName());
		boolean b = Punch.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace
		(errors, "memberName", "punch.memberName.not.empty","姓名不能空白(預設值)");
		ValidationUtils.rejectIfEmptyOrWhitespace
		(errors, "memberNumber", "punch.memberNumber.not.empty","員編不能空白(預設值)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "punchDate", "", "日期不能空白(AttendancePunchValidator)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "punchWorkOn", "", "上班時間不能空白(AttendancePunchValidator)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "punchWorkOff", "", "下班時間不能空白(AttendancePunchValidator)");
	}

}
