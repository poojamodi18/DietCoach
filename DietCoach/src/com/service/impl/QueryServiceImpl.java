package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Query;
import com.dao.QueryDao;
import com.dao.impl.QueryDaoImpl;
import com.service.QueryService;
import com.sun.org.apache.regexp.internal.recompile;
import com.utility.CommonUtility;
import com.utility.Mail;

public class QueryServiceImpl implements QueryService{
	QueryDao querydao = new QueryDaoImpl();
	@Override
	public String addNewQuery(Query query) {
		String message = "";
		try(Connection connection = CommonUtility.getconnection())
		{
			int i = querydao.insertQuery(query,connection);
			if(i>0) {
				message="We have received your question we will try to reach you as soon as possible...";
			}
			else
			{
				message="Sorry for inconvenience,  but there is some problem with connection please try again later...";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return message;
	}
	@Override
	public ArrayList<Query> getQueryList() {
		try(Connection connection = CommonUtility.getconnection())
		{
			return querydao.getAllQuery(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public String addanswer(Query query) {
		String s="";
		try(Connection connection = CommonUtility.getconnection())
		{
			s= querydao.insertAnswer(connection,query);
			if(s.equalsIgnoreCase("answered")) {
				Mail.sendMail(query.getUserMail(), "Question : "+query.getQuestion()+"\nAnswer : "+query.getAnswer(), "Answer to your DietCoach Query");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	@Override
	public int deleteQuery(int id) {
		try(Connection connection = CommonUtility.getconnection())
		{
			return querydao.deleteQuery(connection,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
