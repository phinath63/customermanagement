package com.rupp.evening.assign;
/**
 * 
 */

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rupp.evening.assign.Customer;

/**

 */
public class CustomerEdit extends HttpServlet {
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
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dob=null;
		
		try {
			dob = formatter.parse( request.getParameter("dob"));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String lastName = request.getParameter("last-name");
		String firstName = request.getParameter("first-name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone =request.getParameter("phone");
		String addr = request.getParameter("address");
		Customer cus = new Customer(id, firstName, lastName, gender, email, dob, phone, addr);
		cus.updateCustomer();
	}

	@Override
	public void destroy() {
		System.out.println("=====destroy method is called====");
	}

}
