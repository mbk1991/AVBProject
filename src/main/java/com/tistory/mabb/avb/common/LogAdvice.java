package com.tistory.mabb.avb.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.tistory.mabb.HomeController;

@Component
@Aspect
public class LogAdvice {
	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
	
	@Pointcut("execution(* com.tistory.mabb.avb..*Impl.*(..))")
	public void allPointCut() {}
	
	@Around("allPointCut()")
	public Object aroundLog(ProceedingJoinPoint pp)throws Throwable{
	
		logger.info(pp.getSignature()+"메소드 실행" + pp.getArgs().toString());
		Object object = pp.proceed();
		logger.info("반환값 :  " + object);
		
		return object;
	}
}
