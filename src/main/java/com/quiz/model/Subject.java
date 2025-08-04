package com.quiz.model;

public class Subject {
private int id;
private String name;
private String subjectName;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getSubjectName() {
    return subjectName;
}
public void setSubjectName(String subjectName) {
    this.subjectName = subjectName;
}

public Subject(int id, String name) {
	super();
	this.id = id;
	this.name = name;
}
public Subject() {
	super();
}

}
