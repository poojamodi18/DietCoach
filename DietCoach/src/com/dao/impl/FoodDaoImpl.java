package com.dao.impl;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Food;
import com.dao.FoodDao;

public class FoodDaoImpl implements FoodDao {
	String insertfoodquery = "insert into food (c_food_name, c_meal_type, c_sub_meal_type, i_diet_id, i_food_calories, i_carbs, i_protein, i_fat, i_sugar, i_active, i_fiber, c_nutritional_info, i_quantity, c_serving_type, b_food_image) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	String selectfoodquery = "select * from food where i_active=1 group by c_food_name;";
	String selectTWODietcategory = "SELECT * FROM food where i_active=1 and i_diet_id=? or i_diet_id=? ;";
	String selectThreeDietCategory = "SELECT * FROM food where i_active=1 and i_diet_id=? or i_diet_id=? or i_diet_id=? ;";
	String deletefood = "update food set i_active=0 where i_food_id=?";
	String updatefoodquerywithimg = "update food set c_food_name=?,c_meal_type=?,i_diet_id=?,i_food_calories=?,i_carbs=?,i_protein=?,i_fat=?,i_sugar=?,i_active=?,i_fiber=?,c_nutritional_info=?,i_quantity=?,c_serving_type=?,b_food_image=? where i_food_id=?";
	String updatefoodquery = "update food set c_food_name=?,c_meal_type=?,i_diet_id=?,i_food_calories=?,i_carbs=?,i_protein=?,i_fat=?,i_sugar=?,i_active=?,i_fiber=?,c_nutritional_info=?,i_quantity=?,c_serving_type=? where i_food_id=?";
	String selectfoodbyidquery = "select * from food where i_food_id=? AND i_active=1";
	String selectfoodbycaloiresquery = "select * from food where i_food_calories < ?";
	String insertRecipeID = "update food set i_receipe_id=? where i_food_id=?";
	String insertfoodquerywithRecipe = "insert into food (c_food_name, c_meal_type, c_sub_meal_type, i_diet_id, i_food_calories, i_carbs, i_protein, i_fat, i_sugar, i_active, i_fiber, c_nutritional_info, i_quantity, c_serving_type, b_food_image,i_receipe_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	@Override
	public int insertfood(Connection connection, Food food) throws SQLException {
		// TODO Auto-generated method stub
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertfoodquery)) {
			preparedStatement.setString(1, food.getFoodname());
			preparedStatement.setString(2, food.getMealtype());
			preparedStatement.setString(3, food.getSubmealtype());
			preparedStatement.setInt(4, food.getDietid());
			preparedStatement.setInt(5, food.getCalories());
			preparedStatement.setFloat(6, food.getCarbs());
			preparedStatement.setFloat(7, food.getProtein());
			preparedStatement.setFloat(8, food.getFat());
			preparedStatement.setFloat(9, food.getSugar());
			preparedStatement.setInt(10, food.getIsactive());
			preparedStatement.setFloat(11, food.getFiber());
			preparedStatement.setString(12, food.getNutritionalInfo());
			preparedStatement.setInt(13, food.getQuantity());
			preparedStatement.setString(14, food.getServingType());
			preparedStatement.setBlob(15, food.getFoodImageInputStream());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public ArrayList<Food> select(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Food> foodlist = new ArrayList<Food>();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectfoodquery);
				ResultSet resultSet = preparedStatement.executeQuery()) {
			while (resultSet.next()) {
				Food f = new Food();
				f.setFoodid(resultSet.getInt("i_food_id"));
				f.setFoodname(resultSet.getString("c_food_name"));
				f.setMealtype(resultSet.getString("c_meal_type"));
				f.setSubmealtype(resultSet.getString("c_sub_meal_type"));
				f.setDietid(resultSet.getInt("i_diet_id"));
				f.setCalories(resultSet.getInt("i_food_calories"));
				f.setCarbs(resultSet.getFloat("i_carbs"));
				f.setProtein(resultSet.getFloat("i_protein"));
				f.setFat(resultSet.getFloat("i_fat"));
				f.setSugar(resultSet.getFloat("i_sugar"));
				f.setIsactive(resultSet.getInt("i_active"));
				f.setFiber(resultSet.getFloat("i_fiber"));
				f.setNutritionalInfo(resultSet.getString("c_nutritional_info"));
				f.setQuantity(resultSet.getInt("i_quantity"));
				f.setServingType(resultSet.getString("c_serving_type"));
				f.setFoodrecipeId(resultSet.getInt("i_receipe_id"));
				if(resultSet.getBytes("b_food_image")!=null)
				{
					f.setFoodImageString(java.util.Base64.getEncoder().encodeToString(resultSet.getBytes("b_food_image")));
				}
				if(f.getFoodImageString()!=null)
				{
					foodlist.add(f);
				}
			}
			return foodlist;
		}
	}

	public int delete(Connection connection, int id) throws SQLException {
		try (PreparedStatement preparedStatement = connection.prepareStatement(deletefood)) {
			preparedStatement.setInt(1, id);
			return preparedStatement.executeUpdate();
		}
	}

	// @Override
	public int update(Connection connection, Food food,String imgMessage) throws SQLException {
		if(imgMessage.equalsIgnoreCase("yes")) {
		try (PreparedStatement preparedStatement = connection.prepareStatement(updatefoodquerywithimg)) {
			preparedStatement.setString(1, food.getFoodname());
			preparedStatement.setString(2, food.getMealtype());
			preparedStatement.setInt(3, food.getDietid());
			preparedStatement.setInt(4, food.getCalories());
			preparedStatement.setFloat(5, food.getCarbs());
			preparedStatement.setFloat(6, food.getProtein());
			preparedStatement.setFloat(7, food.getFat());
			preparedStatement.setFloat(8, food.getSugar());
			preparedStatement.setInt(9, food.getIsactive());
			preparedStatement.setFloat(10, food.getFiber());
			preparedStatement.setString(11, food.getNutritionalInfo());
			preparedStatement.setInt(12, food.getQuantity());
			preparedStatement.setString(13, food.getServingType());
			preparedStatement.setBlob(14, food.getFoodImageInputStream());
			preparedStatement.setInt(15, food.getFoodid());
			return preparedStatement.executeUpdate();
		}
		}
		else {
			try (PreparedStatement preparedStatement = connection.prepareStatement(updatefoodquery)) {
				preparedStatement.setString(1, food.getFoodname());
				preparedStatement.setString(2, food.getMealtype());
				preparedStatement.setInt(3, food.getDietid());
				preparedStatement.setInt(4, food.getCalories());
				preparedStatement.setFloat(5, food.getCarbs());
				preparedStatement.setFloat(6, food.getProtein());
				preparedStatement.setFloat(7, food.getFat());
				preparedStatement.setFloat(8, food.getSugar());
				preparedStatement.setInt(9, food.getIsactive());
				preparedStatement.setFloat(10, food.getFiber());
				preparedStatement.setString(11, food.getNutritionalInfo());
				preparedStatement.setInt(12, food.getQuantity());
				preparedStatement.setString(13, food.getServingType());
				preparedStatement.setInt(14, food.getFoodid());
				return preparedStatement.executeUpdate();
			}
		}
	}

	@Override
	public Food selectFoodbyId(Connection connection, int id) throws SQLException {
		Food food = new Food();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectfoodbyidquery);) {
			preparedStatement.setInt(1, id);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					food.setFoodid(resultSet.getInt("i_food_id"));
					food.setFoodname(resultSet.getString("c_food_name"));
					food.setMealtype(resultSet.getString("c_meal_type"));
					food.setDietid(resultSet.getInt("i_diet_id"));
					food.setCalories(resultSet.getInt("i_food_calories"));
					food.setCarbs(resultSet.getFloat("i_carbs"));
					food.setProtein(resultSet.getFloat("i_protein"));
					food.setFat(resultSet.getFloat("i_fat"));
					food.setSugar(resultSet.getFloat("i_sugar"));
					food.setIsactive(resultSet.getInt("i_active"));
					food.setFiber(resultSet.getFloat("i_fiber"));
					food.setNutritionalInfo(resultSet.getString("c_nutritional_info"));
					food.setQuantity(resultSet.getInt("i_quantity"));
					food.setServingType(resultSet.getString("c_serving_type"));
					if(resultSet.getBytes("b_food_image")!=null)
					{
						food.setFoodImageString(java.util.Base64.getEncoder().encodeToString(resultSet.getBytes("b_food_image")));
					}
					food.setFoodrecipeId(resultSet.getInt("i_receipe_id"));
				}
			}
		}
		return food;
	}

	@Override
	public ArrayList<Food> selectFoodByCalories(Connection connection, int cal) throws SQLException {
		ArrayList<Food> foodlist = new ArrayList<Food>();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectfoodbycaloiresquery)) {
			preparedStatement.setInt(1, cal);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Food f = new Food();
					f.setFoodid(resultSet.getInt("i_food_id"));
					f.setFoodname(resultSet.getString("c_food_name"));
					f.setMealtype(resultSet.getString("c_meal_type"));
					f.setSubmealtype(resultSet.getString("c_sub_meal_type"));
					f.setDietid(resultSet.getInt("i_diet_id"));
					f.setCalories(resultSet.getInt("i_food_calories"));
					f.setCarbs(resultSet.getFloat("i_carbs"));
					f.setProtein(resultSet.getFloat("i_protein"));
					f.setFat(resultSet.getFloat("i_fat"));
					f.setSugar(resultSet.getFloat("i_sugar"));
					f.setIsactive(resultSet.getInt("i_active"));
					f.setFiber(resultSet.getFloat("i_fiber"));
					f.setNutritionalInfo(resultSet.getString("c_nutritional_info"));
					f.setQuantity(resultSet.getInt("i_quantity"));
					f.setServingType(resultSet.getString("c_serving_type"));
					if(resultSet.getBytes("b_food_image")!=null)
					{
						f.setFoodImageString(java.util.Base64.getEncoder().encodeToString(resultSet.getBytes("b_food_image")));
					}
					f.setFoodrecipeId(resultSet.getInt("i_receipe_id"));
					foodlist.add(f);
				}
				return foodlist;
			}
		}
	}

	@Override
	public int addRecipeId(Connection connection, int foodId, int id) throws SQLException {
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertRecipeID)) {
			preparedStatement.setInt(1, id);
			preparedStatement.setInt(2, foodId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int insertfoodwithRecipe(Connection connection, Food food) throws SQLException {
		try (PreparedStatement preparedStatement = connection.prepareStatement(insertfoodquerywithRecipe)) {
			preparedStatement.setString(1, food.getFoodname());
			preparedStatement.setString(2, food.getMealtype());
			preparedStatement.setString(3, food.getSubmealtype());
			preparedStatement.setInt(4, food.getDietid());
			preparedStatement.setInt(5, food.getCalories());
			preparedStatement.setFloat(6, food.getCarbs());
			preparedStatement.setFloat(7, food.getProtein());
			preparedStatement.setFloat(8, food.getFat());
			preparedStatement.setFloat(9, food.getSugar());
			preparedStatement.setInt(10, food.getIsactive());
			preparedStatement.setFloat(11, food.getFiber());
			preparedStatement.setString(12, food.getNutritionalInfo());
			preparedStatement.setInt(13, food.getQuantity());
			preparedStatement.setString(14, food.getServingType());
			preparedStatement.setBlob(15, food.getFoodImageInputStream());
			preparedStatement.setInt(16, food.getFoodrecipeId());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public ArrayList<Food> selectWithoutAllergy(Connection connection, String allergy, int di, int dj) throws SQLException {
		ArrayList<Food> foodlist = new ArrayList<Food>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectTWODietcategory)){
			preparedStatement.setInt(1, di);
			preparedStatement.setInt(2, dj);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Food f = new Food();
					f.setFoodid(resultSet.getInt("i_food_id"));
					f.setFoodname(resultSet.getString("c_food_name"));
					f.setMealtype(resultSet.getString("c_meal_type"));
					f.setSubmealtype(resultSet.getString("c_sub_meal_type"));
					f.setDietid(resultSet.getInt("i_diet_id"));
					f.setCalories(resultSet.getInt("i_food_calories"));
					f.setCarbs(resultSet.getFloat("i_carbs"));
					f.setProtein(resultSet.getFloat("i_protein"));
					f.setFat(resultSet.getFloat("i_fat"));
					f.setSugar(resultSet.getFloat("i_sugar"));
					f.setIsactive(resultSet.getInt("i_active"));
					f.setFiber(resultSet.getFloat("i_fiber"));
					f.setNutritionalInfo(resultSet.getString("c_nutritional_info"));
					f.setQuantity(resultSet.getInt("i_quantity"));
					f.setServingType(resultSet.getString("c_serving_type"));
					f.setFoodrecipeId(resultSet.getInt("i_receipe_id"));
					if(resultSet.getBytes("b_food_image")!=null)
					{
						f.setFoodImageString(java.util.Base64.getEncoder().encodeToString(resultSet.getBytes("b_food_image")));
					}
					if(f.getFoodImageString()!=null)
					{
						int i=0;
						String aller[] = allergy.split("~");
						for(String s : aller) {
							if(s.length()>2) {
								if(f.getFoodname().contains(s)) {
//									System.out.println("allergy"+f.getFoodname());
									i=1;
								}
							}
						}
						if(i==0) {
							foodlist.add(f);
						}
					}
				}
				return foodlist;
			}
		}
	}

	@Override
	public ArrayList<Food> selectwithdietcategory(Connection connection, int di, int dj) throws SQLException {
		ArrayList<Food> foodlist = new ArrayList<Food>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectTWODietcategory)){
			preparedStatement.setInt(1, di);
			preparedStatement.setInt(2, dj);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Food f = new Food();
					f.setFoodid(resultSet.getInt("i_food_id"));
					f.setFoodname(resultSet.getString("c_food_name"));
					f.setMealtype(resultSet.getString("c_meal_type"));
					f.setSubmealtype(resultSet.getString("c_sub_meal_type"));
					f.setDietid(resultSet.getInt("i_diet_id"));
					f.setCalories(resultSet.getInt("i_food_calories"));
					f.setCarbs(resultSet.getFloat("i_carbs"));
					f.setProtein(resultSet.getFloat("i_protein"));
					f.setFat(resultSet.getFloat("i_fat"));
					f.setSugar(resultSet.getFloat("i_sugar"));
					f.setIsactive(resultSet.getInt("i_active"));
					f.setFiber(resultSet.getFloat("i_fiber"));
					f.setNutritionalInfo(resultSet.getString("c_nutritional_info"));
					f.setQuantity(resultSet.getInt("i_quantity"));
					f.setServingType(resultSet.getString("c_serving_type"));
					f.setFoodrecipeId(resultSet.getInt("i_receipe_id"));
					if(resultSet.getBytes("b_food_image")!=null)
					{
						f.setFoodImageString(java.util.Base64.getEncoder().encodeToString(resultSet.getBytes("b_food_image")));
					}
					if(f.getFoodImageString()!=null)
					{
						foodlist.add(f);
					}
				}
				return foodlist;
			}
		}
	}

	@Override
	public ArrayList<Food> selectwithdietcategory(Connection connection, int di, int dj, int dk) throws SQLException {
		ArrayList<Food> foodlist = new ArrayList<Food>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectThreeDietCategory)){
			preparedStatement.setInt(1, di);
			preparedStatement.setInt(2, dj);
			preparedStatement.setInt(3, dk);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Food f = new Food();
					f.setFoodid(resultSet.getInt("i_food_id"));
					f.setFoodname(resultSet.getString("c_food_name"));
					f.setMealtype(resultSet.getString("c_meal_type"));
					f.setSubmealtype(resultSet.getString("c_sub_meal_type"));
					f.setDietid(resultSet.getInt("i_diet_id"));
					f.setCalories(resultSet.getInt("i_food_calories"));
					f.setCarbs(resultSet.getFloat("i_carbs"));
					f.setProtein(resultSet.getFloat("i_protein"));
					f.setFat(resultSet.getFloat("i_fat"));
					f.setSugar(resultSet.getFloat("i_sugar"));
					f.setIsactive(resultSet.getInt("i_active"));
					f.setFiber(resultSet.getFloat("i_fiber"));
					f.setNutritionalInfo(resultSet.getString("c_nutritional_info"));
					f.setQuantity(resultSet.getInt("i_quantity"));
					f.setServingType(resultSet.getString("c_serving_type"));
					f.setFoodrecipeId(resultSet.getInt("i_receipe_id"));
					if(resultSet.getBytes("b_food_image")!=null)
					{
						f.setFoodImageString(java.util.Base64.getEncoder().encodeToString(resultSet.getBytes("b_food_image")));
					}
					if(f.getFoodImageString()!=null)
					{
						foodlist.add(f);
					}
				}
				return foodlist;
			}
		}
	}

	@Override
	public ArrayList<Food> selectWithoutAllergy(Connection connection, String allergy, int di, int dj, int dk)
			throws SQLException {
		ArrayList<Food> foodlist = new ArrayList<Food>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectThreeDietCategory)){
			preparedStatement.setInt(1, di);
			preparedStatement.setInt(2, dj);
			preparedStatement.setInt(3, dk);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Food f = new Food();
					f.setFoodid(resultSet.getInt("i_food_id"));
					f.setFoodname(resultSet.getString("c_food_name"));
					f.setMealtype(resultSet.getString("c_meal_type"));
					f.setSubmealtype(resultSet.getString("c_sub_meal_type"));
					f.setDietid(resultSet.getInt("i_diet_id"));
					f.setCalories(resultSet.getInt("i_food_calories"));
					f.setCarbs(resultSet.getFloat("i_carbs"));
					f.setProtein(resultSet.getFloat("i_protein"));
					f.setFat(resultSet.getFloat("i_fat"));
					f.setSugar(resultSet.getFloat("i_sugar"));
					f.setIsactive(resultSet.getInt("i_active"));
					f.setFiber(resultSet.getFloat("i_fiber"));
					f.setNutritionalInfo(resultSet.getString("c_nutritional_info"));
					f.setQuantity(resultSet.getInt("i_quantity"));
					f.setServingType(resultSet.getString("c_serving_type"));
					f.setFoodrecipeId(resultSet.getInt("i_receipe_id"));
					if(resultSet.getBytes("b_food_image")!=null)
					{
						f.setFoodImageString(java.util.Base64.getEncoder().encodeToString(resultSet.getBytes("b_food_image")));
					}
					if(f.getFoodImageString()!=null)
					{
						int i=0;
						String aller[] = allergy.split("~");
						for(String s : aller) {
							if(s.length()>2) {
								if(f.getFoodname().contains(s)) {
//									System.out.println("allergy"+f.getFoodname());
									i=1;
								}
							}
						}
						if(i==0) {
							foodlist.add(f);
						}
					}
				}
				return foodlist;
			}
		}
	}
}
