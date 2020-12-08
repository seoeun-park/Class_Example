package com.example.my13_service;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

public class MyService extends Service {
    private static final String TAG = "mainMyService";

    public MyService() {}

    @Override
    public void onCreate() {
        super.onCreate();
        Log.d(TAG, "onCreate: 호출됨");
    }//onCreate()

    // onStartCommand() : startService() 메소드를 호출해서
    //                    서비스가 시작되면 자동으로 시작되는 메소드
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Log.d(TAG, "onStartCommand: 호출됨");

        if (intent == null) {
            return Service.START_STICKY;    //intent가 null일때 service 재시작
        } else {
            processCommand(intent);
        }

        return super.onStartCommand(intent, flags, startId);
    }//onStartCommand()

    private void processCommand(Intent intent) {
        String command = intent.getStringExtra("command");
        String name = intent.getStringExtra("name");
        Log.d(TAG, "processCommand: " + command + ", " + name);

        for (int i = 0; i < 5; i++) {
            try {
                Thread.sleep(1000);
                // → Thread 상태 제어 : 주어진 시간동안 일시정지(sleep())
            } catch (InterruptedException e) {
                e.getMessage();
            }//try-catch

            Log.d(TAG, "Waiting " + i + " second...");
        }//for
    }//processCommand()

    @Override
    public IBinder onBind(Intent intent) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy: 호출됨");
    }//onDestroy()
}//class
