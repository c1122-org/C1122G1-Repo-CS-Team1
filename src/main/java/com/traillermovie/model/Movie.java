package com.traillermovie.model;

public class Movie {
    private int id;
    private String title;
    private double rating;
    private int rank;
    private int yearPublic;
    private String image;
    private String description;
    private String trailer;
    private int genre;

    public Movie(int id, String title, double rating, int rank, int yearPublic, String image, String description, String trailer, int genre) {
        this.id = id;
        this.title = title;
        this.rating = rating;
        this.rank = rank;
        this.yearPublic = yearPublic;
        this.image = image;
        this.description = description;
        this.trailer = trailer;
        this.genre = genre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public int getYearPublic() {
        return yearPublic;
    }

    public void setYearPublic(int yearPublic) {
        this.yearPublic = yearPublic;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public int getGenre() {
        return genre;
    }

    public void setGenre(int genre) {
        this.genre = genre;
    }
}
