package com.myweb.somoim.common.abstracts;

public abstract class AbstractService<C, E> {
	public abstract C getAll();
	
	public abstract C getDatas(int i);

	public abstract C getDatas(String s);

	public abstract E getData(int i);

	public abstract E getData(String s);

	public abstract E getData(E e);
	
	public abstract boolean addData(E e);
	
	public abstract boolean modifyData(E e);
	
	public abstract boolean removeData(E e);
	
	public abstract boolean removeData(int i);
}
