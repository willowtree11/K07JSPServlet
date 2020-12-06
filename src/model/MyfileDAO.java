package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

public class MyfileDAO {
	
	Connection con; //커넥션 객체를 멤버변수로 설정하여 공유
	PreparedStatement psmt;
	ResultSet rs;
	
	public MyfileDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("JDBCDriver"));
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(
					ctx.getInitParameter("ConnectionURL"),id,pw);
			System.out.println("DB연결성공");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int myfileInsert(MyfileDTO dto) {
		int affected=0;
		try {
			String query="INSERT INTO myfile ( "
					+" idx, name, title, inter, ofile, sfile) "
					+" VALUES ( "
					//BBS게시판의 시퀀스이나 써도 무방. 중복되지 않는 숫자이기만 하면 됨.
					//보통은 게시판당 시퀀스 하나씩
					+" SEQ_BBS_NUM.nextval, ?, ?, ?, ?, ?)";
			
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getInter());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			affected=psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("insert 중 예외 발생");
			e.printStackTrace();
		}
		return affected;
	}
}
