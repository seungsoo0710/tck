package com.tck.exam.board.model;

import java.util.List;

public interface BoardDAO {
	int insertBoard(BoardVO boardVo);
	List<BoardVO> selectBoard();
	BoardVO selectByBoardSeq(int boardSeq);
	int updateDelflag(int boardSeq);
	int updateHits(int boardSeq);
	int updateBoard(BoardVO boardVo);
}
	
