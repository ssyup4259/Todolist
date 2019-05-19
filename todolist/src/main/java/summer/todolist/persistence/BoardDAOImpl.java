package summer.todolist.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import summer.todolist.domain.BoardVO;
import summer.todolist.persistence.BoardDAO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "summer.todolist.mapper.BoardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		int bnum = session.selectOne(namespace + ".maxNum");
		vo.setBnum(bnum + 1);
		session.insert(namespace + ".create", vo);
	}

	@Override
	public BoardVO read(int bnum) throws Exception {
		return session.selectOne(namespace + ".read", bnum);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void updateFinish(BoardVO vo) throws Exception {
		session.update(namespace + ".updateFinish", vo);
	}

	@Override
	public void delete(int bnum) throws Exception {
		session.delete(namespace + ".delete", bnum);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<BoardVO> listToday() throws Exception {
		return session.selectList(namespace + ".listToday");
	}
	@Override
	public List<BoardVO> listOver() throws Exception {
		return session.selectList(namespace + ".listOver");
	}


}
