package com.utility;

public enum QuantityType {
	
	SLICE("Slice"),
	BOWL("Bowl"),
	GLASS("Glass"),
	CUP("Cup"),
	TEASPOON("Tea Spoon"),
	ITEM("Item");
	private final String quantity;
	QuantityType(String quantity) {
		this.quantity=quantity;
	}
	public String getQuantityType()
	{
		return this.quantity;
	}
}
