package com.pino.ys.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.pino.ys.dto.boardDto;
import com.pino.ys.dto.insertDto;
import com.pino.ys.dto.setDto;


@Mapper
public interface InsaDao {
	
	public ArrayList<setDto> setService(); 
	
	public int idCheck(String input);

	public void input(insertDto dto); 
	
	public ArrayList<insertDto> selectInsa(boardDto bDto);
	
	public int deleteUser(ArrayList<String> delArr);
	
	public int countBoard(boardDto bDto);
	
	public insertDto selectOne(String sabun);
	
	public void updateUser(insertDto dto);
	
}
