package summer.todolist.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import summer.todolist.domain.BoardVO;
import summer.todolist.persistence.BoardDAO;
import summer.todolist.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
	}

	@Override
	public BoardVO read(int bnum) throws Exception {
		return dao.read(bnum);
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
	}

	@Override
	public void modifyFinish(BoardVO board) throws Exception {
		dao.updateFinish(board);

	}

	@Override
	public void remove(int bnum) throws Exception {
		dao.delete(bnum);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listToday() throws Exception {
		return dao.listToday();
	}

	@Override
	public List<BoardVO> listOver() throws Exception {
		return dao.listOver();
	}

}