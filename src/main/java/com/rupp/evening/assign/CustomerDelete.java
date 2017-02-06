package com.rupp.evening.assign;
/**
 * 
 */

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rupp.evening.assign.Customer;

/**

 */
public class CustomerDelete extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// resource

	@Override
	public void init() throws ServletException {
		System.out.println("=====init method is called====");
		// populate initialize resources
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		Customer cus = new Customer();
		cus.deleteCustomer(id);
	}

	@Override
	public void destroy() {
		System.out.println("=====destroy method is called====");
	}

}
