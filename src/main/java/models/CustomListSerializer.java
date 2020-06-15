package models;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CustomListSerializer extends JsonSerializer<List<HistoryModel>> {


    @Override
    public void serialize(
            List<HistoryModel> items,
            JsonGenerator generator,
            SerializerProvider provider)
            throws IOException, JsonProcessingException {

        List<HistoryModel> ids = new ArrayList<>();
       for (HistoryModel item : items) {
           HistoryModel mdl = new HistoryModel();
           mdl.setStarted(item.getStarted());
            ids.add(mdl);
        }
        ids = items;
        generator.writeObject(ids);
    }
}