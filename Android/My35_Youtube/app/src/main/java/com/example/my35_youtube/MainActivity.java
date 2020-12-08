package com.example.my35_youtube;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import com.google.android.youtube.player.YouTubeBaseActivity;
import com.google.android.youtube.player.YouTubeInitializationResult;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.YouTubePlayerView;

public class MainActivity extends YouTubeBaseActivity {
    private static final String TAG = "MainActivity";

    Button button1;
    YouTubePlayerView playerView;
    YouTubePlayer player;

    private static String API_KEY = "AIzaSyD7wAJVRHAe2jMHZSouoMxf-8-sjJPZUn0";
    private static String videoId = "50LHfSFIcHc";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        initPlayer();

        button1 = findViewById(R.id.button1);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                playVieo();
            }
        });//button1.setOnClickListener()

    }//onCreate()

    private void playVieo() {
        if (player != null) {
            if (player.isPlaying()) {
                player.pause();
            }

            player.cueVideo(videoId);
        }
    }//playVieo()

    private void initPlayer() {
        playerView = findViewById(R.id.playerView);
        playerView.initialize(API_KEY, new YouTubePlayer.OnInitializedListener() {
            // 초기화 성공시 실행되는 메소드
            @Override
            public void onInitializationSuccess(YouTubePlayer.Provider provider,
                                                YouTubePlayer youTubePlayer, boolean b) {
                player = youTubePlayer;
                player.setPlayerStateChangeListener(new YouTubePlayer.PlayerStateChangeListener() {
                    // 로딩 중
                    @Override
                    public void onLoading() {

                    }
                    // 로딩 완료
                    @Override
                    public void onLoaded(String s) {
                        Log.d(TAG, "onLoaded: 호출됨");
                        player.play();      // 동영상 시작
                    }

                    @Override
                    public void onAdStarted() {

                    }

                    @Override
                    public void onVideoStarted() {

                    }

                    @Override
                    public void onVideoEnded() {

                    }

                    @Override
                    public void onError(YouTubePlayer.ErrorReason errorReason) {

                    }
                });
            }

            // 초기화 실패시 실행되는 메소드
            @Override
            public void onInitializationFailure(YouTubePlayer.Provider provider,
                                                YouTubeInitializationResult youTubeInitializationResult) {

            }
        });

    }//initPlayer()
}//class

/*
왼쪽 상단 Android를 Project 탭으로 바꿈
app > libs 폴더에 YouTubeAndroidPlayerApi.jar 파일 복사
> file 탭 > Project Structure > Dependencies > app 클릭 > +버튼 클릭 > Jar Dependency 클릭 >
> libs\YouTubeAndroidPlayerApi.jar 클릭해서 확인 버튼

구글 계정 로그인 > console.developers.google.com 접속 >
 */