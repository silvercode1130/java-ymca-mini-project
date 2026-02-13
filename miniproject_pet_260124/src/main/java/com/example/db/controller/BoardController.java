package com.example.db.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.db.constant.MyConstant;
import com.example.db.dao.BoardDao;
import com.example.db.dao.ReplyDao;
import com.example.db.service.BoardService;
import com.example.db.util.Paging;
import com.example.db.vo.BoardVo;
import com.example.db.vo.MemberVo;
import com.example.db.vo.ReplyVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {

    @Autowired
    BoardDao boardDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @Autowired
    BoardService boardService;

    @Autowired
    ReplyDao replyDao;


    // ===== 사이트 전체글 조회 (테스트용) =====
    @RequestMapping("/board/list.do")
    public String list(Model model) {
        List<BoardVo> list = boardDao.selectList();
        model.addAttribute("list", list);
        return "board/board_list";
    }

 // ===== 공지사항 목록 + 검색 + 페이징 =====
    @GetMapping("/notice/list.do")
    public String noticeList(@RequestParam(defaultValue = "1") int page,
                             @RequestParam(required = false) String searchType,
                             @RequestParam(required = false) String keyword,
                             Model model) throws UnsupportedEncodingException {

        int pageSize = MyConstant.Board.BLOCK_LIST;
        int start = (page - 1) * pageSize + 1;
        int end = page * pageSize;

        Map<String, Object> param = new HashMap<>();
        param.put("board_type_code", "NOTICE");
        param.put("board_tag", "ALL");
        param.put("searchType", searchType);
        param.put("keyword", keyword);
        param.put("start", start);
        param.put("end", end);

        int rowTotal = boardDao.selectRowTotalByTypeTagSearch(param);
        List<BoardVo> list = boardDao.selectPageListByTypeTagSearch(param);

        String sf = String.format(
                "searchType=%s&keyword=%s",
                searchType == null ? "" : searchType,
                keyword == null ? "" : URLEncoder.encode(keyword, "utf-8")
        );

        String pageMenu = Paging.getPaging3(
                "list.do",
                sf,
                page,
                rowTotal,
                MyConstant.Board.BLOCK_LIST,
                MyConstant.Board.BLOCK_PAGE
        );

        // 글쓰기 권한: NOTICE
        MemberVo user = (MemberVo) session.getAttribute("user");
        int minRole = boardDao.selectMinRoleByTypeCode("NOTICE");
        boolean canWrite = (user != null && user.getMem_role_idx() >= minRole);

        model.addAttribute("list", list);
        model.addAttribute("b_type", "notice");
        model.addAttribute("page", page);
        model.addAttribute("rowTotal", rowTotal);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageMenu", pageMenu);
        model.addAttribute("canWrite", canWrite);

        return "home/notice_list";
    }

    // ===== 이벤트 목록 + 검색 + 페이징 =====
    @GetMapping("/event/list.do")
    public String eventList(@RequestParam(defaultValue = "1") int page,
                            @RequestParam(required = false) String searchType,
                            @RequestParam(required = false) String keyword,
                            Model model) throws UnsupportedEncodingException {

        int pageSize = MyConstant.Board.BLOCK_LIST;
        int start = (page - 1) * pageSize + 1;
        int end = page * pageSize;

        Map<String, Object> param = new HashMap<>();
        param.put("board_type_code", "EVENT");
        param.put("board_tag", "ALL");
        param.put("searchType", searchType);
        param.put("keyword", keyword);
        param.put("start", start);
        param.put("end", end);

        int rowTotal = boardDao.selectRowTotalByTypeTagSearch(param);
        List<BoardVo> list = boardDao.selectPageListByTypeTagSearch(param);

        String sf = String.format(
                "searchType=%s&keyword=%s",
                searchType == null ? "" : searchType,
                keyword == null ? "" : URLEncoder.encode(keyword, "utf-8")
        );

        String pageMenu = Paging.getPaging3(
                "list.do",
                sf,
                page,
                rowTotal,
                MyConstant.Board.BLOCK_LIST,
                MyConstant.Board.BLOCK_PAGE
        );

        MemberVo user = (MemberVo) session.getAttribute("user");
        int minRole = boardDao.selectMinRoleByTypeCode("EVENT");
        boolean canWrite = (user != null && user.getMem_role_idx() >= minRole);

        model.addAttribute("list", list);
        model.addAttribute("b_type", "event");
        model.addAttribute("page", page);
        model.addAttribute("rowTotal", rowTotal);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageMenu", pageMenu);
        model.addAttribute("canWrite", canWrite);

        return "home/event_list";
    }

    // ===== LAB 목록 + 태그 + 검색 + 페이징 =====
    @GetMapping("/lab/list.do")
    public String labList(@RequestParam(defaultValue = "ALL") String tag,
                          @RequestParam(defaultValue = "1") int page,
                          @RequestParam(required = false) String searchType,
                          @RequestParam(required = false) String keyword,
                          Model model) throws UnsupportedEncodingException {

        int pageSize = MyConstant.Board.BLOCK_LIST;
        int start = (page - 1) * pageSize + 1;
        int end = page * pageSize;

        Map<String, Object> param = new HashMap<>();
        param.put("board_type_code", "LAB");
        param.put("board_tag", tag);
        param.put("searchType", searchType);
        param.put("keyword", keyword);
        param.put("start", start);
        param.put("end", end);

        int rowTotal = boardDao.selectRowTotalByTypeTagSearch(param);
        List<BoardVo> list = boardDao.selectPageListByTypeTagSearch(param);

        String sf = String.format(
                "tag=%s&searchType=%s&keyword=%s",
                tag,
                searchType == null ? "" : searchType,
                keyword == null ? "" : URLEncoder.encode(keyword, "utf-8")
        );

        String pageMenu = Paging.getPaging3(
                "list.do",
                sf,
                page,
                rowTotal,
                MyConstant.Board.BLOCK_LIST,
                MyConstant.Board.BLOCK_PAGE
        );

        MemberVo user = (MemberVo) session.getAttribute("user");
        int minRole = boardDao.selectMinRoleByTypeCode("LAB");
        boolean canWrite = (user != null && user.getMem_role_idx() >= minRole);

        model.addAttribute("list", list);
        model.addAttribute("tag", tag);
        model.addAttribute("b_type", "lab");
        model.addAttribute("page", page);
        model.addAttribute("rowTotal", rowTotal);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageMenu", pageMenu);
        model.addAttribute("canWrite", canWrite);

        return "lab/lab_list";
    }

    // ===== QnA 목록 + 태그 + 검색 + 페이징 =====
    @GetMapping("/qna/list.do")
    public String qnaList(@RequestParam(defaultValue = "ALL") String tag,
                          @RequestParam(defaultValue = "1") int page,
                          @RequestParam(required = false) String searchType,
                          @RequestParam(required = false) String keyword,
                          Model model) throws UnsupportedEncodingException {

        int pageSize = MyConstant.Board.BLOCK_LIST;
        int start = (page - 1) * pageSize + 1;
        int end = page * pageSize;

        Map<String, Object> param = new HashMap<>();
        param.put("board_type_code", "QNA");
        param.put("board_tag", tag);
        param.put("searchType", searchType);
        param.put("keyword", keyword);
        param.put("start", start);
        param.put("end", end);

        int rowTotal = boardDao.selectRowTotalByTypeTagSearch(param);
        List<BoardVo> list = boardDao.selectPageListByTypeTagSearch(param);

        String sf = String.format(
                "tag=%s&searchType=%s&keyword=%s",
                tag,
                searchType == null ? "" : searchType,
                keyword == null ? "" : URLEncoder.encode(keyword, "utf-8")
        );

        String pageMenu = Paging.getPaging3(
                "list.do",
                sf,
                page,
                rowTotal,
                MyConstant.Board.BLOCK_LIST,
                MyConstant.Board.BLOCK_PAGE
        );

        MemberVo user = (MemberVo) session.getAttribute("user");
        int minRole = boardDao.selectMinRoleByTypeCode("QNA");
        boolean canWrite = (user != null && user.getMem_role_idx() >= minRole);

        model.addAttribute("list", list);
        model.addAttribute("tag", tag);
        model.addAttribute("b_type", "qna");
        model.addAttribute("page", page);
        model.addAttribute("rowTotal", rowTotal);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageMenu", pageMenu);
        model.addAttribute("canWrite", canWrite);

        return "community/qna_list";
    }

    // ===== FREE 목록 + 태그 + 검색 + 페이징 =====
    @GetMapping("/free/list.do")
    public String freeList(@RequestParam(defaultValue = "ALL") String tag,
                           @RequestParam(defaultValue = "1") int page,
                           @RequestParam(required = false) String searchType,
                           @RequestParam(required = false) String keyword,
                           Model model) throws UnsupportedEncodingException {

        int pageSize = MyConstant.Board.BLOCK_LIST;
        int start = (page - 1) * pageSize + 1;
        int end = page * pageSize;

        Map<String, Object> param = new HashMap<>();
        param.put("board_type_code", "FREE");
        param.put("board_tag", tag);
        param.put("searchType", searchType);
        param.put("keyword", keyword);
        param.put("start", start);
        param.put("end", end);

        int rowTotal = boardDao.selectRowTotalByTypeTagSearch(param);
        List<BoardVo> list = boardDao.selectPageListByTypeTagSearch(param);

        String sf = String.format(
                "tag=%s&searchType=%s&keyword=%s",
                tag,
                searchType == null ? "" : searchType,
                keyword == null ? "" : URLEncoder.encode(keyword, "utf-8")
        );

        String pageMenu = Paging.getPaging3(
                "list.do",
                sf,
                page,
                rowTotal,
                MyConstant.Board.BLOCK_LIST,
                MyConstant.Board.BLOCK_PAGE
        );

        MemberVo user = (MemberVo) session.getAttribute("user");
        int minRole = boardDao.selectMinRoleByTypeCode("FREE");
        boolean canWrite = (user != null && user.getMem_role_idx() >= minRole);

        model.addAttribute("list", list);
        model.addAttribute("tag", tag);
        model.addAttribute("b_type", "free");
        model.addAttribute("page", page);
        model.addAttribute("rowTotal", rowTotal);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageMenu", pageMenu);
        model.addAttribute("canWrite", canWrite);

        return "community/free_list";
    }


    // ===== 게시글 상세 =====
    @GetMapping("/{b_type}/view.do")
    public String view(@PathVariable String b_type,
                       @RequestParam int board_idx,
                       @RequestParam(defaultValue = "1") int page,
                       @RequestParam(required = false, defaultValue = "ALL") String tag,
                       Model model) {

        String typeCode = b_type.toUpperCase();
        BoardVo vo = boardDao.selectOneByIdxAndTypeCode(board_idx, typeCode);

        if (session.getAttribute("show_" + board_idx) == null) {
            boardDao.updateReadhit(board_idx);
            session.setAttribute("show_" + board_idx, true);
        }

        model.addAttribute("vo", vo);
        model.addAttribute("b_type", b_type);
        model.addAttribute("page", page);
        model.addAttribute("tag", tag);

        String canComment = vo.getBoardType().getBoard_can_comment(); // Y / N

        if ("Y".equals(canComment)) {
            List<ReplyVo> replyList = replyDao.selectListByBoardIdx(board_idx);
            model.addAttribute("replyList", replyList);
            return "board/board_view_comment";
        } else {
            return "board/board_view";
        }
    }

    // ===== 글쓰기 폼 =====
    @GetMapping("/{b_type}/insert_form.do")
    public String insertForm(@PathVariable String b_type,
                             @RequestParam(required = false, defaultValue = "ALL") String tag,
                             Model model) {

        model.addAttribute("b_type", b_type);
        model.addAttribute("tag", tag);

        return "community/board_insert_form";
    }

    // ===== 글쓰기 =====
    @PostMapping("/{b_type}/insert.do")
    public String insert(@PathVariable String b_type,
                         @RequestParam(required = false, defaultValue = "ALL") String tag,
                         BoardVo vo,
                         RedirectAttributes ra) {

        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            ra.addAttribute("reason", "session_timeout");
            return "redirect:/member/loginForm.do";
        }

        String board_ip = request.getRemoteAddr();
        vo.setBoard_ip(board_ip);
        vo.setMem_idx(user.getMem_idx());

        String typeCode = b_type.toUpperCase();
        int board_type_idx = boardDao.selectTypeIdxByCode(typeCode);
        vo.setBoard_type_idx(board_type_idx);

        int res = boardService.insertBoardWithThumbnail(vo);

        ra.addAttribute("tag", tag);
        return "redirect:/" + b_type + "/list.do";
    }

    // ===== 수정 폼 =====
    @GetMapping("/{b_type}/modify_form.do")
    public String updateForm(@PathVariable String b_type,
                             @RequestParam int board_idx,
                             @RequestParam(defaultValue = "1") int page,
                             @RequestParam(required = false, defaultValue = "ALL") String tag,
                             Model model,
                             RedirectAttributes ra) {

        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            ra.addAttribute("reason", "session_timeout");
            ra.addAttribute("page", page);
            ra.addAttribute("tag", tag);
            return "redirect:/member/loginForm.do";
        }

        String typeCode = b_type.toUpperCase();
        BoardVo vo = boardDao.selectOneByIdxAndTypeCode(board_idx, typeCode);

        if (vo == null) {
            ra.addAttribute("reason", "not_found");
            ra.addAttribute("page", page);
            ra.addAttribute("tag", tag);
            return "redirect:/" + b_type + "/list.do";
        }

        boolean isOwner = vo.getMem_idx() == user.getMem_idx();
        boolean isAdmin = user.getMem_role_idx() == 3;
        if (!isOwner && !isAdmin) {
            ra.addAttribute("reason", "no_permission");
            ra.addAttribute("page", page);
            ra.addAttribute("tag", tag);
            return "redirect:/" + b_type + "/list.do";
        }

        model.addAttribute("vo", vo);
        model.addAttribute("b_type", b_type);
        model.addAttribute("page", page);
        model.addAttribute("tag", tag);

        return "board/board_modify_form";
    }

    // ===== 수정 처리 =====
    @PostMapping("/{b_type}/modify.do")
    public String update(@PathVariable String b_type,
                         @RequestParam int board_idx,
                         @RequestParam(defaultValue = "1") int page,
                         @RequestParam(required = false, defaultValue = "ALL") String tag,
                         BoardVo formVo,
                         RedirectAttributes ra) {

        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            ra.addAttribute("reason", "session_timeout");
            ra.addAttribute("page", page);
            ra.addAttribute("tag", tag);
            return "redirect:/member/loginForm.do";
        }

        String typeCode = b_type.toUpperCase();
        BoardVo originVo = boardDao.selectOneByIdxAndTypeCode(board_idx, typeCode);
        if (originVo == null) {
            ra.addAttribute("reason", "not_found");
            ra.addAttribute("page", page);
            ra.addAttribute("tag", tag);
            return "redirect:/" + b_type + "/list.do";
        }

        boolean isOwner = originVo.getMem_idx() == user.getMem_idx();
        boolean isAdmin = user.getMem_role_idx() == 3;
        if (!isOwner && !isAdmin) {
            ra.addAttribute("reason", "no_permission");
            ra.addAttribute("page", page);
            ra.addAttribute("tag", tag);
            return "redirect:/" + b_type + "/list.do";
        }

        String board_ip = request.getRemoteAddr();

        originVo.setBoard_title(formVo.getBoard_title());
        originVo.setBoard_content(formVo.getBoard_content());
        originVo.setBoard_tag(formVo.getBoard_tag());
        originVo.setBoard_ip(board_ip);

        int res = boardService.updateBoardWithThumbnail(originVo);
        System.out.println(">>> update res = " + res);

        ra.addAttribute("board_idx", board_idx);
        ra.addAttribute("page", page);
        ra.addAttribute("tag", tag);
        return "redirect:/" + b_type + "/view.do?board_idx=" + board_idx + "&page=" + page + "&tag=" + tag;
    }

    // ===== 게시글 삭제(soft delete) =====
    @PostMapping("/{b_type}/delete.do")
    public String delete(@PathVariable String b_type,
                         @RequestParam int board_idx,
                         @RequestParam(defaultValue = "1") int page,
                         @RequestParam(required = false, defaultValue = "ALL") String tag,
                         RedirectAttributes ra) {

        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            ra.addAttribute("reason", "session_timeout");
            return "redirect:/member/loginForm.do";
        }

        BoardVo vo = boardDao.selectOne(board_idx);
        if (vo == null || (vo.getMem_idx() != user.getMem_idx() && user.getMem_role_idx() != 3)) {
            ra.addAttribute("reason", "no_permission");
            ra.addAttribute("page", page);
            ra.addAttribute("tag", tag);
            return "redirect:/" + b_type + "/list.do";
        }

        boardDao.softDelete(board_idx);

        ra.addAttribute("page", page);
        ra.addAttribute("tag", tag);
        return "redirect:/" + b_type + "/list.do";
    }
}
