package flybear.hziee.app.util;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatDate {

	public FormatDate(){
	}
	//获取当前时间的11位时间戳精确到日
	public  Integer getDateNowByDay() throws ParseException{
		Date d = new Date(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");  
        String dateNowStr = sdf.format(d);  
        long re=stringToLong(dateNowStr,"yyyy年MM月dd日");
        return (int)(re/1000);
	}
	//获取当前时间的11位时间戳精确到日
		public  Integer getDateByString(String dateNowStr) throws ParseException{
	        long re=stringToLong(dateNowStr,"yyyy年MM月dd日");
	        return (int)(re/1000);
		}
	
	//获取当前时间的11位时间戳精确到秒
	public Integer getDateNowBySeconds() throws ParseException{
		Date d = new Date(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");  
        String dateNowStr = sdf.format(d);  
        long re=stringToLong(dateNowStr,"yyyy年MM月dd日HH时mm分ss秒");
        return (int)(re/1000);
	}
	// date类型转换为String类型
    // formatType格式为yyyy-MM-dd HH:mm:ss//yyyy年MM月dd日 HH时mm分ss秒
    // data Date类型的时间
    public static String dateToString(Date data, String formatType) {
    return new SimpleDateFormat(formatType).format(data);
    }
    
    public  String stampToDate(String s){
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long lt = new Long(s);
        Date date = new Date(lt);
        res = simpleDateFormat.format(date);
        return res;
    }

    
    // string类型转换为date类型
    // strTime要转换的string类型的时间，formatType要转换的格式yyyy-MM-dd HH:mm:ss//yyyy年MM月dd日
    // HH时mm分ss秒，
    // strTime的时间格式必须要与formatType的时间格式相同
    public static Date stringToDate(String strTime, String formatType)
    throws ParseException, java.text.ParseException {
    SimpleDateFormat formatter = new SimpleDateFormat(formatType);
    Date date = null;
    date = formatter.parse(strTime);
    return date;
    }
    
    // long转换为Date类型
    // currentTime要转换的long类型的时间
    // formatType要转换的时间格式yyyy-MM-dd HH:mm:ss//yyyy年MM月dd日 HH时mm分ss秒
    public static Date longToDate(long currentTime, String formatType)
    throws ParseException, java.text.ParseException {
    Date dateOld = new Date(currentTime); // 根据long类型的毫秒数生命一个date类型的时间
    String sDateTime = dateToString(dateOld, formatType); // 把date类型的时间转换为string
    Date date = stringToDate(sDateTime, formatType); // 把String类型转换为Date类型
    return date;
    }
    
    // string类型转换为long类型
    // strTime要转换的String类型的时间
    // formatType时间格式
    // strTime的时间格式和formatType的时间格式必须相同
    public static long stringToLong(String strTime, String formatType)
    throws ParseException, java.text.ParseException {
    Date date = stringToDate(strTime, formatType); // String类型转成date类型
    if (date == null) {
    return 0;
    } else {
    long currentTime = dateToLong(date); // date类型转成long类型
    return currentTime;
    }
    }
    
    // date类型转换为long类型
    // date要转换的date类型的时间
    public static long dateToLong(Date date) {
    return date.getTime();
    }
    public static String numToDate(int number,String formatType){
        Date date = new Date(number);
        SimpleDateFormat sdf = new SimpleDateFormat(formatType);
        return sdf.format(date);
    }
}
