package com.tck.exam.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tck.exam.common.PaginationInfo;

import oracle.net.aso.p;

import com.tck.exam.board.model.BoardService;
import com.tck.exam.board.model.BoardVO;


@Controller
public class BoardController {
	private final Logger logger
		=LoggerFactory.getLogger(BoardController.class);
	
	public static final int BLOCK_SIZE=3; 
	public static final int Record_CountPerPage=5; 
	public static final int MY_IP=999;
	
	@Autowired
	private BoardService boardService;	
	
	//게시글 목록
	@RequestMapping(value = "/boardList.do")
	public String list(Model model) {
		
		List<BoardVO> list=boardService.selectBoard();
		
		logger.info("list.size={}", list.size());		
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Record_CountPerPage);
		pagingInfo.setCurrentPage(1);
						
		pagingInfo.setTotalRecord(list.size());
		pagingInfo.setTotalPage((int)Math.ceil((float)list.size()/Record_CountPerPage));
		pagingInfo.setFirstPage(pagingInfo.getCurrentPage()-((pagingInfo.getCurrentPage()-1)%BLOCK_SIZE));
		pagingInfo.setLastPage(pagingInfo.getFirstPage()+(BLOCK_SIZE-1));
		pagingInfo.setFirstRecordIndex((pagingInfo.getCurrentPage() - 1) * Record_CountPerPage);
		pagingInfo.setLastRecordIndex(pagingInfo.getCurrentPage() * Record_CountPerPage);
		
		logger.info("pagingInfo={}",pagingInfo);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "board/boardList";		
	}	
	
	//게시판 글등록
	@RequestMapping(value ="/board/write.do", method = RequestMethod.GET)
	public String boardWrite_get() {
		logger.info("게시판 글등록");
		
		return "board/boardWrite";		
	}
	
	//게시판 글등록 처리
	@RequestMapping(value ="/board/write.do", method = RequestMethod.POST)
	public String boardWrite_post(@ModelAttribute BoardVO boardVo, Model model, HttpServletRequest request) {
		logger.info("글등록 처리, boardVo={}",boardVo);
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null)
			ip = request.getRemoteAddr();
		logger.info(ip);
		boardVo.setWriter(ip);
		
		int cnt=boardService.insertBoard(boardVo);
		
		String msg="", url="";
		logger.info("글등록 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="게시글이 등록되었습니다.";
			url="/boardList.do";
		}else {
			msg="게시글 등록 실패!";
			url="/board/write.do";
		}
			
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";					
	}	
	
	//게시글 상세조회
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(defaultValue = "0") int boardSeq, Model model, HttpServletRequest request) {
		logger.info("상세보기 파라미터, boardSeq={}", boardSeq);
		if(boardSeq==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/boardList.do");
			
			return "common/message";
		}
		
		BoardVO boardVo=boardService.selectByBoardSeq(boardSeq);
		logger.info("상세보기 결과, boardVo={}", boardVo);
		
		if(boardVo.getPwd()==null) {
			int cnt=boardService.updateHits(boardSeq);
			logger.info("게시글 조회수 업데이트 결과, cnt={}", cnt);
			
			String ip = request.getHeader("X-FORWARDED-FOR");
			if (ip == null)
				ip = request.getRemoteAddr();
			logger.info("접속자 ip="+ip);
			
			int myIp=0;
			if(boardVo.getWriter().equals(ip)) {
				myIp=MY_IP;
			}		
			
			model.addAttribute("boardVo", boardVo);
			model.addAttribute("myIp", myIp);
			
			return "board/boardDetail";
		}
		return "board/chkPwd";
	}	
	
	//게시판 글삭제
	@RequestMapping(value="/board/delete.do", method = RequestMethod.GET)
	public String delete_get(@RequestParam(defaultValue = "0") int boardSeq, Model model){
		logger.info("글 삭제 , boardSeq={}", boardSeq);
		
		int cnt=boardService.updateDelflag(boardSeq);
					
		String msg="", url="";
		logger.info("글 삭제 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="게시글이 삭제되었습니다.";
			url="/boardList.do";
		}else {
			msg="게시글 삭제 실패!";
			url="/board/detail.do?boardSeq="+boardSeq;
		}
			
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//게시글 수정
	@RequestMapping(value="/board/edit.do", method =RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int boardSeq,
			Model model) {
		logger.info("수정화면, boardSeq={}", boardSeq);		
		if(boardSeq==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/list.do");
			
			return "common/message";
		}
		
		BoardVO boardVo=boardService.selectByBoardSeq(boardSeq);
		logger.info("수정화면 결과, boardVo={}", boardVo);
		
		model.addAttribute("boardVo", boardVo);
		
		return "board/boardEdit";
	}
	
	//게시글 수정 처리
	@RequestMapping(value = "/board/edit.do", method = RequestMethod.POST)
	public String adminEdit_post(@ModelAttribute BoardVO boardVo, Model model) {
		logger.info("게시글 수정 처리, boardVo={}", boardVo);
		
		int cnt=boardService.updateBoard(boardVo);
		
		String msg="수정 실패", url="/board/edit.do?boardSeq="+boardVo.getBoardSeq();
		
		if(cnt>0) {
			msg="수정되었습니다.";
			url="/boardList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
		
}