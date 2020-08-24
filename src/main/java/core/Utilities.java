package core;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;

public class Utilities {

    private static ObjectMapper omp;

    public static ObjectMapper getObjectMapper()
    {
        return omp;
    }

    public static HashMap<String,Integer> getPaginationPages(int pageId,int perPage, int totalRecords) {
        int totalPages = 0;
        int start  =0;

        totalPages = totalRecords / perPage;

        if  ((totalPages % perPage) >0) {
            totalPages++;
        }

        start = (pageId >1) ? (pageId * perPage) - perPage : 0;

        HashMap<String,Integer> rsp = new HashMap();

        rsp.put("start",start);
        rsp.put("totalPages",totalPages);

        return rsp;

    }
}
