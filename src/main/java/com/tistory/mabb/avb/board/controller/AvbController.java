package com.tistory.mabb.avb.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tistory.mabb.avb.board.domain.VoteBoard;
import com.tistory.mabb.avb.board.service.AvbService;
import com.tistory.mabb.avb.member.domain.Member;

@Controller
public class AvbController {
	
	@Autowired
	AvbService aService;

	/**
	 * 리스트로 이동
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/vote/list.do",method=RequestMethod.GET)
	public ModelAndView listView(ModelAndView mv) {
		
		
		List<VoteBoard> vList = aService.printAllVote();
		if(!vList.isEmpty()) {
			mv.addObject("vList",vList).
			setViewName("/voteBoard/list");
		}else {
			mv.addObject("vList",null).
			setViewName("/voteBoard/list");
		}
		return mv;
	}
	
	/**
	 * 투표 작성 페이지로 이동
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/vote/writeView.do",method=RequestMethod.GET)
	public ModelAndView voteWriteView(ModelAndView mv) {
		mv.setViewName("/voteBoard/voteWrite");
		return mv;
	}
	
	/**
	 * 투표 작성
	 * @param mv
	 * @param vote
	 * @return
	 */
	@RequestMapping(value="/vote/write.do",method=RequestMethod.POST)
	public ModelAndView voteWrite(ModelAndView mv,
			@ModelAttribute VoteBoard vote) {
		int result = aService.registerVote(vote);
		if(result>0) {
			mv.setViewName("/voteBoard/list");
		}else {
		}
		return mv;
	}
	
	@RequestMapping(value="/vote/detail.do",method=RequestMethod.GET)
	public ModelAndView voteDetail(ModelAndView mv,
			@RequestParam("voteNo") Integer voteNo,
			@RequestParam("voteWriter") String voteWriter,
			@RequestParam("voteEnd") String voteEnd,
			HttpSession session) {
		
		//1.게시물 번호와 로그인 유저의 아이디와 작성자의 아이디, 투표진행상태, 로그인 유저의 투표 여부가 필요하다
		//2.컨트롤러 단에서 조건에 따라 분기한다.
		//투표 진행 상태
		//작성자와 로그인 유저 여부
		//로그인 유저의 투표 여부
		Member loginUser = (Member) session.getAttribute("loginUser");
		String loginUserNickname = loginUser.getNickName();
		
		if(!voteEnd.equals("Y")) {
			//투표 진행중
			if(!voteWriter.equals(loginUserNickname)){
				//작성자가 아닌유저의 조회
				int result = aService.participantCheck(loginUserNickname, voteNo);
				if(result > 0) {
					//이미 투표 참여 투표 대기화면 노출
					
				}else {
					//투표 미참여 투표화면 노출
					
				}
				
				
				
			}else {
				//투표 진행 중 작성자의 조회 투표 대기화면 노출
				
			}
		}else {
			//투표 완료/ 완료화면
			
		}
		
		
		return mv;
	}
}
