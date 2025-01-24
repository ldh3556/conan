package com.conan.semi.vote.worldcup;

public class VoteDTO_UNUSED {
    private String name;
    private String file;

    // 생성자
    public VoteDTO_UNUSED(String name, String file) {
        this.name = name;
        this.file = file;
    }

    // Getter 메서드
    public String getName() {
        return name;
    }

    public String getFile() {
        return file;
    }

    // Setter 메서드
    public void setName(String name) {
        this.name = name;
    }

    public void setFile(String file) {
        this.file = file;
    }
}
