package com.pino.ys.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pino.ys.dao.InsaDao;
import com.pino.ys.dto.setDto;

@Service
public class InsaServiceImpl implements InsaService {

	@Autowired
	private InsaDao insaDao;

	@Override
	public ArrayList<setDto> setService() {
		return insaDao.setService();
	}

	@Override
	public int idCheck(String input) {
		return insaDao.idCheck(input);
	}

}
