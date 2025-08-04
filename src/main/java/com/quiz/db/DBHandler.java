package com.quiz.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.quiz.model.Question;
import com.quiz.model.Result;
import com.quiz.model.Subject;
import com.quiz.model.User;

public class DBHandler {
      private static Connection con = null;
      public static Connection getConnection() {
    	  try {
    		  if(con==null || con.isClosed()) {
    			  Class.forName("com.mysql.cj.jdbc.Driver");
    			  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizzapp","root","root");
    		  }
    	  }catch(Exception e) {
    		  System.out.println(e.getMessage());
    	  }
    	  return con;
      }
      
      public static boolean registerUser(String name, String email, String password)
      {
    	  boolean result = false;
    	  try(Connection con = getConnection()) {
    		  String query = "insert into users(name,email,password) values(?,?,?)";
    		  PreparedStatement ps = con.prepareStatement(query);
    		  ps.setString(1, name);
    		  ps.setString(2, email);
    		  ps.setString(3, password);
    		  int rows = ps.executeUpdate();
    		  result =  rows > 0;
    	  }catch(Exception e) {
    		  System.out.println("Registeration Failed with error "+e.getMessage());
    	  }
    	  return result;
      }
      
      public static User validateUser(String email, String password)
      {
    	  User user = null;
    	  try(Connection con = getConnection()) {
    		  String query = "SELECT user_id, name, email, password FROM users WHERE email=? AND password=?";
    		  PreparedStatement ps = con.prepareStatement(query);
    		  ps.setString(1, email);
    		  ps.setString(2, password);
    		  ResultSet rs = ps.executeQuery();
    		  if(rs.next()) {
    			  user = new User();
                  user.setId(rs.getInt("user_id"));
                  user.setName(rs.getString("name"));
                  user.setEmail(rs.getString("email"));
                  user.setPassword(rs.getString("password"));
    		  }
    	  }catch(Exception e) {
    		  System.out.println("Validation Failed with error "+e.getMessage());
    	  }
    	  return user;
      }
      
      public static List<Subject> getAllSubjects() 
      {
    	  List<Subject> subjects = new ArrayList<>();
    	  try(Connection con = getConnection()) {
    		  String query = "SELECT * FROM subjects";
    		  PreparedStatement ps = con.prepareStatement(query);
    		  ResultSet rs = ps.executeQuery();
    		  while(rs.next()) {
    			 Subject subject = new Subject();
    			 subject.setId(rs.getInt("subject_id"));;
    			 subject.setName(rs.getString("subject_name"));
    			 subjects.add(subject);
    		  }
    	  }catch(Exception e) {
    		  System.out.println("Fetching with error "+e.getMessage());
    	  }
    	  return subjects;
      }
      
      
      public Subject getSubjectById(int subjectId) {
  		Subject subjectName = null;
  		try(Connection con = getConnection()) {
  		  String query = "SELECT * FROM subjects where subject_id=?";
  		  PreparedStatement ps = con.prepareStatement(query);
  		  ps.setInt(1, subjectId);
  		  ResultSet rs = ps.executeQuery();
  		  if(rs.next()) {
  			  subjectName = new Subject();
  			  subjectName.setId(rs.getInt("subject_id"));
  			  subjectName.setName(rs.getString("subject_name"));
  			  
  		  }
  	  }catch(Exception e) {
  		  System.out.println("Fetching with error "+e.getMessage());
  	  }
  		return subjectName;
  	}

	public List<Question> getQuestionsBySubjectId(int subjectId) {
		List<Question> questions = new ArrayList<Question>();
		try(Connection con = getConnection()){
			String query = "select * from questions where subject_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, subjectId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Question question = new Question();
				question.setId(rs.getInt("ques_id"));
				question.setQuestionText(rs.getString("question"));
				question.setOptionA(rs.getString("option_a"));
				question.setOptionB(rs.getString("option_b"));
				question.setOptionC(rs.getString("option_c"));
				question.setOptionD(rs.getString("option_d"));
				question.setCorrectAnswer(rs.getString("correct_option").charAt(0));
				question.setSubjectId(rs.getInt("subject_id"));
				
				questions.add(question);
			}
		}catch(Exception e) {
			System.out.println("Questions not fetched: "+e.getMessage());
		}
		return questions;
	}

	public void saveQuizResult(int id, int subjectid, int score) {
		try (Connection con = getConnection()){
			String query = "insert into results(user_id,subject_id,score) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ps.setInt(2, subjectid);
			ps.setInt(3, score);
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Result not Saved: "+e.getMessage());
		}
		
	}
	
	public List<Result> getUserResult(int user_id) {
		List<Result> resultList = new ArrayList<Result>();
		
		try(Connection con = getConnection()){
			String query = "select * from results where user_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Result result = new Result();
				result.setSubjectId(rs.getInt("subject_id"));
				result.setScore(rs.getInt("score"));
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				String formattedDate = rs.getTimestamp("attempted_on").toLocalDateTime().format(formatter);
				result.setQuizDate(formattedDate);
			    resultList.add(result);
			}
		}catch(Exception e) {
			System.out.println("Questions not fetched: "+e.getMessage());
		}
		return resultList;
	}
	
	public List<Result> getResultsByUserId(int userId) {
	    List<Result> results = new ArrayList<>();
	    String sql = "SELECT r.score, r.attempted_on, s.subject_name " +
	                 "FROM results r JOIN subjects s ON r.subject_id = s.subject_id " +
	                 "WHERE r.user_id = ?";
	    try (Connection con = getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            Result result = new Result();
	            result.setScore(rs.getInt("score"));
	            
	            // Convert Timestamp -> LocalDateTime -> formatted String
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	            String formattedDate = rs.getTimestamp("attempted_on").toLocalDateTime().format(formatter);
	            result.setQuizDate(formattedDate);  // ✅ this is now a String
	            
	            result.setSubjectName(rs.getString("subject_name"));  // ✅ subject name set
	            results.add(result);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return results;
	}



	
}
