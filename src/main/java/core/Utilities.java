package core;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Utilities {

    private static ObjectMapper omp;

    public static ObjectMapper getObjectMapper()
    {
        return omp;
    }
}
