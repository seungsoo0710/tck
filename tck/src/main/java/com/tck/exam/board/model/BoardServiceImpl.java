package com.tck.exam.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	@Override
	public int insertBoard(BoardVO boardVo) {
		return boardDao.insertBoard(boardVo);
	}

	@Override
	public List<BoardVO> selectBoard() {
		return boardDao.selectBoard();
	}

	@Override
	public BoardVO selectByBoardSeq(int boardSeq) {		
		return boardDao.selectByBoardSeq(boardSeq);
	}

	@Override
	public int updateDelflag(int boardSeq) {
		return boardDao.updateDelflag(boardSeq);
	}

	@Override
	public int updateHits(int boardSeq) {
		return boardDao.updateHits(boardSeq);
	}

	@Override
	public int updateBoard(BoardVO boardVo) {
		return boardDao.updateBoard(boardVo);
	}

	
}
