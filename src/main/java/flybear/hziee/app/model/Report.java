package flybear.hziee.app.model;

import java.util.List;

public class Report {

	private Integer id;
	private String reportContent;
	private String reporter;
	private String reportObject;
	private Integer reportTime;
	private Integer reportState;
	private String reportAnswer;
	private String reportProcess;

    public void setId(Integer id){
        this.id = id;
    }
    public Integer getId(){
        return this.id;
    }
    public void setReportContent(String reportContent){
        this.reportContent = reportContent;
    }
    public String getReportContent(){
        return this.reportContent;
    }
    public void setReporter(String reporter){
        this.reporter = reporter;
    }
    public String getReporter(){
        return this.reporter;
    }
    public void setReportObject(String reportObject){
        this.reportObject = reportObject;
    }
    public String getReportObject(){
        return this.reportObject;
    }
    public void setReportTime(Integer reportTime){
        this.reportTime = reportTime;
    }
    public Integer getReportTime(){
        return this.reportTime;
    }
    public void setReportState(Integer reportState){
        this.reportState = reportState;
    }
    public Integer getReportState(){
        return this.reportState;
    }
    public void setReportAnswer(String reportAnswer){
        this.reportAnswer = reportAnswer;
    }
    public String getReportAnswer(){
        return this.reportAnswer;
    }
    public void setReportProcess(String reportProcess){
        this.reportProcess = reportProcess;
    }
    public String getReportProcess(){
        return this.reportProcess;
    }
}