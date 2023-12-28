package com.jci.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jci.dao.StateDao;
import com.jci.model.StateList;

@Transactional
@Repository
public class StateDaoImpl implements StateDao {
	@Autowired
	SessionFactory sessionFactory;

	protected Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void create(StateList statelist) {
		currentSession().save(statelist);

	}

	@Override
	public void update(StateList statelist) {
		currentSession().update(statelist);

	}

	@Override
	public StateList edit(int id) {
		return find(id);
	}

	@Override
	public void delete(int id) {
		currentSession().delete(id);

	}

	@Override
	public StateList find(int id) {
		return (StateList) currentSession().get(StateList.class, id);
	}

	@Override
	public List<StateList> getAll() {
		// System.out.println("Hello From StateListModel");
		List<StateList> ll;
		Criteria c = this.sessionFactory.getCurrentSession().createCriteria(StateList.class);
		ll = c.list();
//		System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<,,");
//		
//		System.out.println(ll);
//		
//		System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<,,");
		return ll;
	}

	@Override
	public boolean submitform(StateList off) {
		this.sessionFactory.getCurrentSession().save(off);
		return false;
	}

	@Override
	public String getStateCode(String id) {
		String hqlString = "select state_code from tbl_states_new where id=" + id + "";
		Query query = this.sessionFactory.getCurrentSession().createSQLQuery(hqlString);
		String uniqueResult = (String) query.uniqueResult();
		System.out.println("data from dao " + uniqueResult + " ");
		return uniqueResult;

	}
	

}
