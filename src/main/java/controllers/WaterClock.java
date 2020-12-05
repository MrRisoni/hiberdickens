package controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

public class WaterClock {

    public static String getStrDate()
    {
        return "2020-12-01";
    }

    public static String getStrDateAndWeekAhead()
    {
        return "2020-12-01";
    }

    public static String getStrDateTime()
    {
        return "2020-12-01 10:05:10";
    }
    public static String getStrDateTimeAndWeekAhead()
    {
        return "2020-12-05 23:59:59";
    }

    public static String getStrDateTimeUTC()
    {
        return "2020-12-01 13:05:10";
    }

    public static String getStrDateTimeUTCAndWeekAhead()
    {
        return "2020-12-05 13:05:10";
    }

    public static Long getUnix()
    {
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(getStrDateTimeUTC()).getTime()  /1000L;
        }
        catch (Exception ex) {
            return 0L;
        }
    }

    public static Date getDate()  {
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(getStrDateTime());
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    public static Date getDateAWeekAhead()  {
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(getStrDateTimeAndWeekAhead());
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }
}
