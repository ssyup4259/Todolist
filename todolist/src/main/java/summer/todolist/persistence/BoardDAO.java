package summer.todolist.persistence;

import java.util.List;

import summer.todolist.domain.BoardVO;

public interface BoardDAO {
	public void create(BoardVO vo) throws Exception;

	public BoardVO read(int bnum) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void updateFinish(BoardVO vo) throws Exception;

	public void delete(int bnum) throws Exception;

	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listToday() throws Exception;
	
	public List<BoardVO> listOver() throws Exception;


}
