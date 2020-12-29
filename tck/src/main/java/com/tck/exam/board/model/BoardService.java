package com.tck.exam.board.model;

import java.util.List;

public interface BoardService {
	public int insertBoard(BoardVO boardVo);
	public List<BoardVO> selectBoard();
	public BoardVO selectByBoardSeq(int boardSeq);
	public int updateDelflag(int boardSeq);
	public int updateHits(int boardSeq);
	public int updateBoard(BoardVO boardVo);
}
