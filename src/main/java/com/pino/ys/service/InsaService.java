package com.pino.ys.service;

import java.util.ArrayList;

import com.pino.ys.dto.boardDto;
import com.pino.ys.dto.insertDto;
import com.pino.ys.dto.setDto;

public interface InsaService {
	
	public ArrayList<setDto> setService();
	
	public int idCheck(String input);
	
	public void input(insertDto dto);
	
	public ArrayList<insertDto> selectInsa(boardDto bDto);
	
	public int deleteUser(ArrayList<String> delArr);
}
