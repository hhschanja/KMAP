package com.kmap.board;

import java.util.List;

import com.kmap.util.RowMaker;

public interface BoardDAO {
	//쓰기
	public int write(BoardDTO bdto);
	//보기
	public BoardDTO view(int num);
	//리스트
	public List<BoardDTO> list(RowMaker rowMaker);
	//삭제
	public int delete(int num);
	//수정
	public int update(BoardDTO bdto);
	

}
