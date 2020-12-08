package com.example.my31_audioplayer;

import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.io.IOException;

public class MainActivity extends AppCompatActivity {
    String AUDIO_URL =
            "http://sites.google.com/site/ubiaccessmobile/sample_audio.amr";

    MediaPlayer mediaPlayer;
    int position = 0;

    Button btnStart, btnStop, btnPause, btnRestart;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnStart = findViewById(R.id.button1);
        btnStop = findViewById(R.id.button2);
        btnPause = findViewById(R.id.button3);
        btnRestart = findViewById(R.id.button4);

        btnStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //playAudio(AUDIO_URL);
                playAudio1(R.raw.m01);
                Toast.makeText(MainActivity.this,
                               "음악파일 재생",
                                Toast.LENGTH_SHORT).show();
            }
        });//btnStart.setOnClickListener()

        btnStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (mediaPlayer != null) {
                    mediaPlayer.stop();
                    mediaPlayer.release();
                    Toast.makeText(MainActivity.this,
                                    "음악파일 중지",
                                    Toast.LENGTH_SHORT).show();
                }
            }//onClick()
        });//btnStop.setOnClickListener()

        btnPause.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (mediaPlayer != null) {
                    position = mediaPlayer.getCurrentPosition();
                    // 미디어 플레이어 위치
                    mediaPlayer.pause();
                    Toast.makeText(MainActivity.this,
                                    "음악파일 일시중지",
                                    Toast.LENGTH_SHORT).show();
                }
            }//onClick()
        });//btnPause.setOnClickListener()

        btnRestart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (mediaPlayer != null && !mediaPlayer.isPlaying()) {
                    mediaPlayer.start();
                    mediaPlayer.seekTo(position);   //멈춘 상태에서 play
                }
            }//onClick()
        });//btnRestart.setOnClickListener()

    }//onCreate()

    private void playAudio(String audio_url) {
        killMediaPlayer();

        try {
            mediaPlayer = new MediaPlayer();
            mediaPlayer.setDataSource(audio_url);
            mediaPlayer.prepare();
            mediaPlayer.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }//playAudio()

    private void playAudio1(int resId) {
        killMediaPlayer();

        try {
            mediaPlayer = new MediaPlayer();
            mediaPlayer = MediaPlayer.create(getApplicationContext(), resId);
            mediaPlayer.start();
        } catch (Exception e) {
            e.getMessage();
        }
    }//playAudio1()

    private void killMediaPlayer() {
        if(mediaPlayer != null) {   // 플레이어를 재생할 때
            mediaPlayer.release();  //기존에 있던 메모리를 없애기
        }
    }//killMediaPlayer()
}//class