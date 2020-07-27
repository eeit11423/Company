package company.activity.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import company.activity.model.Activity;

@Component
public class ActivityValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
//		System.out.println(clazz.getName());
		boolean b = Activity.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		Activity activity = (Activity)target;
		ValidationUtils.rejectIfEmptyOrWhitespace
			(errors, "activityTitle", "activity.activityTitle.not.empty","標題欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace
			(errors, "activitySubtitle", "activity.activitySubtitle.not.empty","內容欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "startDate", "", "起始日期不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "endDate", "", "結束日期不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "joinNum", "", "參加人數不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "organiserId", "", "您未登入，請登入");
		
		if (activity.getActivityTitle().length()<2) {
			errors.rejectValue("activityTitle","", "至少三個字");
		}
//		Double d = member.getWeight();

		if (activity.getDepartment().getId() == -1) {
			errors.rejectValue("department","", "必選");
		}

//#########無法做出加入種類的限制############
		
//		if (activity.getActCategory() == "NA") {
//			errors.rejectValue("actCategory","", "必選");
//		}
//		
	}

}
