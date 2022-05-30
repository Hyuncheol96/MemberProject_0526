package com.its.member.service;

import com.its.member.dto.CommentDTO;
import com.its.member.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;
    public void save(CommentDTO commentDTO) {
    }

    public List<CommentDTO> paging(Long boardId) {
        return commentRepository.paging(boardId);
    }

}
