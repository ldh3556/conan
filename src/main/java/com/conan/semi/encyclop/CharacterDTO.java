package com.conan.semi.encyclop;

import java.util.List;

public class CharacterDTO {
    private long id;
    private String name;
    private String age;
    private String quote;
    private String description;

    // 이미지 경로 필드
    private String buttonImage;
    private String mainImage;
    private List<String> categories;

    public CharacterDTO() {
    }

    public CharacterDTO(long id, String name, String age, String quote, String description, String buttonImage, String mainImage, List<String> categories) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.quote = quote;
        this.description = description;
        this.buttonImage = buttonImage;
        this.mainImage = mainImage;
        this.categories = categories;
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

    public List<String> getCategories() {
        return categories;
    }
    public void setCategories(List<String> categories) {
        this.categories = categories;
    }

    @Override
    public String toString() {
        return "CharacterDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age='" + age + '\'' +
                ", quote='" + quote + '\'' +
                ", description='" + description + '\'' +
                ", buttonImage='" + buttonImage + '\'' +
                ", mainImage='" + mainImage + '\'' +
                ", categories=" + categories +
                '}';
    }
}
