package com.example.db.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.db.dao.BoardDao;
import com.example.db.vo.BoardVo;

@Service
public class BoardService {

    @Autowired
    private BoardDao boardDao;

    // 게시글 + 썸네일 처리까지 포함한 저장
    public int insertBoardWithThumbnail(BoardVo vo) {

        // 1. board_content에서 첫 번째 <img> src 추출
        String thumbnail = extractFirstImageSrc(vo.getBoard_content());
        vo.setBoard_thumbnail(thumbnail);

        // 2. 실제 insert 수행
        return boardDao.insert(vo);
    }

    // HTML에서 첫 번째 <img ... src="...">의 src를 추출하는 메서드
    private String extractFirstImageSrc(String html) {
        if (html == null || html.isEmpty()) {
            return null;
        }

        // 정규식: 첫 번째 img 태그의 src 속성만 잡기
        // <img ... src="여기" ...> 에서 "여기" 부분만 그룹으로 추출
        java.util.regex.Pattern pattern =
                java.util.regex.Pattern.compile("<img[^>]*src=[\"']([^\"']+)[\"'][^>]*>",
                                                java.util.regex.Pattern.CASE_INSENSITIVE);
        java.util.regex.Matcher matcher = pattern.matcher(html);

        if (matcher.find()) {
            return matcher.group(1); // 첫 번째 img의 src
        }

        // 이미지 없으면 썸네일 없음
        return null;
    }
    
    
    // 게시글 수정용 썸네일 저장 메서드
    public int updateBoardWithThumbnail(BoardVo vo) {
    	
        String thumb = extractFirstImageSrc(vo.getBoard_content());
        vo.setBoard_thumbnail(thumb);
        
        return boardDao.update(vo);
    }

}
