package com.its.member.service;

import com.its.member.dto.BoardDTO;
import com.its.member.dto.PageDTO;
import com.its.member.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

        private static final int PAGE_LIMIT = 5;     // 한 페이지에 보여줄 글 개수
    private static final int BLOCK_LIMIT = 3;    // 목록페이지 아래 보여줄 버튼 개수
    public List<BoardDTO> pagingList(int page) {
        // 1페이지 요청
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        int memberCount = boardRepository.boardCount(); // 글 개수 조회
        // 필요한 전체 페이지 개수
        // 10, 3 10/3 = 3.3333 => 4
        int maxPage = (int)(Math.ceil((double) memberCount / PAGE_LIMIT)); // int로 강제 형변환
        // 시작페이지 1 4 7 10 ~~~
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 시작페이지 1 4 7 10 ~~~
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }
}
