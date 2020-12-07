package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	/*
		request영역에 속성 저장
			: 서블릿에서 request영역을 사용하기 위해 해당 메소드를
			HttpServletRequest 타입의 매개변수를 전달한다.
			그러면 사용자의 모든 요청을 해당 서블릿에서 받을 수 있다.
	 */
		req.setAttribute("Message", "Hello Servlet Test 성공");
	/*
		web.xml에 서블릿 매핑정보를 입력할 때 <servlet> 하위 엘리먼트로
		<init-param>을 이용해서 서블릿 초기화 파리머터를 등록할 수 있다.
	 */
		req.setAttribute("HELLO", this.getInitParameter("HELLO"));
		
	/*
		view에 해당하는 JSP페이지로 포워드한다. 그러면 request영역에 저장된 데이터는 공유된다.
		즉 서블릿은 영역을 이용해 JSP쪽으로 데이터(객체)를 전달하게 된다.
	 */
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp); //getRequestDispatcher 포워드 할 때 쓰는 명령어
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 만약 post로 요청되면 해당 요청을 doGet()메소드로 전달한다.
		 즉, 해당 서블릿은 post/get 방식으로 전달되는 모든 요청을 doGet()에서 처리한다.
		 */
		doGet(req, resp);
	}
}
