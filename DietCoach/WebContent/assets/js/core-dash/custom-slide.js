function myFunctionActivity() {
	var x = document.getElementById("rangeInput");
	var currentVal = parseFloat(x.value);
	var v1=parseFloat(1.2);
	var v2=parseFloat(1.375);
	var v3=parseFloat(1.55);
	var v4=parseFloat(1.725);
	var v5=parseFloat(1.9);
	var condition1 =((parseFloat(currentVal) <= v1) && (parseFloat(currentVal) > 0));
	if(condition1)
	{
	 	document.getElementById('amount').value = "Little or no excercise";
	}
	else if((parseFloat(currentVal) <= v2) && (parseFloat(currentVal) > v1))
	{
	 	document.getElementById('amount').value ="Light excercise / sports 1-3 days a week";
	}
	else if((parseFloat(currentVal) <= v3) && (parseFloat(currentVal) > v2)) 
	{
		document.getElementById('amount').value ="Modrate excercise / sports 3-5 days a week";
	}
	else if((parseFloat(currentVal) <= v4) && (parseFloat(currentVal) > v3)) 
	{
		document.getElementById('amount').value ="Hard excercise / sports 6-7 days a week";
	}
	else if((parseFloat(currentVal) <= v5) && (parseFloat(currentVal) > v4)) 
	{
		document.getElementById('amount').value ="Twice excercise per day / Extra heavy workouts";
	}
}