package com.example.my33_videoplayer;

import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.MediaController;
import android.widget.Toast;
import android.widget.VideoView;

public class MainActivity extends AppCompatActivity {
    public String VIDEO_URL =
            "http://sites.google.com/site/ubiaccessmobile/sample_video.mp4";

    Button button1;
    VideoView videoView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        videoView = findViewById(R.id.videoView);
        button1 = findViewById(R.id.button1);

        MediaController mc = new MediaController(this);
        videoView.setMediaController(mc);

        // 플레이가 준비되었을 때 실행되는 메소드
        videoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
            @Override
            public void onPrepared(MediaPlayer mediaPlayer) {
                Toast.makeText(MainActivity.this,
                                "동영상이 준비됨",
                                Toast.LENGTH_SHORT).show();
            }
        });//videoView.setOnPreparedListener()

        videoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mediaPlayer) {
                Toast.makeText(MainActivity.this,
                                "동영상이 완료됨",
                                Toast.LENGTH_SHORT).show();
            }
        });//videoView.setOnCompletionListener()

        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                videoView.setVideoURI(Uri.parse(VIDEO_URL));
                videoView.requestFocus();
                videoView.start();
            }
        });//button1.setOnClickListener()
    }//onCreate()

    @Override
    protected void onResume() {
        super.onResume();
        Toast.makeText(MainActivity.this,
                        "동영상이 준비중...",
                        Toast.LENGTH_SHORT).show();
    }//onResume()
}//class