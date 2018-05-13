package flybear.hziee.app.model;

import java.util.List;

public class Student {

	private Integer id;
	private String grade;
	private Integer classNumber;
	private Integer studentId;
	private String password;
	private String studentName;
	private String major;
	private String counselor;
	private String activityName;
	private Integer activityNum;
	private String laActivityName;
	private Integer laActivityNum;

    public void setId(Integer id){
        this.id = id;
    }
    public Integer getId(){
        return this.id;
    }
    public void setGrade(String grade){
        this.grade = grade;
    }
    public String getGrade(){
        return this.grade;
    }
    public void setClassNumber(Integer classNumber){
        this.classNumber = classNumber;
    }
    public Integer getClassNumber(){
        return this.classNumber;
    }
    public void setStudentId(Integer studentId){
        this.studentId = studentId;
    }
    public Integer getStudentId(){
        return this.studentId;
    }
    public void setPassword(String password){
        this.password = password;
    }
    public String getPassword(){
        return this.password;
    }
    public void setStudentName(String studentName){
        this.studentName = studentName;
    }
    public String getStudentName(){
        return this.studentName;
    }
    public void setMajor(String major){
        this.major = major;
    }
    public String getMajor(){
        return this.major;
    }
    public void setCounselor(String counselor){
        this.counselor = counselor;
    }
    public String getCounselor(){
        return this.counselor;
    }
    public void setActivityName(String activityName){
        this.activityName = activityName;
    }
    public String getActivityName(){
        return this.activityName;
    }
    public void setActivityNum(Integer activityNum){
        this.activityNum = activityNum;
    }
    public Integer getActivityNum(){
        return this.activityNum;
    }
    public void setLaActivityName(String laActivityName){
        this.laActivityName = laActivityName;
    }
    public String getLaActivityName(){
        return this.laActivityName;
    }
    public void setLaActivityNum(Integer laActivityNum){
        this.laActivityNum = laActivityNum;
    }
    public Integer getLaActivityNum(){
        return this.laActivityNum;
    }
}