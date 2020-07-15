package core;

class MiniHour {
    private int startin;
    private int ending;
    private String title;

    public MiniHour(int startin, int ending, String title) {
        this.startin = startin;
        this.ending = ending;
        this.title = title;
    }

    public int getStartin() {
        return startin;
    }

    public void setStartin(int startin) {
        this.startin = startin;
    }

    public int getEnding() {
        return ending;
    }

    public void setEnding(int ending) {
        this.ending = ending;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
