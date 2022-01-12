package com.pino.ys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pino.ys.dao.InsaDao;
import com.pino.ys.dto.boardDto;
import com.pino.ys.dto.insertDto;
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
	@Override
	public void input(insertDto dto) {
		insaDao.input(dto);
	}

	@Override
	public ArrayList<insertDto> selectInsa(boardDto bDto) {
		return insaDao.selectInsa(bDto);
	}

	@Override
	public int deleteUser(ArrayList<String> delArr) {
		return insaDao.deleteUser(delArr);
		
	}

	@Override
	public int countBoard(boardDto bDto) {
		return insaDao.countBoard(bDto);
	}

	@Override
	public insertDto selectOne(String sabun) {
		return insaDao.selectOne(sabun);
	}

	@Override
	public void update(insertDto dto) {
		insaDao.updateUser(dto);
	}

	@Override
	public insertDto selectImg(String sabun) {
		return insaDao.selectImg(sabun);
	}


	



}
