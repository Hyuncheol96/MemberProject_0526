package com.its.member.repository;

import com.its.member.dto.BoardDTO;
import com.its.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(MemberDTO memberDTO) {
        return sql.insert("Member.save", memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        System.out.println("ddddd");
        return sql.selectOne("Member.login", memberDTO);
    }



    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.duplicate", memberId);
    }
}
