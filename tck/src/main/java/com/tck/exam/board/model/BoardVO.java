package com.tck.exam.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int boardSeq;
	private String title;
	private String boardContents;
	private int hits;
	private Timestamp regDate;
	private String writer;
	private String pwd;
	private String delFlag;
	private Timestamp delDate;
	
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public Timestamp getDelDate() {
		return delDate;
	}
	public void setDelDate(Timestamp delDate) {
		this.delDate = delDate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardSeq=" + boardSeq + ", title=" + title + ", boardContents=" + boardContents + ", hits="
				+ hits + ", regDate=" + regDate + ", writer=" + writer + ", pwd=" + pwd + ", delFlag=" + delFlag
				+ ", delDate=" + delDate + ", getBoardSeq()=" + getBoardSeq() + ", getTitle()=" + getTitle()
				+ ", getBoardContents()=" + getBoardContents() + ", getHits()=" + getHits() + ", getRegDate()="
				+ getRegDate() + ", getWriter()=" + getWriter() + ", getPwd()=" + getPwd() + ", getDelFlag()="
				+ getDelFlag() + ", getDelDate()=" + getDelDate() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
