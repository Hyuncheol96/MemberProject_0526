package com.its.member.controller;


import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/save-form")
    public String saveForm() {

        return "member/save";
    }

    // 회원가입 처리
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        boolean saveResult = memberService.save(memberDTO);
        if (saveResult) {
            return "/member/login";
        } else {
            return "/member/save-fail";
        }
    }

    @GetMapping("/login-form")
    public String loginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        System.out.println("memberDTO = " + memberDTO + ", model = " + model + ", session = " + session);
        MemberDTO loginMember = memberService.login(memberDTO);
        if(loginMember != null){
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
            return "redirect:/board/paging";
        } else {
            return "";
        }
    }

    @RequestMapping(value = "/logout-form",method=RequestMethod.GET)
    public String getLogout(HttpSession session) throws Exception{
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/admin-form")
    public String memberListForm() {
        return "/member/admin";
    }
    @GetMapping("/findAll") // 아래 findAll 안에 Model model = 전체 데이터를 가져가야 하기때문에 사용
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "/member/memberList";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        System.out.println("id = " + id);
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "/member/memberDetail";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        System.out.println("id = " + id);
        boolean deleteResult = memberService.delete(id);
        if (deleteResult) {
            // redirect: 컨트롤러의 메서드에서 다른 메서드의 주소를 호출
            // redirect를 이용하여 findAll 주소 요청
            return "redirect:/member/findAll";
        } else {
            return "delete-fail";
        }
    }


    @RequestMapping(value = "/mypage",method=RequestMethod.GET)
    public String getMypage(HttpSession session) throws Exception{
        session.invalidate();
        return "/member/mypage";
    }



    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        System.out.println("memberId = " + memberId);
        // memberId를 DB에서 중복값이 있는지 없는지 체크하고
        // 없으면 ok, 있으면 no 라는 String 값을 리턴받으세요.
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult; // ok.jsp 또는 no.jsp 를 찾음.
    }



}
