package com.service;

import java.util.ArrayList;

import com.beans.Query;

public interface QueryService {

	String addNewQuery(Query query);

	ArrayList<Query> getQueryList();

	String addanswer(Query query);

	int deleteQuery(int id);

}
