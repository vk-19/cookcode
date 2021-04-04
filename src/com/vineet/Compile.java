package com.vineet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Compile")
public class Compile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Object processLock = new Object();
	
  public static int count = 0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			synchronized(processLock) {
			PrintWriter out = response.getWriter();
			String code = request.getParameter("code");
			++count;
			HttpSession session = request.getSession();
			
			File usercode = new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp/file" + count + ".cpp");
			session.setAttribute("path", "/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp/file" + count + ".cpp");
			usercode.createNewFile();
			//File usercode = File.createTempFile("usercode", ".cpp");
			out.print(usercode.getName());
			/*int n = usercode.getName().length();
			out.print(n);
			String str = usercode.getName();
			String ec = str.substring(0, n-4);
			out.print(ec);*/
			File execcode = new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp/file" + count + ".out");
			//File execcode = File.createTempFile(ec, ".out");
			execcode.createNewFile();
			FileWriter fw = new FileWriter(usercode);
			fw.write(code);
			fw.close();
			
			File error = new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp/error" + count);

			
			ProcessBuilder pb = new ProcessBuilder("g++", usercode.getName(), "-o", execcode.getName());
			pb.redirectError(error);
			pb.directory(new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp"));
			//pb.directory(new File("/tmp"));
			Process pr = pb.start();
			int i = pr.waitFor() ;
			out.print("ehl");
			//Run ob = new Run();
			//ob.doGet(request, response);
			out.print(execcode.getName());
			request.setAttribute("execcode", execcode.getName());
			request.setAttribute("num", ""+count);
			//request.getRequestDispatcher("/Run").forward(request, response);
			if (execcode.length()!=0) {
			RequestDispatcher rd = request.getRequestDispatcher("Run");
			rd.forward(request, response);
			}
			else {
				String verdict = "Compilation error";
				//HttpSession session = request.getSession();
				String roll = (String)session.getAttribute("roll");
				String ques = (String)session.getAttribute("ques");
				String path = (String)session.getAttribute("path");
				UserDao dao = new UserDao();
				dao.addfile(roll, path, verdict, ques);
				String error_file = "/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/tmp/error" + count;
				response.sendRedirect("verdict.jsp?verdict=" + verdict + "&error_file="+error_file);
			}
			
			
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
			//String s = "./" + execcode.getName();
			//out.print(s);
			/*ProcessBuilder pb2 = new ProcessBuilder("./a.out");
			
			File inputFile = new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/ques1_input.txt");
			out.print(inputFile.exists());
			File outputFile = new File("/home/vineetkumar19/eclipse-workspace/cookcode/WebContent/ques1_output.txt");
			File tempOutput = File.createTempFile("output", ".txt");
			File error = File.createTempFile("error", ".txt");
			
			pb2.redirectInput(inputFile);
			pb2.redirectOutput(tempOutput);
			pb2.redirectError(error);
			pb2.directory(new File("/tmp"));
			out.println("hello");
			pb2.start();
			out.println("hello");
			if (compareFile(outputFile, tempOutput) != 1) {
				out.println("nope");
			}
			else {
				out.println("yes");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}*/
		  //try {
			//  PrintWriter out = response.getWriter();
			  //File f = File.createTempFile("hello", ".cpp");
			  //File ex = File.createTempFile("hello", suffix)
			  //f.createNewFile();
			  //out.print(f.getName());
			  //ProcessBuilder pb = new ProcessBuilder("g++", "temp.cpp", "-o", "temp.out");
			  
			
			//  pb.directory(new File("/home/vineetkumar19/Desktop/"));
			 // pb.start();
			  	/*PrintWriter out = response.getWriter();
		        String tempFile = "hello"; 
		        File temp = File.createTempFile(tempFile, ".xls"); 
		        out.println("Temp file : " + temp.getAbsolutePath());*/
		   // } catch (Exception e) {
		     //   e.printStackTrace();
		    //}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
