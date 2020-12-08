package com.example.my14_smsservice;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.telephony.SmsMessage;
import android.util.Log;

import java.text.SimpleDateFormat;
import java.util.Date;

/* BroadcastReceiver 클래스를 상속받아 구현될 수신 시스템 (Receiver) */

public class MyReceiver extends BroadcastReceiver {
    private static final String TAG = "mainMyReceiver";
    // → TAG 값은 기본값 앞에 'main'을 붙여주는 것이 좋다

    // SimpleDateFormat 클래스 : 날짜 출력 형태를 지정할 때 쓰이는 클래스
    public SimpleDateFormat dateFormat =
            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    // onReceive() : 원하는 브로드캐스트 메세지가 도착하면 자동으로 호출되는 메소드
    @Override
    public void onReceive(Context context, Intent intent) {
        //매개변수 : context → 환경설정 / intent → 문자 메세지 내용
        Log.d(TAG, "onReceive: 호출됨");

        Bundle bundle = intent.getExtras();
        // → intent에 담겨있는 데이터를 bundle에 대입
        // → intent.getExtras() : intent에 담겨있는 데이터를 받을 때 쓰는 메소드

        SmsMessage[] messages = parseSmsMessage(bundle);
        // → 사용자가 메세지를 1개만 전달한다고 하더라도 실제로 전달되는 메세지는
        //   여러 개일 수 있으므로 배열로 선언해야 한다.

        // messages 변수에 메세지 내용이 있을 경우 실행
        if (messages != null && messages.length > 0) {
            Log.d(TAG, "onReceive: 수신함");

            String sender = messages[0].getOriginatingAddress();
            // → getOriginatingAddress() : 발신자의 번호를 반환하는 메소드(Smsmessage의 내장 함수)
            Log.d(TAG, "sender : " + sender);

            Date receivedDate = new Date(messages[0].getTimestampMillis());
            // → getTimestampMillis() : SMS 받은 시각을 반환하는 메소드(Smsmessage의 내장 함수)
            Log.d(TAG, "receivedDate : " + receivedDate);

            String contents = messages[0].getMessageBody();
            // → getMessageBody() : 문자 메세지의 내용을 반환하는 메소드(Smsmessage의 내장 함수)
            Log.d(TAG, "contents : " + contents);

            // 새로운 화면을 띄우기 위한 코드
            Intent disIntent = new Intent(context, SmsDisplayActivity.class);
            disIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK |
                                // 새로운 task를 생성하여 그 task안에 activity를 추가.
                                // 브로드캐스트 수신자는 화면이 없으므로 인텐트의 플래그로
                                // FLAG_ACTIVITY_NEW_TASK를 추가해야 한다.
                               Intent.FLAG_ACTIVITY_SINGLE_TOP |
                                // 새 SmsDisplayActivity를 띄우지 않고 기존의 SmsDisplayActivity에 내용을 갱신
                                // 즉, 이미 메모리에 만든 SmsDisplayActivity가 있을 때
                                // Activity를 중복 생성 하지 않도록 해야한다.
                               Intent.FLAG_ACTIVITY_CLEAR_TOP);
            // → intent에 플래그 추가
            disIntent.putExtra("sender", sender);
            disIntent.putExtra("receivedDate", dateFormat.format(receivedDate));
            disIntent.putExtra("contents", contents);
            //→ disIntent.putExtra() 메소드로 disintent에 데이터를 전달
            context.startActivity(disIntent);
            // startActivity 메소드로 이 intent를 시스템으로 전달하면
            // 시스템이 그 intent를 SmsDisplayActivity로 전달한다.

        }//if
    }//onReceive()

    private SmsMessage[] parseSmsMessage(Bundle bundle) {
        Object[] objs = (Object[]) bundle.get("pdus");
        // → Bundle 객체에 들어가 있는 부가 데이터 중에서 pdus 가져오기

        SmsMessage[] messages = new SmsMessage[objs.length];

        // 단말 OS 버전에 따라 다른 방식으로 메소드를 호출해야한다.
        // 오래된 버전은 puds안에 format이 없기 때문에 버전에 따라 다르게 처리해야한다.
        for (int i = 0; i < objs.length; i++) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                String format = bundle.getString("format");
                messages[i] = SmsMessage.createFromPdu((byte[]) objs[i], format);
            } else {
                messages[i] = SmsMessage.createFromPdu((byte[]) objs[i]);
            }
        }//for

        return messages;
    }//parseSmsMessage
}//class
