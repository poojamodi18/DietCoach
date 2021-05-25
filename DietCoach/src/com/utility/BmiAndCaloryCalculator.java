package com.utility;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.beans.User;

public class BmiAndCaloryCalculator {
	User user = new User();

	public static float bmiCalculator(float weight, int height) {
		float bmival=0,bmi=0,bmiv=0;
		bmival= ((float)height / 100);
		bmiv = (float) Math.pow(bmival, 2);
		bmi=weight/bmiv;
		System.out.println("BMI : " + bmi);
		return bmi;
	}

	public static int getAgeCalulator(final Date current, final Date birthdate) {

		if (birthdate == null) {
			return 0;
		}
		else {
			final Calendar calend = new GregorianCalendar();
			calend.set(Calendar.HOUR_OF_DAY, 0);
			calend.set(Calendar.MINUTE, 0);
			calend.set(Calendar.SECOND, 0);
			calend.set(Calendar.MILLISECOND, 0);

			calend.setTimeInMillis(current.getTime() - birthdate.getTime());

			int result = 0;
			result = calend.get(Calendar.YEAR) - 1970;
			result += (float) calend.get(Calendar.MONTH) / (float) 12;
			System.out.println(result);
			return result;
		}

	}

	public static int caloriesCalculator(String gender, float weight, int height, int age, float activityid) {
		int calory = 0;
		if (gender.equalsIgnoreCase("Female")) {
			Double cal = (10 * weight + 6.25 * height - 5 * age - 161) * activityid;
			calory = (int) Math.round(cal);
			System.out.println("Calories : " + calory);

		}
		if (gender.equalsIgnoreCase("male")) {
			Double cal = (10 * weight + 6.25 * height - 5 * age + 5) * activityid;
			calory = (int) Math.round(cal);
		}
		return calory;
	}
	
	public static float waterIntakeLiter(int age,float weigth)
	{
		double ans=(weigth*2.2046)/2.2;
		if(age<=30)
		{
			ans=ans*40;
		}
		else if (age>30 && age<55) {
			ans=ans*35;
		}
		else {
			ans=ans*30;
		}
		ans=ans/28.3;
		ans=ans*0.0296;
		float liter = (float) ans;
		return liter;
	}
}
