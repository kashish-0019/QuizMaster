package com.quiz.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.quiz.model.Admin;
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
      
      public static List<User> getAllStudents() 
      {
    	  List<User> students = new ArrayList<>();
    	  try(Connection con = getConnection()) {
    		  String query = "SELECT * FROM users";
    		  PreparedStatement ps = con.prepareStatement(query);
    		  ResultSet rs = ps.executeQuery();
    		  while(rs.next()) {
    			 User user =  new User();
    			 user.setId(rs.getInt("user_id"));;
    			 user.setName(rs.getString("name"));
    			 user.setEmail(rs.getString("email"));
    			 students.add(user);
    		  }
    	  }catch(Exception e) {
    		  System.out.println("Fetching with error "+e.getMessage());
    	  }
    	  return students;
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
      
      public static boolean addSubject(String name) {
    	  try {
    		  Connection con = getConnection();
    		  String query="insert into subjects(subject_name) values(?)";
    		  PreparedStatement ps = con.prepareStatement(query);
    		  ps.setString(1, name);
    		  int row = ps.executeUpdate();
    		  return row > 0;
    	  }catch(Exception e) {
    		  System.out.println("Add Subjects Failed: "+e.getMessage());
    	  }
    	  return false;
      }
      public static boolean deleteSubject(int subjectId) {
    	  try {
    		  Connection con = getConnection();
    		  // delete results
    		  String deleteResults = "DELETE FROM results WHERE subject_id = ?";
    	      PreparedStatement pst1 = con.prepareStatement(deleteResults);
    	      pst1.setInt(1, subjectId);
    	      pst1.executeUpdate();
    	       // delete questions
    		  String deleteQuestions = "DELETE FROM questions WHERE subject_id = ?";
    	      PreparedStatement pst2 = con.prepareStatement(deleteQuestions);
    	      pst2.setInt(1, subjectId);
    	      pst2.executeUpdate();
    		 //delete subject
    		  String query="delete from subjects where subject_id=?";
    		  PreparedStatement ps = con.prepareStatement(query);
    		  ps.setInt(1, subjectId);
    		  int row = ps.executeUpdate();
    		  return row > 0;
    	  }catch(Exception e) {
    		  System.out.println("Delete Subjects Failed: "+e.getMessage());
    	  }
    	  return false;
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
	
	public static boolean addQuestions(int subjectId, String question ,String option_a,String option_b,String option_c,String option_d,String  correct_option) {
		boolean result = false;
		try {
	        Connection con = getConnection();
	        String sql = "INSERT INTO questions(subject_id, question, option_a, option_b, option_c, option_d, correct_option) VALUES(?,?,?,?,?,?,?)";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, subjectId);
	        ps.setString(2, question);
	        ps.setString(3, option_a);
	        ps.setString(4, option_b);
	        ps.setString(5, option_c);
	        ps.setString(6, option_d);
	        ps.setString(7, correct_option);

	        int rows = ps.executeUpdate();
	        result = rows > 0;
	    } catch (Exception e) {
	        System.out.println("Adding questions failed: "+e.getMessage());
	    }
	    return result;
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
	
	public List<Result> getAllResults() {
	    List<Result> resultList = new ArrayList<>();

	    try (Connection con = getConnection()) {
	        String query = "SELECT r.*, u.name AS user_name, u.email AS user_email, s.subject_name " +
	                       "FROM results r " +
	                       "JOIN users u ON r.user_id = u.user_id " +
	                       "JOIN subjects s ON r.subject_id = s.subject_id";

	        PreparedStatement ps = con.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Result result = new Result();
	            result.setId(rs.getInt("result_id"));
	            result.setScore(rs.getInt("score"));
	            result.setSubjectId(rs.getInt("subject_id"));
	            result.setUserId(rs.getInt("user_id"));

	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	            String formattedDate = rs.getTimestamp("attempted_on").toLocalDateTime().format(formatter);
	            result.setQuizDate(formattedDate);

	            User user = new User();
	            user.setId(rs.getInt("user_id"));
	            user.setName(rs.getString("user_name"));
	            user.setEmail(rs.getString("user_email"));
	            result.setUser(user);

	            Subject subject = new Subject();
	            subject.setId(rs.getInt("subject_id"));
	            subject.setName(rs.getString("subject_name"));
	            result.setSubject(subject);

	            resultList.add(result);
	        }

	    } catch (Exception e) {
	        System.out.println("Error fetching all results: " + e.getMessage());
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
	
	 public static Admin getAdmin(String email,String password) 
     {
      Admin admin = null;
   	  try(Connection con = getConnection()) {
   		  String query = "SELECT * FROM admin where email=? and password=?";
   		  PreparedStatement ps = con.prepareStatement(query);
   		  ps.setString(1, email);
   		  ps.setString(2, password);
   		  ResultSet rs = ps.executeQuery();
   		  if(rs.next()) {
   			 admin = new Admin();
   			 admin.setAdmin_id(rs.getInt("admin_id"));
             admin.setName(rs.getString("name"));
             admin.setEmail(rs.getString("email"));
             admin.setPassword(rs.getString("password"));
   		  }
   	  }catch(Exception e) {
   		  System.out.println("Fetching with error "+e.getMessage());
   	  }
   	  return admin;
     }
    
	



	
}
