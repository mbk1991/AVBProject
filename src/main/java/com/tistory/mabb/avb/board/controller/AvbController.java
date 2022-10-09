package com.tistory.mabb.avb.board.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tistory.mabb.avb.board.domain.VoteBoard;
import com.tistory.mabb.avb.board.domain.VoteReply;
import com.tistory.mabb.avb.board.service.AvbService;
import com.tistory.mabb.avb.common.Paging;
import com.tistory.mabb.avb.common.Search;
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
	public ModelAndView listView(ModelAndView mv,
			@RequestParam(value="page",required=false) Integer currentPage
			) {
		int page = (currentPage != null)? currentPage : 1;
		Paging paging = new Paging(aService.countAllVote(), page, 10, 5);
		
		List<VoteBoard> vList = aService.printAllVote(paging);
		if (!vList.isEmpty()) {
			mv.addObject("url","list")
			.addObject("paging",paging)
			.addObject("vList", vList)
			.setViewName("/voteBoard/list");
		} else {
			mv.addObject("url","list")
			.addObject("paging",paging)
			.addObject("vList", null)
			.setViewName("/voteBoard/list");
		}
		return mv;
	}
	
	@RequestMapping(value="/vote/search.do",method=RequestMethod.GET)
	public ModelAndView searchView(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer currentPage,
			@ModelAttribute Search search) {
		int page = (currentPage != null)? currentPage : 1;
		
		
		Paging paging = new Paging(aService.countSearchVote(search), page, 10, 5);
		List<VoteBoard> vList = aService.searchVote(paging, search);
		if (!vList.isEmpty()) {
			mv.addObject("url","search")
			.addObject("paging",paging)
			.addObject("search",search)
			.addObject("vList", vList)
			.setViewName("/voteBoard/list");
		} else {
			mv.addObject("url","search")
			.addObject("paging",paging)
			.addObject("search",search)
			.addObject("vList", null)
			.setViewName("/voteBoard/list");
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
	public ModelAndView voteDetail(ModelAndView mv, @RequestParam("voteNo") Integer voteNo, HttpSession session) {

		// 1.게시물 번호와 로그인 유저의 아이디와 작성자의 아이디, 투표진행상태, 로그인 유저의 투표 여부가 필요하다
		// 2.컨트롤러 단에서 조건에 따라 분기한다.
		// 투표 진행 상태
		// 작성자와 로그인 유저 여부
		// 로그인 유저의 투표 여부
		Member loginUser = (Member) session.getAttribute("loginUser");
		String loginUserId = loginUser.getMemberId();

		VoteBoard vote = aService.printOneVote(voteNo);
		String voteEnd = vote.getVoteEnd();
		String voteWriterId = vote.getMemberId();

		// 나의 투표를 확인할 수 있도록 하기 위해
		// 게시물 클릭 시 로그인 유저의 투표정보를 가져온다.
		int userChoice = aService.getUserChoice(voteNo, loginUserId);

		if (!voteEnd.equals("Y")) {
			// 투표 진행중
			if (!voteWriterId.equals(loginUserId)) {
				// 작성자가 아닌유저의 조회
				int result = aService.participantCheck(loginUserId, voteNo);
				if (result > 0) {
					// 이미 투표 참여 투표 대기화면 노출
					mv.addObject("userChoice", userChoice).addObject("vote", vote)
							.setViewName("/voteBoard/voteWaiting");
				} else {
					// 투표 미참여 투표화면 노출
					mv.addObject("userChoice", userChoice).addObject("vote", vote).setViewName("/voteBoard/voteJoin");
				}

			} else {
				// 투표 진행 중 작성자의 조회: 투표 대기화면 노출
				mv.addObject("userChoice", userChoice).addObject("vote", vote).setViewName("/voteBoard/voteWaiting");
			}
		} else {
			// 투표 완료/ 완료화면
			int mostCount = voteSortDesc(vote);
			mv.addObject("mostCount",mostCount).addObject("userChoice", userChoice).addObject("vote", vote).setViewName("/voteBoard/voteComplite");
		}

		return mv;
	}

	/**
	 * 최대값 구하기.
	 */
	public int voteSortDesc(VoteBoard vote) {
		// 방법1.최대값을 리턴하고 화면단에서 최대값인 경우 효과를 주도록 하는 방법
		// 이렇게 할 경우 투표 항목에서 1등 또는 공동1등에 표시만 된다.
		// 이 경우 1건,1건,1건인 경우도 1등으로 표시가 된다. 최다득표로 표기
		// 방법2. 내림차순 정렬하여 화면으로 보낸다.

		Integer first = vote.getFirstCount();
		Integer second = vote.getSecondCount();
		Integer third = vote.getThirdCount();
		Integer fourth = vote.getFourthCount();
		Integer fifth = vote.getFifthCount();
		Integer[] countArr = { first, second, third, fourth, fifth };
		Arrays.sort(countArr, Collections.reverseOrder());
		

		return countArr[0];
	}

	/**
	 * 투표하기 버튼 클릭 시 로직 투표를 할 수 있는 화면은 투표를 하지 않은 사람만 접근이 가능하다.
	 * 
	 * @param mv
	 * @param voteCheck
	 * @param voteNo
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/vote/join.do", method = RequestMethod.POST)
	public ModelAndView voteJoin(ModelAndView mv, @RequestParam("voteCheck") Integer voteCheck,
			@RequestParam("voteNo") Integer voteNo, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String loginUserId = loginUser.getMemberId();

		// 1.화면에서 라디오로 입력받은 값에 따라 해당되는
		// 컬럼에 카운팅을 해준다. 컬럼명을 저장하는 부분.
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

		// 2.투표한 번호 카운트.
		int result = aService.addCount(column, voteNo);
		if (result > 0) {
			// 3. 투표 합계 업데이트
			int sumResult = aService.sumCount(voteNo);
			if (sumResult > 0) {

				// 4.성공 시 투표자 등록
				int registerResult = aService.registerParticipant(loginUserId, voteNo, voteCheck);
				if (registerResult > 0) {
					// 5.투표자수를 확인하여 투표종료여부를 'Y'로 바꾼다.
					VoteBoard thisVote = aService.printOneVote(voteNo);
					int sumCount = thisVote.getSumCount();
					int participantLimit = thisVote.getParticipantLimit();
					if (sumCount == participantLimit) {
						int voteEndResult = aService.modifyVoteEnd(voteNo);
						mv.setViewName("redirect:/vote/detail.do?voteNo=" + voteNo);
						return mv;
					}

					// 6.투표 참여자 등록 성공 시
					mv.setViewName("redirect:/vote/detail.do?voteNo=" + voteNo);
				}
			}
		} else {

		}

		return mv;
	}
	
	
//댓글////////////////////////////////////
	
	/**
	 * 원댓글 등록 ajax
	 * @param vReply
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/reply/registerOrigin.do",method=RequestMethod.POST)
	public String registerOriginalReply(@ModelAttribute VoteReply vReply) {
		
		System.out.println(vReply.toString());
		
		int result = aService.registerOriginalReply(vReply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 답글 등록 ajax
	 * @param vReply
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/reply/registerReReply.do",method=RequestMethod.POST)
	public String registerReReply(@ModelAttribute VoteReply vReply) {
		
		System.out.println(vReply.toString());
		
		int result = aService.registerReReply(vReply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 댓글 리스트 ajax
	 * @param voteNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/reply/list.do",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String replyList(@RequestParam("voteNo") Integer voteNo) {
		
		System.out.println(voteNo);
		
		List<VoteReply> vList = aService.printOriginalReply(voteNo);
		if(!vList.isEmpty()) {
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
			return gson.toJson(vList);
		}else {
			return null;
		}
	}
	
	
	
//	@ResponseBody
//	@RequestMapping(value="",method=RequestMethod.GET)
//	public void modifyReply() {
//		
//		
//	}
//	@ResponseBody
//	@RequestMapping(value="",method=RequestMethod.GET)
//	public void deleteReply() {
//		
//		
//	}
	
}
