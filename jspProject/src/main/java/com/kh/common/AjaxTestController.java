package com.kh.common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxTestController
 */
@WebServlet("/jqAjax.do")
public class AjaxTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		System.out.println(name+"+"+age);
		
		//여러개의 값을 응답하고 싶지만 할 수 없다.
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().print(name);
//		response.getWriter().print(age);
		
		/**
		 *  JSON(자바스크립트 객체 표기법)
		 *  ajax통신시 데이터 전송에 자주사용되는 포맷형식중 하나
		 *  
		 *  > [value,value,value] <= 자바스크립트에서 배열 => JSONArray
		 *  > {key:value, key:value, key:value} => 자바스크립트에서의 일반객체 => JSONObject
		 */
//		JSONArray jArr = new JSONArray();
//		jArr.add(name);
//		jArr.add(age);
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().print(jArr);
		
//		JSONObject jObject = new JSONObject();
//		jObject.put("name",name);
//		jObject.put("age",age);
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().print(jObject);
		
		ArrayList<Member> list = new ArrayList<>();
		list.add(new Member(1,"테스트1","01011112222"));
		list.add(new Member(2,"테스트2","01022223333"));
		list.add(new Member(3,"테스트3","01033334444"));
		
		// [{},{},{}]
		
//		JSONArray jArr = new JSONArray(); // []
//		for(Member m : list) {
//			JSONObject jObject = new JSONObject();
//			jObject.put("userNo", m.getUserNo());
//			jObject.put("userName", m.getUserName());
//			jObject.put("phone", m.getPhone());
//			jArr.add(jObject);
//		}
		
		response.setContentType("text/html; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}