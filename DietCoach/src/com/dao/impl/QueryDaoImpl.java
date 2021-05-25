package com.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Query;
import com.dao.QueryDao;

public class QueryDaoImpl implements QueryDao{
	String insertquery = "Insert into query(c_user_mail, c_subject, c_question, i_notify) values (?,?,?,?)";
	String selectAllQuery = "SELECT * FROM query ORDER BY c_answer asc;";
	String addAnswerQuery = "UPDATE query SET c_answer = ?, i_notify = ? WHERE i_query_id = ?;";
	String deleteQuery = "DELETE FROM query WHERE i_query_id = ?;";
	@Override
	public int insertQuery(Query query, Connection connection) throws SQLException {
		int i=0;
		try(PreparedStatement preparedStatement=connection.prepareStatement(insertquery))
		{
			preparedStatement.setString(1, query.getUserMail());
			preparedStatement.setString(2, query.getSubject());
			preparedStatement.setString(3, query.getQuestion());
			preparedStatement.setInt(4, 0);
			i=preparedStatement.executeUpdate();
		}
		return i;
	}
	@Override
	public ArrayList<Query> getAllQuery(Connection connection) throws SQLException {
		ArrayList<Query> queryList = new ArrayList<Query>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectAllQuery))
		{
			try(ResultSet resultset=preparedStatement.executeQuery())
			{
				while (resultset.next()) {
					Query query = new Query();
					query.setQueryid(resultset.getInt("i_query_id"));
					query.setUserMail(resultset.getString("c_user_mail"));
					query.setSubject(resultset.getString("c_subject"));
					query.setQuestion(resultset.getString("c_question"));
					query.setAnswer(resultset.getString("c_answer"));
					query.setNotify(resultset.getInt("i_notify"));
					queryList.add(query);
				}
			}
		}
		return queryList;
	}
	@Override
	public String insertAnswer(Connection connection, Query query) throws SQLException {
		String msg="";
		try(PreparedStatement preparedStatement=connection.prepareStatement(addAnswerQuery))
		{
			preparedStatement.setString(1, query.getAnswer());
			preparedStatement.setInt(2, 2);
			preparedStatement.setInt(3, query.getQueryid());
			int i=preparedStatement.executeUpdate();
			if(i==1){
				msg="answered";
			}
			else {
				msg="failed";
			}
		}
		return msg;
	}
	@Override
	public int deleteQuery(Connection connection, int id) throws SQLException {
		try(PreparedStatement preparedStatement=connection.prepareStatement(deleteQuery))
		{
			preparedStatement.setInt(1, id);
			return preparedStatement.executeUpdate();
		}
	}

}
