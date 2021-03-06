package com.bitwise.authentication;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter("/*")
public class AuthFilter implements Filter {

    public AuthFilter() {

    }


public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest req = (HttpServletRequest) request;
	        HttpServletResponse res = (HttpServletResponse) response;
	        HttpSession session = req.getSession();
	        PrintWriter out = res.getWriter();
			String currUri = req.getRequestURI();
			String contextPath = req.getContextPath();
			boolean flag = authUser(session);
	
			if (currUri.equals(contextPath + "/personalDetail.jsp")) {
				if (!flag) {
			        out.print("<font color='red' size='20'>Login Firstt!</font>");
			        req.getRequestDispatcher("login.jsp").include(request, response);
					
					return;
				}
				
			}
			
			if (currUri.equals(contextPath + "/ViewCartController")) {
				if (!flag) {
					res.sendRedirect("login.jsp");
					return;
				}
			}
			
			if (currUri.equals(contextPath + "/ProductController")) {
				if (!flag) {
					res.sendRedirect("login.jsp");
					return;
				}
			}



			if (currUri.equals(contextPath + "/ShowLogoutServlet")) {
				if (!isSessionExpired(req)) {
					req.getSession(false).invalidate();
			        out.print("<font color='red' size='20'> You are successfully logged out!<font>");
			        req.getRequestDispatcher("login.jsp").include(request, response);
					
					return;
				}
			}

			

			chain.doFilter(req, res);

		}

		private boolean authUser(HttpSession session) {
			boolean flag = false;
			if(session != null && session.getAttribute("user") != null){
				flag = true;
			}
			return flag;
			
		}

		private boolean isSessionExpired(HttpServletRequest req) {
			return req.getSession(false) == null; // return true if not existing
		}

		
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	public void destroy() {
	}
}

