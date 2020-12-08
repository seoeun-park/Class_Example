package com.example.my38_isnetwork;

import androidx.appcompat.app.AppCompatActivity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    TextView textView;
    Button button1;

    WIFIReceiver wifiReceiver;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        wifiReceiver = new WIFIReceiver();

        textView = findViewById(R.id.textView);
        button1 = findViewById(R.id.button1);

        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                checkConnectivity();
            }
        });//button1.setOnClickListener()
    }//onCreate()

    private void checkConnectivity() {
        ConnectivityManager manager =
                (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo info = manager.getActiveNetworkInfo();
        if (info != null) {
            if (info.getType() == ConnectivityManager.TYPE_WIFI) {
                println("WiFi로 설정됨");
            } else if (info.getType() == ConnectivityManager.TYPE_MOBILE) {
                println("일반망으로 설정됨");
            }
            println("연결 여부 : " + info.isConnected());
        } else {
            println("데이터 통신 불가");
        }
    }//checkConnectivity()

    @Override
    protected void onResume() {
        super.onResume();

        // 레지스터 등록
        IntentFilter filter = new IntentFilter();
        filter.addAction(WifiManager.WIFI_STATE_CHANGED_ACTION);
        filter.addAction(WifiManager.NETWORK_STATE_CHANGED_ACTION);
        registerReceiver(wifiReceiver, filter);
    }//onResume()

    @Override
    protected void onPause() {
        super.onPause();

        // 레지스터 해지
        unregisterReceiver(wifiReceiver);
    }//onPause()

    // inner Class
    class WIFIReceiver extends BroadcastReceiver {

        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (action.equals(WifiManager.WIFI_STATE_CHANGED_ACTION)) {
            // → wifi가 변경되었을 때 실행

                int state = intent.getIntExtra(WifiManager.EXTRA_WIFI_STATE, -1);

                if (state == WifiManager.WIFI_STATE_ENABLED) {
                // → wifi가 연결되고 사용할 수 있을 때 실행
                    println("WiFi enabled!");
                } else if(state == WifiManager.WIFI_STATE_DISABLED) {
                  // → wifi를 사용할 수 없을 때 실행
                    println("WiFi disabled!");
                }
            } else if (action.equals(WifiManager.NETWORK_STATE_CHANGED_ACTION)) {
                NetworkInfo info = intent.getParcelableExtra(WifiManager.EXTRA_NETWORK_INFO);
                WifiManager manager = (WifiManager) getApplicationContext()
                                      .getSystemService(Context.WIFI_SERVICE);
                String ssid = manager.getConnectionInfo().getSSID();
                if (info.getState() == NetworkInfo.State.CONNECTED) {
                    println("Connected : " + ssid);
                } else if (info.getState() == NetworkInfo.State.DISCONNECTED) {
                    println("Disconnected : " + ssid);
                }
            }
        }//onReceive()

    }//class WIFIReceiver
    public void println(String str) {
        textView.append(str);
    }//println()
}//class MainActivity