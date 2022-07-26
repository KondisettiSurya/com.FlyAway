package model;

public abstract class Search {
    public static String date;
    public static String day; //database
    public static String source;//databse
    public static String destination;//database
    public static int persons; // 1,2,3,4,5,6,

    public static String getQuery() {
        return
        		"SELECT * FROM flight WHERE source = '"+source+"' AND destination= '"+destination+"' AND days like '%"+day+"%'";
    }
}
