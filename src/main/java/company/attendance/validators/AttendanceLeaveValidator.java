package company.attendance.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import company.attendance.model.Leave;

@Component
public class AttendanceLeaveValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
//		System.out.println(clazz.getName());
		boolean b = Leave.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace
		(errors, "memberName", "leave.memberName.not.empty","姓名不能空白(預設值)");
		ValidationUtils.rejectIfEmptyOrWhitespace
		(errors, "memberNumber", "leave.memberNumber.not.empty","員編不能空白(預設值)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "leaveDate", "", "日期不能空白(AttendanceLeaveValidator)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "leaveStart", "", "上班時間不能空白(AttendanceLeaveValidator)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "leaveEnd", "", "下班時間不能空白(AttendanceLeaveValidator)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "leaveCause", "", "原因欄不能空白(AttendanceLeaveValidator)");
	}

}
