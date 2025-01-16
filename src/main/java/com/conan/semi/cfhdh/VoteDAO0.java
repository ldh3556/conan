package com.conan.semi.cfhdh;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class VoteDAO0 {

    // 전체 사진 데이터 (VoteDTO0 객체들로 저장)
    private static final List<VoteDTO0> allPhotos = new ArrayList<>();

    static {
        // VoteDTO0 객체로 데이터를 추가
        allPhotos.add(new VoteDTO0("브라운", "agasa.png"));
        allPhotos.add(new VoteDTO0("이상윤", "akai.png"));
        allPhotos.add(new VoteDTO0("안기준", "amuro.png"));
        allPhotos.add(new VoteDTO0("안드레 캐멜", "camel.png"));
        allPhotos.add(new VoteDTO0("이명수", "chiba.png"));
        allPhotos.add(new VoteDTO0("코난", "conan.png"));
        allPhotos.add(new VoteDTO0("코른", "corun.png"));
        allPhotos.add(new VoteDTO0("고뭉치", "genta.png"));
        allPhotos.add(new VoteDTO0("진", "gin.png"));
        allPhotos.add(new VoteDTO0("서원상", "ginshiro.png"));
        allPhotos.add(new VoteDTO0("하기완", "hagiwara.png"));
        allPhotos.add(new VoteDTO0("우상길", "haneda.png"));
        allPhotos.add(new VoteDTO0("하인성", "heiji.png"));
        allPhotos.add(new VoteDTO0("하평무", "heizo.png"));
        allPhotos.add(new VoteDTO0("제임스 블랙", "james.png"));
        allPhotos.add(new VoteDTO0("천범기", "jugo.png"));
        allPhotos.add(new VoteDTO0("고희도", "kid.png"));
        allPhotos.add(new VoteDTO0("유명한", "kogoro.png"));
        allPhotos.add(new VoteDTO0("오경구", "kyogoku.png"));
        allPhotos.add(new VoteDTO0("송보윤", "matsuda.png"));
        allPhotos.add(new VoteDTO0("박종태", "matsumoto.png"));
        allPhotos.add(new VoteDTO0("골한석", "meguro.png"));
        allPhotos.add(new VoteDTO0("박세모", "mitsuhiko.png"));
        allPhotos.add(new VoteDTO0("임은삼", "nakamori.png"));
        allPhotos.add(new VoteDTO0("김대용", "otaki.png"));
        allPhotos.add(new VoteDTO0("천범수", "sango.png"));
        allPhotos.add(new VoteDTO0("남도일", "shinichi.png"));
        allPhotos.add(new VoteDTO0("백동훈", "shiratori.png"));
        allPhotos.add(new VoteDTO0("최수현", "subaru.png"));
        allPhotos.add(new VoteDTO0("신형선", "takagi.png"));
        allPhotos.add(new VoteDTO0("토메씨", "tomesan.png"));
        allPhotos.add(new VoteDTO0("워커", "vodka.png"));
        allPhotos.add(new VoteDTO0("정영일", "yamamura.png"));
        allPhotos.add(new VoteDTO0("남건", "yusaku.png"));
    }

    // 투표 진행 상태를 요청 객체에 설정
    public static void worldcup(HttpServletRequest request) {
        // 초기화 시 랜덤으로 16개 사진을 선택
        List<VoteDTO0> selectedPhotos = getRandomPhotos();

        // 라운드 정보 초기화
        int round = 1; // 16강부터 시작
        int totalSelections = 8; // 첫 라운드는 8명 선택

        // 세션에 선택된 사진, 라운드 정보 등을 저장
        request.getSession().setAttribute("selectedPhotos", selectedPhotos);
        request.getSession().setAttribute("round", round);
        request.getSession().setAttribute("totalSelections", totalSelections);
    }

    // 랜덤으로 16개의 사진을 선택하는 메서드
    private static List<VoteDTO0> getRandomPhotos() {
        List<VoteDTO0> shuffledPhotos = new ArrayList<>(allPhotos);
        Random rand = new Random();

        // Fisher-Yates 알고리즘으로 랜덤 섞기
        for (int i = shuffledPhotos.size() - 1; i > 0; i--) {
            int j = rand.nextInt(i + 1);
            VoteDTO0 temp = shuffledPhotos.get(i);
            shuffledPhotos.set(i, shuffledPhotos.get(j));
            shuffledPhotos.set(j, temp);
        }

        // 최소 16개 이상인 경우만 랜덤 선택
        if (shuffledPhotos.size() < 16) {
            throw new IllegalStateException("사진이 부족합니다.");
        }

        return shuffledPhotos.subList(0, 16); // 16개 반환
    }
}
