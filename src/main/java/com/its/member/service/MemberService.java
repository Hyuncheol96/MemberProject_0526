package com.its.member.service;


import com.its.member.dto.MemberDTO;

import com.its.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;


@Service
public class MemberService {



    @Autowired
    private MemberRepository memberRepository;
    public boolean save(MemberDTO memberDTO) {
        int saveResult = memberRepository.save(memberDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
        System.out.println("와ㅓㅆ니");
        MemberDTO loginMember = memberRepository.login(memberDTO);
        return loginMember;
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public boolean delete(Long id) {
        int deleteResult = memberRepository.delete(id);
        if (deleteResult > 0) {
            return true;
        } else {
            return false;
        }
    }


    public String duplicateCheck(String memberId) {
        String checkResult = memberRepository.duplicateCheck(memberId);
        if (checkResult == null) {
            return "ok";
        } else {
            return "no";
        }
    }


    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }
}

