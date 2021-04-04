package com.vineet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

/**
 * Servlet implementation class Run
 */
@WebServlet("/Run")
public class Run extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private static final Object processLock = new Object();
    public Run() {
        super();
        // TODO Auto-generated constructor stub
    }

    public int compareFile(File f1, File f2)throws Exception 
	{



	FileReader fR1 = new FileReader(f1);
	FileReader fR2 = new FileReader(f2);

	BufferedReader reader1 = new BufferedReader(fR1);
	BufferedReader reader2 = new BufferedReader(fR2);

	String line1 = null;
	String line2 = null;
	int flag=1;
	while ((flag==1) &&((line1 = reader1.readLine()) != null)&&((line2 = reader2.readLine()) != null)) 
	{
	    if (!line1.equalsIgnoreCase(line2))  
	        flag=0;
	    else 
	        flag=1;   
	}
	reader1.close();
	reader2.close();
	return flag;


	}
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String verdict="";
		try {
			synchronized(processLock) {
			PrintWriter out = response.getWriter();
		
			HttpSession session = request.getSession();
			String roll = (String)session.getAttribute("roll");
			String ques = (String)session.getAttribute("ques");
			String path = (String)session.getAttribute("path");
			UserDao dao = new UserDao();
		
		
		String num = (String) request.getAttribute("num");
		out.print(num);
		String execcode = (String) request.getAttribute("execcode");
		out.print(execcode);
		ProcessBuilder pb = new ProcessBuilder("./" + execcode);
		File inputFile = new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/ques1_input.txt");
		//out.print(inputFile.exists());
		File outputFile = new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/ques1_output.txt");
		File tempOutput = new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp/temp_output" + num);
		tempOutput.createNewFile();
		//File tempOutput = File.createTempFile("output", ".txt");
		File error = new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp/run_error" + num);
		//File error = File.createTempFile("error", ".txt");
		pb.redirectInput(inputFile);
		pb.redirectOutput(tempOutput);
		pb.redirectError(error);
		
		pb.directory(new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp"));
		//pb.wait(3000);
		
		Process pr = pb.start();
		int i = pr.waitFor();
		
		if (error.length() != 0) {
			out.print("culp");
			verdict = "Runtime error";
			dao.addfile(roll, path, verdict, ques);
			String error_file = "/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp/run_error" + num;
			response.sendRedirect("verdict.jsp?verdict=" + verdict + "&error_file="+error_file);
		}
		
		else if (compareFile(outputFile, tempOutput) != 1 || tempOutput.length()==0) {
			verdict = "incorrect";
			out.println("inc");
			dao.addfile(roll, path, verdict, ques);
			dao.updateResult(roll, ques, verdict);
			response.sendRedirect("verdict.jsp?verdict=incorrect");
		}
		else {
			verdict = "correct";
			out.println("c");
			dao.addfile(roll, path, verdict, ques);
			dao.updateResult(roll, ques, verdict);
			response.sendRedirect("verdict.jsp?verdict=correct");
			//out.println("yes");
		}
			}
		//tempOutput.delete();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	
		}
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
