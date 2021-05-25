package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

import com.beans.Food;
import com.beans.FoodRecipes;
import com.beans.User;
import com.dao.FoodDao;
import com.dao.FoodRecipesDao;
import com.dao.UserDao;
import com.dao.impl.FoodDaoImpl;
import com.dao.impl.FoodRecipesDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.service.FoodService;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;
import com.utility.CommonUtility;
import com.utility.MealType;

public class FoodServiceImpl implements FoodService {
	CommonUtility commonutil = new CommonUtility();
	FoodDao fooddao = new FoodDaoImpl();
	UserDao usrdao = new UserDaoImpl();
	FoodRecipesDao foodRecipesDao = new FoodRecipesDaoImpl();

	public ArrayList<Food> getFood() {
		ArrayList<Food> foodlist = new ArrayList<Food>();
		try (Connection connection = commonutil.getconnection()) {
			foodlist = fooddao.select(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return foodlist;
	}

	public void delete(int id) {
		int deleterows = 0;
		try (Connection connection = CommonUtility.getconnection()) {
			deleterows = fooddao.delete(connection, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Food selectbyId(int id) {
		Food food = new Food();
		try (Connection connection = commonutil.getconnection()) {
			food = fooddao.selectFoodbyId(connection, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return food;
	}

	@Override
	public int updateFoodDetails(Food food, String imgMessage) {
		// TODO Auto-generated method stub
		try (Connection connection = commonutil.getconnection()) {
			return fooddao.update(connection, food, imgMessage);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

//	
	public static <K, V> void combinations(Map<K, Set<V>> map, List<Map<K, V>> list) {
		recurse(map, new LinkedList<K>(map.keySet()).listIterator(), new HashMap<K, V>(), list);
	}

	// helper method to do the recursion
	private static <K, V> void recurse(Map<K, Set<V>> map, ListIterator<K> iter, Map<K, V> cur, List<Map<K, V>> list) {
		// we're at a leaf node in the recursion tree, add solution to list
		if (!iter.hasNext()) {
			Map<K, V> entry = new HashMap<K, V>();

			for (K key : cur.keySet()) {
				entry.put(key, cur.get(key));
			}

			list.add(entry);
		} else {
			K key = iter.next();
			Set<V> set = map.get(key);

			for (V value : set) {
				cur.put(key, value);
				recurse(map, iter, cur, list);
				cur.remove(key);
			}

			iter.previous();
		}
	}

	@Override
	public List<String> getBreakfastList(ArrayList<Food> foodList, User u, String mealtype) {
		int mealcal = 0;
		int sugar = 0;
		int fat = 0;
		if (mealtype.equalsIgnoreCase(MealType.BREAKFAST.getMealCharCode())) {
			mealcal = (u.getDailyCalories() * 20) / 100;
			if (u.getMedicalConditionIds().contains("4") && u.getMedicalConditionIds().contains("2")) {
				fat = 4;
				sugar = 7;
			} else if (u.getMedicalConditionIds().contains("2") || u.getMedicalConditionIds().contains("3")) {
				sugar = 7;
			} else if (u.getMedicalConditionIds().contains("4")) {
				fat = 4;
			}
		} else if (mealtype.equalsIgnoreCase(MealType.LUNCH.getMealCharCode())) {
			mealcal = (u.getDailyCalories() * 35) / 100;
			if (u.getMedicalConditionIds().contains("4") && u.getMedicalConditionIds().contains("2")) {
				fat = 4;
				sugar = 12;
			} else if (u.getMedicalConditionIds().contains("2") || u.getMedicalConditionIds().contains("3")) {
				sugar = 12;
			} else if (u.getMedicalConditionIds().contains("4")) {
				fat = 7;
			}
		} else if (mealtype.equalsIgnoreCase(MealType.DINNER.getMealCharCode())) {
			mealcal = (u.getDailyCalories() * 30) / 100;
			if (u.getMedicalConditionIds().contains("4") && u.getMedicalConditionIds().contains("2")) {
				fat = 8;
				sugar = 15;
			} else if (u.getMedicalConditionIds().contains("2") || u.getMedicalConditionIds().contains("3")) {
				sugar = 12;
			} else if (u.getMedicalConditionIds().contains("4")) {
				fat = 6;
			}
		} else if (mealtype.equalsIgnoreCase(MealType.SNACK.getMealCharCode())) {
			mealcal = (u.getDailyCalories() * 15) / 100;
			if (u.getMedicalConditionIds().contains("4") && u.getMedicalConditionIds().contains("2")) {
				fat = 7;
				sugar = 6;
			} else if (u.getMedicalConditionIds().contains("2") || u.getMedicalConditionIds().contains("3")) {
				sugar = 5;
			} else if (u.getMedicalConditionIds().contains("4")) {
				fat = 3;
			}
		}

		ArrayList<Food> foodall = getfoodMealType(foodList, mealtype);

//		System.out.println("breakfast food list size " + foodall.size());
		Map<String, Set<Food>> map = new HashMap<String, Set<Food>>() {
			{
				String[] subMeal = subMealType(mealtype);
//				System.out.println("Sub meal types"+subMeal[0]+subMeal[1]);
//				System.out.println("breakfastfoods : " + foodall.size());
				put("Drink", new HashSet<Food>() {
					{
						for (Food foodbreak : foodall) {
							if (foodbreak.getSubmealtype().equalsIgnoreCase(subMeal[0])) {
								add(foodbreak);
//								System.out.println("added");
							}
						}
					}
				});

				put("Main", new HashSet<Food>() {
					{
						for (Food foodbreak : foodall) {
							if (foodbreak.getSubmealtype().equalsIgnoreCase(subMeal[1])) {
								add(foodbreak);
//								System.out.println("added");
							}
						}
					}
				});
//				System.out.println("submeal size : " + subMeal.length);
				if (subMeal.length == 3) {
					put("Snack", new HashSet<Food>() {
						{
							for (Food foodbreak : foodall) {
								if (foodbreak.getSubmealtype().equalsIgnoreCase(subMeal[2])) {
									add(foodbreak);
//								System.out.println("added");
								}
							}
						}
					});
				}
			}
		};
		List<Map<String, Food>> list = new LinkedList<Map<String, Food>>();
		combinations(map, list);
		List<String> combinationidlist = null;
		if (u.getMedicalConditionIds().contains("4") && u.getMedicalConditionIds().contains("2")) {
			combinationidlist = getCombinationStringListFat(list, mealcal, fat, sugar);
		} else if (u.getMedicalConditionIds().contains("2") || u.getMedicalConditionIds().contains("3")) {
			combinationidlist = getCombinationStringList(list, mealcal, sugar);
		} else if (u.getMedicalConditionIds().contains("4")) {
			combinationidlist = getCombinationStringListFat(list, mealcal, fat);
		} else {
			combinationidlist = getCombinationStringList(list, mealcal);
		}
//		System.out.println("SERVICE combination size "+ combinationidlist.size());

		return combinationidlist;
	}

	private List<String> getCombinationStringListFat(List<Map<String, Food>> list, int mealcal, int fat, int sugar) {
		List<String> combinationidlist = new ArrayList<String>();
//		System.out.println("meal cal : "+cal+" size of list of map of food"+list.size());
		int cnt = 0;
		for (Map<String, Food> m : list) {
			String s = "";
			int totalcal = 0;
			int totalsugar = 0;
			int totalfat = 0;
			for (Map.Entry<String, Food> e : m.entrySet()) {
				totalcal += e.getValue().getCalories();
				totalsugar += e.getValue().getSugar();
				totalfat += e.getValue().getFat();
				s += e.getValue().getFoodid();
				s += "~";
			}
			if (totalcal <= mealcal && totalsugar <= sugar && totalfat <= fat) {
				combinationidlist.add(s);
				cnt++;
			}
		}
//		System.out.println("count of combinations : "+cnt);
		return combinationidlist;
	}

	private List<String> getCombinationStringListFat(List<Map<String, Food>> list, int mealcal, int fat) {
		List<String> combinationidlist = new ArrayList<String>();
//		System.out.println("meal cal : "+cal+" size of list of map of food"+list.size());
		int cnt = 0;
		for (Map<String, Food> m : list) {
			String s = "";
			int totalcal = 0;
			int totalfat = 0;
			int totalfiber = 0;
			for (Map.Entry<String, Food> e : m.entrySet()) {
				totalcal += e.getValue().getCalories();
				totalfat += e.getValue().getFat();
				totalfiber += e.getValue().getFiber();
				s += e.getValue().getFoodid();
				s += "~";
			}
			if (totalcal <= mealcal && totalfat <= fat && totalfiber >= 1) {
				combinationidlist.add(s);
				cnt++;
			}
		}
//		System.out.println("count of combinations : "+cnt);
		return combinationidlist;
	}

	private List<String> getCombinationStringList(List<Map<String, Food>> list, int mealcal, int sugar) {
		List<String> combinationidlist = new ArrayList<String>();
//		System.out.println("meal cal : "+cal+" size of list of map of food"+list.size());
		int cnt = 0;
		for (Map<String, Food> m : list) {
			String s = "";
			int totalcal = 0;
			int totalsugar = 0;
			for (Map.Entry<String, Food> e : m.entrySet()) {
				totalcal += e.getValue().getCalories();
				totalsugar += e.getValue().getSugar();
				s += e.getValue().getFoodid();
				s += "~";
			}
			if (totalcal <= mealcal && totalsugar <= sugar) {
				combinationidlist.add(s);
				cnt++;
			}
		}
//		System.out.println("count of combinations : "+cnt);
		return combinationidlist;
	}

	public String[] subMealType(String mealtype) {
		String submealtypes[] = new String[3];
		if (mealtype.equalsIgnoreCase(MealType.BREAKFAST.getMealCharCode())) {
			submealtypes = MealType.BREAKFAST.getSubMealType();
		} else if (mealtype.equalsIgnoreCase(MealType.LUNCH.getMealCharCode())) {
			submealtypes = MealType.LUNCH.getSubMealType();
		} else if (mealtype.equalsIgnoreCase(MealType.DINNER.getMealCharCode())) {
			submealtypes = MealType.DINNER.getSubMealType();
		} else if (mealtype.equalsIgnoreCase(MealType.SNACK.getMealCharCode())) {
			submealtypes = MealType.SNACK.getSubMealType();
		}
		return submealtypes;
	}

	public List<String> getCombinationStringList(List<Map<String, Food>> list, int cal) {
		List<String> combinationidlist = new ArrayList<String>();
//		System.out.println("meal cal : "+cal+" size of list of map of food"+list.size());
		int cnt = 0;
		for (Map<String, Food> m : list) {
			String s = "";
			int totalcal = 0;
			for (Map.Entry<String, Food> e : m.entrySet()) {
				totalcal += e.getValue().getCalories();
				s += e.getValue().getFoodid();
				s += "~";
			}
			if (totalcal <= cal) {
				combinationidlist.add(s);
				cnt++;
			}
		}
//		System.out.println("count of combinations : "+cnt);
		return combinationidlist;

	}

	public ArrayList<Food> getfoodMealType(ArrayList<Food> list, String mealtype) {
		ArrayList<Food> food = new ArrayList<Food>();
		for (Food fooditem : list) {
			if (fooditem.getMealtype().equalsIgnoreCase(mealtype)) {
				food.add(fooditem);
			}
		}
		return food;

	}

	@Override
	public int insertFoodDetails(Food food) {
		// TODO Auto-generated method stub
		try (Connection connection = commonutil.getconnection()) {
			int i = fooddao.insertfood(connection, food);
			if (i > 0) {
//				System.out.println("Food Inserted");
			} else {
//				System.out.println("Food insertion failed");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int insertFoodandReciepe(Food food, FoodRecipes foodRecipes) {
		// TODO Auto-generated method stub
		try (Connection connection = commonutil.getconnection()) {
			connection.setAutoCommit(false);
			int id = foodRecipesDao.addRecipe(connection, foodRecipes);
			if (id > 0) {
				food.setFoodrecipeId(id);
				int i = fooddao.insertfoodwithRecipe(connection, food);
				if (i > 0) {
					connection.setAutoCommit(true);
					return i;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<Food> getFoodwithoutAllegy(String allergy, int dietcategory) {
		ArrayList<Food> foodlist = new ArrayList<Food>();
		try (Connection connection = commonutil.getconnection()) {
			if (dietcategory == 1) {
				foodlist = fooddao.selectWithoutAllergy(connection, allergy, 1, 4);
			}
			if (dietcategory == 2) {
				foodlist = fooddao.selectWithoutAllergy(connection, allergy, 1, 2);
			}
			if (dietcategory == 3) {
				foodlist = fooddao.selectWithoutAllergy(connection, allergy, 3, 4);
			}
			if (dietcategory == 4) {
				foodlist = fooddao.selectWithoutAllergy(connection, allergy, 4, 0);
			}
			if (dietcategory == 5) {
				foodlist = fooddao.selectWithoutAllergy(connection, allergy, 1, 2, 5);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return foodlist;
	}

	@Override
	public ArrayList<Food> getFood(int dietcategory) {
		ArrayList<Food> foodlist = new ArrayList<Food>();
		try (Connection connection = commonutil.getconnection()) {
			if (dietcategory == 1) {
				foodlist = fooddao.selectwithdietcategory(connection, 1, 4);
			}
			if (dietcategory == 2) {
				foodlist = fooddao.selectwithdietcategory(connection, 1, 2);
			}
			if (dietcategory == 3) {
				foodlist = fooddao.selectwithdietcategory(connection, 3, 4);
			}
			if (dietcategory == 4) {
				foodlist = fooddao.selectwithdietcategory(connection, 4, 0);
			}
			if (dietcategory == 5) {
				foodlist = fooddao.selectwithdietcategory(connection, 1, 2, 5);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return foodlist;
	}
}
