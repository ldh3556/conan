package com.conan.semi.encyclop;

public class CharscterDTO {
    private long id;
    private String name;
    private String age;
    private String quote;
    private String description;

    // 이미지 경로 필드
    private String buttonImage;
    private String mainImage;

    public CharscterDTO() {
    }

    public CharscterDTO(long id, String name, String age, String quote, String description, String buttonImage) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.quote = quote;
        this.description = description;
        this.buttonImage = buttonImage;
        this.mainImage = buttonImage;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getButtonImage() {
        return buttonImage;
    }

    public void setButtonImage(String buttonImage) {
        this.buttonImage = buttonImage;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    @Override
    public String toString() {
        return "CharscterDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age='" + age + '\'' +
                ", quote='" + quote + '\'' +
                ", description='" + description + '\'' +
                ", buttonImage='" + buttonImage + '\'' +
                ", mainImage='" + mainImage + '\'' +
                '}';
    }
}
