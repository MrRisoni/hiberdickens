package responses;

import models.GroupStudent;

import java.util.List;

public class MasterResponse {

    private String errorMessage;
    private boolean hasError;
    private List<Object> data;
    private List<GroupStudent> datei;

    public MasterResponse() {
        this.hasError = false;
        this.errorMessage = "";
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
        this.hasError = true;
    }

    public boolean isHasError() {
        return hasError;
    }

    public void setHasError(boolean hasError) {
        this.hasError = hasError;
    }

    public List<Object> getData() {
        return data;
    }

    public void setData(List<Object> data) {
        this.data = data;
    }

    public List<GroupStudent> getDatei() {
        return datei;
    }

    public void setDatei(List<GroupStudent> datei) {
        this.datei = datei;
    }
}
