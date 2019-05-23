package com.pzhu.bookstore.dao;

import java.util.List;

import com.pzhu.bookstore.pojo.Kind;


public interface KindDao {

	public List<Kind> findAllKind();

	public Kind findKindByType(String type);

	public void addKind(Kind kind);

	public void updateKind(Kind kind);

	public void deleteKindById(Kind kind);

	public Kind findById(String kId);

	public Kind findKindById(String category);
}
