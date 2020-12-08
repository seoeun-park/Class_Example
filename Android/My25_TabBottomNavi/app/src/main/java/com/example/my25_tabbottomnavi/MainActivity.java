package com.example.my25_tabbottomnavi;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;

public class MainActivity extends AppCompatActivity {
    Fragment1 fragment1;
    Fragment2 fragment2;
    Fragment3 fragment3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        fragment1 = new Fragment1();
        fragment2 = new Fragment2();
        fragment3 = new Fragment3();

        getSupportFragmentManager().beginTransaction()
                .replace(R.id.container, fragment1).commit();
        // → fragment1을 메인에 있는 FrameLayout에 붙여 넣기

        final BottomNavigationView bottomNavigationView
                = findViewById(R.id.bottom_navigation);

        bottomNavigationView.setOnNavigationItemSelectedListener
                (new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull final MenuItem menuItem) {
            // 매개변수 : menuItem 선택한 탭 그 자체
                switch (menuItem.getItemId()) {
                    case R.id.tab1 :
                        Toast.makeText(MainActivity.this,
                                        "첫 번째 메뉴 클릭",
                                        Toast.LENGTH_SHORT).show();
                        getSupportFragmentManager().beginTransaction()
                                .replace(R.id.container, fragment1).commit();
                        break;
                    case R.id.tab2 :
                        Toast.makeText(MainActivity.this,
                                        "두 번째 메뉴 클릭",
                                        Toast.LENGTH_SHORT).show();
                        getSupportFragmentManager().beginTransaction()
                                .replace(R.id.container, fragment2).commit();
                        break;
                    case R.id.tab4 :
                        Toast.makeText(MainActivity.this,
                                        "세 번째 메뉴 클릭",
                                        Toast.LENGTH_SHORT).show();
                        getSupportFragmentManager().beginTransaction()
                                .replace(R.id.container, fragment3).commit();
                        break;
                }//switch

                bottomNavigationView.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        int itemId = menuItem.getItemId();
                        if (itemId == R.id.tab3) {
                            Intent intent = new Intent(getApplicationContext(), SubActivity.class);
                            startActivity(intent);
                        }
                    finish();
                    }
                }, 300);

                return true;
            }//onNavigationItemSelected()
        });//setOnNavigationItemSelectedListener()
    }//onCreate()
}