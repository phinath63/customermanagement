package com.rupp.evening.assign;
/**
 * 
 */

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rupp.evening.assign.Customer;

/**

 */
public class CustomerInfo extends HttpServlet {
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
		Customer cus=Customer.getCustomer(id);
		response.setContentType("text/html");
		// Get the printwriter object from response to write the required json object to the output stream      
		PrintWriter out = response.getWriter();
		// Assuming your json object is **jsonObject**, perform the following, it will return your json object 
		String json = "{\"id\":"+cus.getID()+",\"firstName\":\""+cus.getFistName()+"\",\"lastName\":\""+cus.getLastName()+
				 "\",\"gender\":\""+cus.getGender()+"\",\"email\":\""+cus.getEmail()+"\",\"dob\":\""+cus.getDOB()+"\",\"address\":\""+cus.getAddress()+"\",\"phone\":\""+cus.getPhone()+"\"}";
		out.print(json);
		out.flush();
		System.out.println(cus.getGender());
		
	}

	@Override
	public void destroy() {
		System.out.println("=====destroy method is called====");
	}

}
