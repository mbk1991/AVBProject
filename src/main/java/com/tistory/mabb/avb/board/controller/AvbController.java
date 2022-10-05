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
	 * 
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/vote/list.do", method = RequestMethod.GET)
	public ModelAndView listView(ModelAndView mv) {

		List<VoteBoard> vList = aService.printAllVote();
		if (!vList.isEmpty()) {
			mv.addObject("vList", vList).setViewName("/voteBoard/list");
		} else {
			mv.addObject("vList", null).setViewName("/voteBoard/list");
		}
		return mv;
	}

	/**
	 * 투표 작성 페이지로 이동
	 * 
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/vote/writeView.do", method = RequestMethod.GET)
	public ModelAndView voteWriteView(ModelAndView mv) {
		mv.setViewName("/voteBoard/voteWrite");
		return mv;
	}

	/**
	 * 투표 작성
	 * 
	 * @param mv
	 * @param vote
	 * @return
	 */
	@RequestMapping(value = "/vote/write.do", method = RequestMethod.POST)
	public ModelAndView voteWrite(ModelAndView mv, @ModelAttribute VoteBoard vote) {
		int result = aService.registerVote(vote);
		if (result > 0) {
			mv.setViewName("redirect:/vote/list.do");
		} else {
		}
		return mv;
	}

	/**
	 * 투표게시물 조회
	 * 
	 * @param mv
	 * @param voteNo
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/vote/detail.do", method = RequestMethod.GET)
	public ModelAndView voteDetail(ModelAndView mv, 
			@RequestParam("voteNo") Integer voteNo, HttpSession session) {

		// 1.게시물 번호와 로그인 유저의 아이디와 작성자의 아이디, 투표진행상태, 로그인 유저의 투표 여부가 필요하다
		// 2.컨트롤러 단에서 조건에 따라 분기한다.
		// 투표 진행 상태
		// 작성자와 로그인 유저 여부
		// 로그인 유저의 투표 여부
		Member loginUser = (Member) session.getAttribute("loginUser");
		String loginUserNickname = loginUser.getNickName();

		VoteBoard vote = aService.printOneVote(voteNo);
		String voteEnd = vote.getVoteEnd();
		String voteWriter = vote.getVoteWriter();
		
		if (!voteEnd.equals("Y")) {
				// 투표 진행중
				if (!voteWriter.equals(loginUserNickname)) {
					// 작성자가 아닌유저의 조회
					int result = aService.participantCheck(loginUserNickname, voteNo);
					if (result > 0) {
						// 이미 투표 참여 투표 대기화면 노출
						mv.addObject("vote", vote).setViewName("/voteBoard/voteWaiting");
					} else {
						// 투표 미참여 투표화면 노출
						mv.addObject("vote", vote).setViewName("/voteBoard/voteJoin");
					}
	
				} else {
					// 투표 진행 중 작성자의 조회: 투표 대기화면 노출
					mv.addObject("vote", vote).setViewName("/voteBoard/voteWaiting");
				}
		} else {
			// 투표 완료/ 완료화면
			mv.addObject("vote", vote).setViewName("/voteBoard/voteComplite");
		}

		return mv;
	}
	
	/**
	 * 집계
	 */
	public void voteAggregation(VoteBoard vote) {
		int first = vote.getFirstCount();
		int second = vote.getSecondCount();
		int third = vote.getThirdCount();
		int fourth = vote.getFourthCount();
		int fifth = vote.getFifthCount();
		String firstLabel = vote.getFirstLabel();
		String secondLabel = vote.getSecondLabel();
		String thirdLabel = vote.getThirdLabel();
		String fourthLabel = vote.getFourthLabel();
		String fifthLabel = vote.getFifthLabel();
		
	}
	
	
	

	/**
	 * 투표하기 버튼 클릭 시 로직
	 * 투표를 할 수 있는 화면은 투표를 하지 않은 사람만 접근이 가능하다.
	 * @param mv
	 * @param voteCheck
	 * @param voteNo
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/vote/join.do", method = RequestMethod.POST)
	public ModelAndView voteJoin(ModelAndView mv,
			@RequestParam("voteCheck") Integer voteCheck,
			@RequestParam("voteNo") Integer voteNo,
			HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginNickname = loginUser.getNickName();
		
		
		//1.화면에서 라디오로 입력받은 값에 따라 해당되는 
		//컬럼에 카운팅을 해준다. 컬럼명을 저장하는 부분.
		String column = "";
		switch (voteCheck) {
		case 1:
			column = "FIRST_COUNT";
			break;
		case 2:
			column = "SECOND_COUNT";
			break;
		case 3:
			column = "THIRD_COUNT";
			break;
		case 4:
			column = "FOURTH_COUNT";
			break;
		case 5:
			column = "FIFTH_COUNT";
			break;
		}
		
		//2.투표한 번호 카운트.
		int result = aService.addCount(column,voteNo);
		if (result > 0) {
			//3. 투표 합계 업데이트
			int sumResult = aService.sumCount(voteNo);
			if(sumResult>0) {
				
				//4.성공 시 투표자 등록
				int registerResult = aService.registerParticipant(loginNickname,voteNo,voteCheck);
				if(registerResult > 0) {
					// 5.투표자수를 확인하여 투표종료여부를 'Y'로 바꾼다.
					VoteBoard thisVote = aService.printOneVote(voteNo);
					int sumCount = thisVote.getSumCount();
					int participantLimit = thisVote.getParticipantLimit();
					if(sumCount == participantLimit) {
						int voteEndResult = aService.modifyVoteEnd(voteNo);
						mv.setViewName("redirect:/vote/detail.do?voteNo="+voteNo);
						return mv;
					}
					
					//6.투표 참여자 등록 성공 시
					mv.setViewName("redirect:/vote/detail.do?voteNo="+voteNo);
				}
			}
		} else {

		}

		return mv;
	}
}
