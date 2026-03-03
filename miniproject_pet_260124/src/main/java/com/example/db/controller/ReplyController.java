package com.example.db.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.db.constant.MyConstant;
import com.example.db.dao.ReplyDao;
import com.example.db.vo.MemberVo;
import com.example.db.vo.ReplyVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/reply/")
public class ReplyController {

    @Autowired
    private ReplyDao replyDao;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpSession session;

    /**
     * 댓글 리스트 (페이징)
     * /reply/list.do?board_idx=10&page=1
     */
    @RequestMapping("list.do")
    public String list(@RequestParam("board_idx") int boardIdx,
                       @RequestParam(name = "page", defaultValue = "1") int nowPage,
                       Model model) {

        Map<String, Object> map = new HashMap<>();
        map.put("board_idx", boardIdx);

        int start = (nowPage - 1) * MyConstant.Reply.BLOCK_LIST + 1;
        int end   = start + MyConstant.Reply.BLOCK_LIST - 1;

        map.put("start", start);
        map.put("end", end);

        List<ReplyVo> list = replyDao.selectConditionList(map);

        model.addAttribute("replyList", list);
        model.addAttribute("board_idx", boardIdx);
        model.addAttribute("page", nowPage);

        return "reply/reply_list";
    }

    /**
     * 원댓글 등록
     * POST /reply/insert.do
     * param: board_idx, reply_content
     */
    @PostMapping("insert.do")
    @ResponseBody
    public Map<String, Boolean> insert(ReplyVo vo) {

        // 로그인 유저
        MemberVo user = (MemberVo) session.getAttribute("user");
        Map<String, Boolean> result = new HashMap<>();

        if (user == null) {
            result.put("result", false);
            return result;
        }

        vo.setMem_idx(user.getMem_idx());

        String ip = request.getRemoteAddr();
        vo.setReply_ip(ip);

        // 원댓글은 mapper에서 ref/step/depth 세팅
        int res = replyDao.insert(vo);

        result.put("result", res == 1);
        return result;
    }

    /**
     * 대댓글 등록
     * POST /reply/rereply.do
     * param: reply_idx(기준댓글), board_idx, reply_content
     */
    @PostMapping("rereply.do")
    @ResponseBody
    public Map<String, Boolean> rereply(@RequestParam("reply_idx") int baseReplyIdx,
                                        @RequestParam("board_idx") int boardIdx,
                                        @RequestParam("reply_content") String replyContent) {

        Map<String, Boolean> result = new HashMap<>();

        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            result.put("result", false);
            return result;
        }

        // 기준 댓글 정보
        ReplyVo baseVo = replyDao.selectOne(baseReplyIdx);
        if (baseVo == null) {
            result.put("result", false);
            return result;
        }

        // 기준 댓글보다 step 큰 애들 밀기
        ReplyVo forStep = new ReplyVo();
        forStep.setReply_ref(baseVo.getReply_ref());
        forStep.setReply_step(baseVo.getReply_step());
        replyDao.updateStep(forStep);

        // 대댓글 VO 세팅
        ReplyVo vo = new ReplyVo();
        vo.setBoard_idx(boardIdx);
        vo.setMem_idx(user.getMem_idx());
        vo.setReply_content(replyContent);
        vo.setReply_ip(request.getRemoteAddr());

        vo.setReply_ref(baseVo.getReply_ref());
        vo.setReply_step(baseVo.getReply_step() + 1);
        vo.setReply_depth(baseVo.getReply_depth() + 1);

        int res = replyDao.rereply(vo);
        result.put("result", res == 1);
        return result;
    }

    /**
     * 댓글 수정
     * POST /reply/update.do
     */
    @PostMapping("update.do")
    @ResponseBody
    public Map<String, Boolean> update(ReplyVo vo) {
        Map<String, Boolean> result = new HashMap<>();

        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            result.put("result", false);
            return result;
        }

        // 작성자 또는 관리자만 허용 (실제 권한 체크는 서비스에서 한 번 더 하는 게 안전)
        ReplyVo dbVo = replyDao.selectOne(vo.getReply_idx());
        if (dbVo == null || (dbVo.getMem_idx() != user.getMem_idx() && user.getMem_role_idx() != 3)) {
            result.put("result", false);
            return result;
        }

        int res = replyDao.update(vo);
        result.put("result", res == 1);
        return result;
    }

    /**
     * 댓글 삭제 (soft delete)
     * POST /reply/delete.do
     */
    @PostMapping("delete.do")
    @ResponseBody
    public Map<String, Boolean> delete(@RequestParam("reply_idx") int replyIdx) {
        Map<String, Boolean> result = new HashMap<>();

        MemberVo user = (MemberVo) session.getAttribute("user");
        if (user == null) {
            result.put("result", false);
            return result;
        }

        ReplyVo dbVo = replyDao.selectOne(replyIdx);
        if (dbVo == null || (dbVo.getMem_idx() != user.getMem_idx() && user.getMem_role_idx() != 3)) {
            result.put("result", false);
            return result;
        }

        int res = replyDao.softDelete(replyIdx);
        result.put("result", res == 1);
        return result;
    }
}
