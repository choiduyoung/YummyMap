package com.yummymap.mmy.Service.main.review;

import java.util.List;

public interface ContentsService <T> {
	int insertContents(T DTO);
	int updateContents(T DTO);
	int deleteContents(T DTO);
	<K>List<T> getAllList(K key);
}
