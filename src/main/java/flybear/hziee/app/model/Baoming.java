package flybear.hziee.app.model;

import java.util.List;

public class Baoming {

	private Integer id;
	private Integer activityId;
	private Integer studentId;
	private Integer time;

    public void setId(Integer id){
        this.id = id;
    }
    public Integer getId(){
        return this.id;
    }
    public void setActivityId(Integer activityId){
        this.activityId = activityId;
    }
    public Integer getActivityId(){
        return this.activityId;
    }
    public void setStudentId(Integer studentId){
        this.studentId = studentId;
    }
    public Integer getStudentId(){
        return this.studentId;
    }
    public void setTime(Integer time){
        this.time = time;
    }
    public Integer getTime(){
        return this.time;
    }
}