package com.quiz.model;

public class Result {
	private int id;
    private int userId;
    private int subjectId;
    private int score;
    private String quizDate;
    private String subjectName;
    private User user;        
    private Subject subject;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getQuizDate() {
		return quizDate;
	}
	public void setQuizDate(String quizDate) {
		this.quizDate = quizDate;
	}
	public String getSubjectName() {
        return subjectName;
    }
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    public Result(int id, int userId, int subjectId, int score, String quizDate, String subjectName) {
        this.id = id;
        this.userId = userId;
        this.subjectId = subjectId;
        this.score = score;
        this.quizDate = quizDate;
        this.subjectName = subjectName;
    }
	public Result() {
		super();
	}
    
}
