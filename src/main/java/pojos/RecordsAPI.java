package pojos;

import lombok.Data;

@Data
public class RecordsAPI {
    private int totalPages;
    private int currentPage;
    private int totalRecords;

    public RecordsAPI() {
    }
}