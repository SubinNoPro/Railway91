package entity;

import com.sun.org.apache.xerces.internal.impl.xs.SchemaNamespaceSupport;

import java.util.Scanner;

public class News implements INews {
    private int newsID;
    private String title;
    private String publishDate;
    private String author;
    private String content;
    private float averageRate;

    public News(int newsID, String title, String publishDate, String author, String content) {
        this.newsID = newsID;
        this.title = title;
        this.publishDate = publishDate;
        this.author = author;
        this.content = content;
    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public float getAverageRate() {
        return averageRate;
    }

    @Override
    public void Display() {
        System.out.println(this.title + " | " + this.publishDate + " | " + this.author + " | " + this.content + " | " + this.averageRate);
    }

    @Override
    public float Calculate() {
        int[] rates = new int[3];
        Scanner scanner = new Scanner(System.in);
        for (int i = 0; i < 3;i++){
            System.out.println("Enter rate " + (i+1) + ": ");
            rates[i] = scanner.nextInt();
        }
        this.averageRate = ((rates[0] + rates[1] + rates [2])/3);
        return averageRate;

    }
}
