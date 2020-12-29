package com.tck.exam.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.board.";

	@Override
	public int insertBoard(BoardVO boardVo) {
		int cnt=sqlSession.insert(namespace+"insertBoard", boardVo);
		return cnt;
	}

	@Override
	public List<BoardVO> selectBoard() {
		List<BoardVO> list=sqlSession.selectList(namespace+"selectBoard");
		return list;
	}

	@Override
	public BoardVO selectByBoardSeq(int boardSeq) {
		BoardVO boardVo=sqlSession.selectOne(namespace+"selectByBoardSeq", boardSeq);
		return boardVo;
	}

	@Override
	public int updateDelflag(int boardSeq) {
		int cnt=sqlSession.update(namespace+"updateDelflag", boardSeq);
		return cnt;
	}

	@Override
	public int updateHits(int boardSeq) {
		int cnt=sqlSession.update(namespace+"updateHits", boardSeq);
		return cnt;
	}

	@Override
	public int updateBoard(BoardVO boardVo) {
		int cnt=sqlSession.update(namespace+"updateBoard", boardVo);
		return cnt;
	}
	

}
