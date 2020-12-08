package com.example.my40_notice;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.NotificationCompat;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    Button button1, button2, button3;

    NotificationManager manager;
    private static String CHANNEL_ID1 = "channel1";
    private static String CHANNEL_NAME1 = "channel1";

    private static String CHANNEL_ID2 = "channel2";
    private static String CHANNEL_NAME2 = "channel2";

    private static String CHANNEL_ID3 = "channel3";
    private static String CHANNEL_NAME3 = "channel3";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button1 = findViewById(R.id.button1);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showNoti1();
            }
        });//button1.setOnClickListener()

        button2 = findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showNoti2();
            }
        });//button2.setOnClickListener()

        button3 = findViewById(R.id.button3);
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showNoti3();
            }
        });//button3.setOnClickListener()
    }//onCreate()

    private void showNoti1() {
        manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

        NotificationCompat.Builder builder = null;
        //오레오 버전 이전과 이후가 다름, 알림을 클릭해도 변화없음

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
        // 오레오 이후 버전은 알림 채널을 생성해야 함
            if (manager.getNotificationChannel(CHANNEL_ID1) == null) {
                manager.createNotificationChannel(new NotificationChannel(
                        CHANNEL_ID1, CHANNEL_NAME1, NotificationManager.IMPORTANCE_DEFAULT
                ));
            }
            builder = new NotificationCompat.Builder(this, CHANNEL_ID1);
        } else {
            builder = new NotificationCompat.Builder(this);
        }
        builder.setContentTitle("간단 알림");           //알림 제목
        builder.setContentText("알림 메세지 입니다.");   //알림 내용
        builder.setSmallIcon(android.R.drawable.ic_menu_view);
        Notification noti = builder.build();

        manager.notify(1, noti);
    }//showNoti1()

    private void showNoti2() {
        manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

        NotificationCompat.Builder builder = null;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            if (manager.getNotificationChannel(CHANNEL_ID2) == null) {
                manager.createNotificationChannel(new NotificationChannel(
                        CHANNEL_ID2, CHANNEL_NAME2, NotificationManager.IMPORTANCE_DEFAULT
                ));
            }
            builder = new NotificationCompat.Builder(this, CHANNEL_ID2);
        } else {
            builder = new NotificationCompat.Builder(this);
        }

        // 펜딩 인텐트 객체에 서브 액티비티가 띄워지게끔 설정
        Intent intent = new Intent(this, SubActivity.class);
        PendingIntent pendingIntent = PendingIntent
                .getActivity(this, 1004,
                              intent, PendingIntent.FLAG_UPDATE_CURRENT);
        builder.setContentTitle("간단 알림 클릭");
        builder.setContentText("클릭 알림 메세지입니다.");
        builder.setSmallIcon(android.R.drawable.ic_menu_view);

        builder.setAutoCancel(true);
        // → 알림 클릭 시 자동으로 알림 표시를 삭제

        builder.setContentIntent(pendingIntent);
        // → 서브 액티비티가 띄워짐

        Notification noti = builder.build();

        manager.notify(2, noti);
    }//showNoti2()

    private void showNoti3() {
        manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

        NotificationCompat.Builder builder = null;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            if (manager.getNotificationChannel(CHANNEL_ID3) == null) {
                manager.createNotificationChannel(new NotificationChannel(
                        CHANNEL_ID3, CHANNEL_NAME3, NotificationManager.IMPORTANCE_DEFAULT
                ));
            }
            builder = new NotificationCompat.Builder(this, CHANNEL_ID3);
        } else {
            builder = new NotificationCompat.Builder(this);
        }
        NotificationCompat.BigTextStyle style =
                new NotificationCompat.BigTextStyle();
        style.bigText("많은 글자들입니다. 많은 글자들입니다. 많은 글자들입니다. 많은 글자들입니다." +
                "많은 글자들입니다. 많은 글자들입니다. 많은 글자들입니다. 많은 글자들입니다." +
                "많은 글자들입니다. 많은 글자들입니다. 많은 글자들입니다. 많은 글자들입니다.");
        style.setBigContentTitle("제목입니다.");
        style.setSummaryText("요약글 입니다.");

        builder = new NotificationCompat.Builder(this, "channel3")
                .setSmallIcon(android.R.drawable.ic_menu_send)
                .setStyle(style);
        Notification noti = builder.build();
        manager.notify(3, noti);

    }//showNoti3()
}//class