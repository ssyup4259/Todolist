package summer.todolist.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import summer.todolist.domain.BoardVO;
import summer.todolist.service.BoardService;

@Controller
@RequestMapping("/todolist/*")

public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(BoardVO board, Model model) throws Exception {
		logger.info("register get...");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("할일을 생성합니다..........................");
		logger.info(board.toString());
		service.regist(board);
		return "redirect:/todolist/listAll";
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		logger.info("전체 할일 보기.............");
		model.addAttribute("list", service.listAll());
	}

	@RequestMapping(value = "/read", method = { RequestMethod.GET, RequestMethod.POST })
	public void read(@RequestParam("bnum") int bnum, Model model) throws Exception {
		model.addAttribute(service.read(bnum));
	}

	@RequestMapping(value = "/remove", method = { RequestMethod.GET, RequestMethod.POST })
	public String remove(@RequestParam("bnum") int bnum, RedirectAttributes rttr) throws Exception {
		service.remove(bnum);
		return "redirect:/todolist/listAll";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int bnum, Model model) throws Exception {
		model.addAttribute(service.read(bnum));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("modify post.....");
		service.modify(board);
		return "redirect:/todolist/listAll";
	}

	@RequestMapping(value = "/modifyFinish", method = RequestMethod.GET)
	public String modifyFinisth(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("할일을 다했습니다......");
		service.modifyFinish(board);
		return "redirect:/todolist/listAll";
	}
}
