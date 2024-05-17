package com.icss.filter;

import java.io.IOException;

import com.icss.entity.IRole;
import com.icss.entity.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;


@WebFilter("/app/back/*")
public class AdminFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AdminFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// �ж��û��Ƿ��Ѿ���¼
		HttpServletRequest req = (HttpServletRequest) request;
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) {
			// δ��¼,ת����¼ҳ
			request.setAttribute("msg", "访问受限资源，请先登录");
			request.getRequestDispatcher("/WEB-INF/views/jsp/login.jsp").forward(request, response);
		} else {
			if(user.getRole() == IRole.ADMIN) {
				chain.doFilter(request, response);
			}else {
				request.setAttribute("msg", "权限不足，请重新登录");
				request.getRequestDispatcher("/WEB-INF/views/jsp/login.jsp").forward(request, response);
			}
			
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
