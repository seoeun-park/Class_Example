package com.example.my21_optionmenu;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    ActionBar abar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        abar = getSupportActionBar();
        //abar.hide();

        abar.setLogo(R.drawable.back);
        abar.setDisplayOptions(ActionBar.DISPLAY_HOME_AS_UP);
        // 메뉴바 상단의 타이틀 대신에 setLogo에서 지정한 로고로 바꾼다.

        abar.setDisplayHomeAsUpEnabled(true);
        // 앞에서 지정한 로고를 클릭했을 때 이벤트가 발생하도록 설정


    }//onCreate()

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_option, menu);

        return true;
    }//onCreateOptionsMenu

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int curId = item.getItemId();

        switch (curId) {
            case R.id.menu_refresh :
                Toast.makeText(this, "새로고침 메뉴 눌림...", Toast.LENGTH_SHORT).show();
                break;
            case R.id.menu_search :
                Toast.makeText(this, "검색 메뉴 눌림...", Toast.LENGTH_SHORT).show();
                break;
            case R.id.menu_settings :
                Toast.makeText(this, "설정 메뉴 눌림...", Toast.LENGTH_SHORT).show();
                break;
            case android.R.id.home :
                // → android.R.id.home : 메뉴바 상단의 홈 아이디
                Toast.makeText(this, "홈 메뉴바 눌림...", Toast.LENGTH_SHORT).show();
                this.finish();      // 앱 종료
                break;
        }

        return true;
    } //onOptionsItemSelected()
}//class

/*
상단의 메뉴버튼 만들기

1. xml 파일 만들기 : res 마우스 오른쪽 > New > Android Resource Directory > menu 클릭
                    > menu 폴더 오른쪽 마우스 > New > Menu Resource File
2. xml 파일에서 item 태그로 메뉴에 들어갈 아이콘 만들기
3. java 파일에서 onCreateOptionsMenu 오버라이딩(menu xml파일 붙여넣는 기능)
4. java 파일에서 onOptionsItemSelected 오버라이딩(아이콘 클릭했을 때 이벤트 설정해주는 기능)

액션바 없애는 방법 2가지
1. onCreate 메소드에서 getSupportActionBar()를 찾고 hide() 메소드를 걸어준다
2. res 폴더 > values 폴더 > style.xml 파일에 parent="Theme.AppCompat.Light.DarkActionBar 속성의 값을
   parent="Theme.AppCompat.Light.NoActionBar로 바꿔준다.
 */