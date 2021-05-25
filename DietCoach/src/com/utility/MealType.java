package com.utility;

public enum MealType {
	
	BREAKFAST("Breakfast",new String[]{"main","drink","dryfruit"}),
	LUNCH("Lunch",new String[]{"curry","bread","side"}),
	SNACK("Snack",new String[]{"juice","snack"}),
	DINNER("Dinner",new String[]{"curry","bread","side"});
	private final String mealchar;
	private final String submealtype[];
	MealType(String mealchar,String submealtype[])
	{
		this.mealchar=mealchar;
		this.submealtype = submealtype;
	}
	public String getMealCharCode()
	{
		return this.mealchar;
	}
	public String[] getSubMealType()
	{
		return this.submealtype;
	}
}
