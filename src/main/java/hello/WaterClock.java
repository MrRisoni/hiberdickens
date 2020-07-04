package hello;

import org.springframework.beans.factory.annotation.Value;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class WaterClock {




    public static String getStrDate()
    {
        return "2019-09-21 10:05:10";
    }

    public static Date getDate()  {
        try {
            System.out.println(getStrDate());

            return new SimpleDateFormat("YYYY-MM-dd H:m:s").parse(getStrDate());
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

}
