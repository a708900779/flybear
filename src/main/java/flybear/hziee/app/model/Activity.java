package flybear.hziee.app.model;

import java.util.List;

public class Activity {

	private Integer id;
	private String name;
	private String content;
	private String location;
	private String poster;
	private Integer startDate;
	private Integer endDate;
	private String applicant;
	private Integer phoneNumber;
	private Integer applicationTime;
	private Integer maxNum;
	private String department;

    public void setId(Integer id){
        this.id = id;
    }
    public Integer getId(){
        return this.id;
    }
    public void setName(String name){
        this.name = name;
    }
    public String getName(){
        return this.name;
    }
    public void setContent(String content){
        this.content = content;
    }
    public String getContent(){
        return this.content;
    }
    public void setLocation(String location){
        this.location = location;
    }
    public String getLocation(){
        return this.location;
    }
    public void setPoster(String poster){
        this.poster = poster;
    }
    public String getPoster(){
        return this.poster;
    }
    public void setStartDate(Integer startDate){
        this.startDate = startDate;
    }
    public Integer getStartDate(){
        return this.startDate;
    }
    public void setEndDate(Integer endDate){
        this.endDate = endDate;
    }
    public Integer getEndDate(){
        return this.endDate;
    }
    public void setApplicant(String applicant){
        this.applicant = applicant;
    }
    public String getApplicant(){
        return this.applicant;
    }
    public void setPhoneNumber(Integer phoneNumber){
        this.phoneNumber = phoneNumber;
    }
    public Integer getPhoneNumber(){
        return this.phoneNumber;
    }
    public void setApplicationTime(Integer applicationTime){
        this.applicationTime = applicationTime;
    }
    public Integer getApplicationTime(){
        return this.applicationTime;
    }
    public void setMaxNum(Integer maxNum){
        this.maxNum = maxNum;
    }
    public Integer getMaxNum(){
        return this.maxNum;
    }
    public void setDepartment(String department){
        this.department = department;
    }
    public String getDepartment(){
        return this.department;
    }
}