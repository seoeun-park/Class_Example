package com.example.my32_audiorecorder;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.content.pm.PackageManager;
import android.media.MediaPlayer;
import android.media.MediaRecorder;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.io.File;
import java.io.IOException;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";
    
    String filename;
    MediaPlayer mediaPlayer;
    MediaRecorder recorder;
    
    Button btnRec, btnRecStop, btnStart, btnStop;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        checkDangerousPermissions();
        
        String sdcard = Environment.getExternalStorageDirectory().getAbsolutePath();
        // 내가 사용하고 있는 sd card의 절대 경로
        
        filename = sdcard + File.separator + "recorded.mp4";
        //File.separator => /

        Log.d(TAG, "onCreate: " + filename);
        
        btnRec = findViewById(R.id.button1);
        btnRecStop = findViewById(R.id.button2);
        btnStart = findViewById(R.id.button3);
        btnStop = findViewById(R.id.button4);

        btnRec.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (recorder != null) {
                    recorder.stop();
                    recorder.release();
                    recorder = null;
                    // recorder의 메모리 초기화
                }
                recorder = new MediaRecorder();
                recorder.setAudioSource(MediaRecorder.AudioSource.MIC);
                recorder.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4);
                recorder.setAudioEncoder(MediaRecorder.AudioEncoder.DEFAULT);
                recorder.setOutputFile(filename);

                Toast.makeText(MainActivity.this,
                                "녹음 시작",
                                Toast.LENGTH_SHORT).show();
                try {
                    recorder.prepare();
                    recorder.start();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }//onClick()
        });//btnStart.setOnClickListener()

        btnRecStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (recorder == null) {
                    return;
                }
                recorder.stop();
                recorder.release();
                recorder = null;
                Toast.makeText(MainActivity.this,
                                "녹음 중지",
                                Toast.LENGTH_SHORT).show();
            }//onClick()
        });//btnRecStop.setOnClickListener()

        btnStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                playAudio(filename);
                Toast.makeText(MainActivity.this,
                                "재생 시작",
                                Toast.LENGTH_SHORT).show();
            }
        });//btnStart.setOnClickListener()

        btnStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                killMediaPlayer();
                Toast.makeText(MainActivity.this,
                                "재생 중지",
                                Toast.LENGTH_SHORT).show();
            }
        });//btnStop.setOnClickListener()
        
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

    private void killMediaPlayer() {
        if(mediaPlayer != null) {   // 플레이어를 재생할 때
            mediaPlayer.stop();
            mediaPlayer.release();
            mediaPlayer = null;
            //기존에 있던 메모리 완전 초기화
        }
    }//killMediaPlayer()
    
    //----------------------------------------------------------------------
    // 위험 권한
    private void checkDangerousPermissions() {
        String[] permissions = {
                Manifest.permission.RECORD_AUDIO,
                Manifest.permission.READ_EXTERNAL_STORAGE,
                Manifest.permission.WRITE_EXTERNAL_STORAGE
        };

        int permissionCheck = PackageManager.PERMISSION_GRANTED;
        for (int i = 0; i < permissions.length; i++) {
            permissionCheck = ContextCompat.checkSelfPermission(this, permissions[i]);
            if (permissionCheck == PackageManager.PERMISSION_DENIED) {
                break;
            }
        }

        if (permissionCheck == PackageManager.PERMISSION_GRANTED) {
            Toast.makeText(this, "권한 있음", Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(this, "권한 없음", Toast.LENGTH_LONG).show();

            if (ActivityCompat.shouldShowRequestPermissionRationale(this, permissions[0])) {
                Toast.makeText(this, "권한 설명 필요함.", Toast.LENGTH_LONG).show();
            } else {
                ActivityCompat.requestPermissions(this, permissions, 1);
            }
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == 1) {
            for (int i = 0; i < permissions.length; i++) {
                if (grantResults[i] == PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this, permissions[i] + " 권한이 승인됨.", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(this, permissions[i] + " 권한이 승인되지 않음.", Toast.LENGTH_LONG).show();
                }
            }
        }
    }
}//class