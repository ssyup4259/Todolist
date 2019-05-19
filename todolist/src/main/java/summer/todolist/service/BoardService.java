package summer.todolist.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import summer.todolist.domain.BoardVO;

public interface BoardService {

	public void regist(BoardVO board) throws Exception;

	public BoardVO read(int bnum) throws Exception;

	public void modify(BoardVO board) throws Exception;

	public void modifyFinish(BoardVO board) throws Exception;

	public void remove(int bnum) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listToday() throws Exception;
	
	public List<BoardVO> listOver() throws Exception;
}
