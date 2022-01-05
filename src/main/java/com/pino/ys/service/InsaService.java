package com.pino.ys.service;

import java.util.ArrayList;

import com.pino.ys.dto.setDto;

public interface InsaService {
	
	public ArrayList<setDto> setService();
	
	public int idCheck(String input);
}
