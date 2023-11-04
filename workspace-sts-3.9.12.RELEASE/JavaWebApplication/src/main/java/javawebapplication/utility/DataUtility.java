package javawebapplication.utility;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DataUtility 
{
  /**
   * Application Date Format
   */
  public static final String APP_DATE_FORMAT = "MM/dd/yyyy";

    //	public static final String APP_TIME_FORMAT = "MM/dd/yyyy HH:mm:ss";

  /**
   * Date formatter
   */
  private static final SimpleDateFormat formatter = new SimpleDateFormat(APP_DATE_FORMAT);

  //private static final SimpleDateFormat timeFormatter = new SimpleDateFormat(APP_TIME_FORMAT);

  /**
   * Trims and trailing and leading spaces of a String
   * 
   * @param val
   * @return
   */
  public static String getString(String val) {
    if (DataValidator.isNotNull(val)) {
      return val.trim();
    } else {
      return val;
    }
  }

  /**
   * Converts and Object to String
   * 
   * @param val
   * @return
   */
  public static String getStringData(Object val) {
    
    if (val != null) {
      return val.toString();
    } else {
      return "";
    }
  }

  /**
   * Converts String into Integer
   * 
   * @param val
   * @return
   */
  public static int getInt(String val) {
    if (DataValidator.isInteger(val)) {
      return Integer.parseInt(val);
    } else {
      return 0;
    }
  }

  /**
   * Converts String into Long
   * 
   * @param val
   * @return
   */
  public static long getLong(String val) {
    if (DataValidator.isLong(val)) {
      return Long.parseLong(val);
    } else {
      return 0;
    }
  }

  /**
   * Converts String into Date
   * 
   * @param val
   * @return
   */
   public static Date getDate(String val) {
          Date date = null;
          try {
              date = formatter.parse(val);
          } catch (Exception e) {

          }
          return date;
      }

  public static Date getDate1(String val) {
    Date date = null;
    
    try {
      date = formatter.parse(val);
      
    }catch(Exception e){}
    return date;
  }
  /**
   * Converts Date into String
   * 
   * @param date
   * @return
   */
  public static String getDateString(Date date) {
    
    try {
       if(date!=null) {
        return formatter.format(date);
      }
      else{
        return "";
      }
    } catch (Exception e) {
      return "";
    }
    
  }

  /**
   * Gets date after n number of days
   * 
   * @param date
   * @param day
   * @return
   */
  public static Date getDate(Date date, int day) {
    return null;
  }

  /**
   * Converts String into Time
   * 
   * @param cdt
   * @return
   */
  public static Timestamp getTimestamp(long l) {

    Timestamp timeStamp = null;
    try {
      timeStamp = new Timestamp(l);
    } catch (Exception e) {
      return null;
    }
    return timeStamp;
  }
  
  /**
   * Converts String into Time
   * 
   * @param cdt
   * @return
   */
  public static Timestamp getTimestamp(String cdt) {

    Timestamp timeStamp = null;
    try {
    //	timeStamp = new Timestamp((timeFormatter.parse(cdt)).getTime());
    } catch (Exception e) {
      return null;
    }
    return timeStamp;
  }
  /**
   * Converts Time into Long
   * 
   * @param tm
   * @return
   */
  public static long getTimestamp(Timestamp tm) {
    try {
      return tm.getTime();
    } catch (Exception e) {
      return 0;
    }
  }
  
  /**
   * Provide Current time
   * 
   * 
   * @return Time
   */
  public static Timestamp getCurrentTimestamp() {
    Timestamp timeStamp = null;
    try {
      timeStamp = new Timestamp(new Date().getTime());
    } catch (Exception e) {
    }
    return timeStamp;

  }



}