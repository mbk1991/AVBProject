package com.tistory.mabb.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.tistory.mabb.member.domain.FirstKeyword;
import com.tistory.mabb.member.domain.SecondKeyword;
import com.tistory.mabb.member.domain.ThirdKeyword;
import com.tistory.mabb.member.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	
	/**
	 * 회원가입 화면 이동
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/member/enrollView.do",method=RequestMethod.GET)
	public ModelAndView enroll(ModelAndView mv) {
		mv.setViewName("/member/enroll");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/member/idCheck.do",method=RequestMethod.POST)
	public JsonObject idCheck(@RequestParam("inputId") String inputId) {
		System.out.println(inputId);
		JsonObject jsonObject = new JsonObject();
		
		return jsonObject;
	}
	
	
	/**
	 * 닉네임 중복방지 랜덤생성. ajax
	 * @param mv
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/member/nickname/make.do",method=RequestMethod.POST)
	public JsonObject nicknameCombine(ModelAndView mv) {
		JsonObject jsonObject = new JsonObject();
		
		//1.first,second,third키워드를  select한다.
		List<FirstKeyword> fList = mService.getFirst();
		List<SecondKeyword> sList = mService.getSecond();
		List<ThirdKeyword> tList = mService.getThird();
		
		//2.키워드를 조합하고, DB에 중복값이 있을 경우 반복문을
		//이용하여 재조합한다. 전체 닉네임 조합 이상으로 반복할경우
		//반복문을 빠져나온다.
		int result = 1;
		int count = 1;
		String combineNickname = "";
		while(result > 0) {
			combineNickname = combineNickname(fList,sList,tList);
			result = mService.checkNickname(combineNickname);
			count++;
			if(count > fList.size()*sList.size()*tList.size()) {
				System.out.println(fList.size()*sList.size()*tList.size()+"개의 모든 닉네임이 사용중입니다.");
				jsonObject.addProperty("", "");
				return jsonObject;
			}
		}
		
		//3. 조합된 닉네임을 json객체에 담는다.
		jsonObject.addProperty("combineNickname",combineNickname);
		return jsonObject;
	}
	
	/**
	 * 닉네임 랜덤 조합 메소드
	 * @param fList
	 * @param sList
	 * @param tList
	 * @return String
	 */
	public String combineNickname(List<FirstKeyword> fList,
			List<SecondKeyword> sList,
			List<ThirdKeyword> tList) {
		
		int firstRandomNo = (int)(Math.random()*(fList.size()-2))+1;
		int secondRandomNo = (int)(Math.random()*(sList.size()-2))+1;
		int thirdRandomNo = (int)(Math.random()*(tList.size()-2))+1;
		
		return fList.get(firstRandomNo).getFirstKeyword()+
				sList.get(secondRandomNo).getSecondKeyword()+
				tList.get(thirdRandomNo).getThirdKeyword();
	}
}