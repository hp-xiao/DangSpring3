package com.icss.action;

import org.springframework.ui.Model;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;

import com.icss.util.Log;

@ControllerAdvice
public class GlobalExceptionHandler {	
	
	@ExceptionHandler(Exception.class)
	public ModelAndView otherException(Exception e) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/err/errMsg.jsp");		
		Log.logger.error(e.getMessage(),e);				
		return mv;
	}	
	
	@ExceptionHandler(MissingServletRequestParameterException.class)
	public String missParameter(MissingServletRequestParameterException e,Model model) {
		Log.logger.error(e.getMessage(),e);				
		model.addAttribute("msg",e.getParameterName() + "参数丢失，请检查");
		
		return "/err/missParameter.jsp";		
	}
	
	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public String overMaxUploadSize(MaxUploadSizeExceededException e,
									Model model) {
		Log.logger.error(e.getMessage(),e);
		model.addAttribute("msg", e.getLocalizedMessage());
		return "/err/OverMaxUploadSize.jsp";
	}
	
}

