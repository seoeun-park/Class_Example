package com.example.my30_navigationdrawer;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.fragment.app.Fragment;

import android.os.Bundle;
import android.view.Gravity;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.navigation.NavigationView;
import com.google.android.material.snackbar.Snackbar;


public class MainActivity extends AppCompatActivity 
    implements NavigationView.OnNavigationItemSelectedListener {
    Toolbar toolbar;
    Fragment1 fragment1;
    Fragment2 fragment2;
    Fragment3 fragment3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        toolbar = findViewById(R.id.toolbar);

        setSupportActionBar(toolbar);
        // → toolbar를 ActionBar로 바꾸기 위해
        // → toolbar에 빨간줄 해결 :  import android.widget.Toolbar;를 지우고
        //   선언부의 Toolbar에 alt + enter를 누른 다음
        //   import androidx.appcompat.widget.Toolbar;를 import시켜야 함

        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar,
                R.string.navigation_drawer_open,
                R.string.navigation_drawer_close
                // → values 폴더의 strings.xml 파일의
                //   해당 name을 가지고 있는 string 태그 불러오기
        );
        drawer.addDrawerListener(toggle);
        toggle.syncState();
        // → 햄버거 바를 클릭했을 때 내비게이션 바를 보였다가
        //   내비게이션 바 바깥 부분을 클릭하면 사라지는 기능 추가

        fragment1 = new Fragment1();
        fragment2 = new Fragment2();
        fragment3 = new Fragment3();

        // frameLayout 초기화
        getSupportFragmentManager().beginTransaction()
                .replace(R.id.container, fragment1).commit();

        // drawer에 로그인 정보 표시하기
        NavigationView navigationView = findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
        
        String loginID = "양파새끼";

        View headerView = navigationView.getHeaderView(0);
        // → 햄버거를 클릭했을 때 나오는 내비게이션 바의 헤더부분

        ImageView imageView = headerView.findViewById(R.id.imageView);
        TextView tvloginID = headerView.findViewById(R.id.loginID);
        TextView loginStr = headerView.findViewById(R.id.loginStr);
        imageView.setImageResource(R.drawable.y);
        tvloginID.setText(loginID);
        loginStr.setText("반갑습니다 " + loginID + "님!");
        
        // 플로팅 바 클릭시 실행되는 메소드
        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "플로팅 바가 눌렸네요!(Snackbar)",
                              Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });//fab.setOnClickListener
        
        

    }//onCreate()
    
    //내비게이션 안의 아이템이 클릭했을 때 실행되는 메소드
    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
        // 선택된 id 가져오기
        int id = menuItem.getItemId();
        
        if (id == R.id.nav_home) {
            onFragmentSelected(0, null);
            Toast.makeText(this, "첫 번째 메뉴 선택됨", Toast.LENGTH_SHORT).show();
        } else if (id == R.id.nav_gallery) {
            onFragmentSelected(1, null);
            Toast.makeText(this, "두 번째 메뉴 선택됨", Toast.LENGTH_SHORT).show();
        }  else if (id == R.id.nav_slideshow) {
            onFragmentSelected(2, null);
            Toast.makeText(this, "세 번째 메뉴 선택됨", Toast.LENGTH_SHORT).show();
        } else if (id == R.id.nav_tools) {
            onFragmentSelected(3, null);
            Toast.makeText(this, "네 번째 메뉴 선택됨", Toast.LENGTH_SHORT).show();
        } else if (id == R.id.nav_share) {
            onFragmentSelected(4, null);
            Toast.makeText(this, "다섯 번째 메뉴 선택됨", Toast.LENGTH_SHORT).show();
        } else if (id == R.id.nav_send) {
            onFragmentSelected(5, null);
            Toast.makeText(this, "여섯 번째 메뉴 선택됨", Toast.LENGTH_SHORT).show();
        }

        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        // 화면 전환된 후, 내비게이션 메뉴 없애기
        
        return true;
    }
    
    // 프래그먼트가 선택되었을 때 화면전환을 실행하는 메소드
    public Fragment onFragmentSelected(int position, Bundle bundle) {
        Fragment curFragment = null;
        
        if(position == 0) {
            curFragment = fragment1;
            toolbar.setTitle("첫 번째 화면");
        } else if (position == 1) {
            curFragment = fragment2;
            toolbar.setTitle("두 번째 화면");
        } else if (position == 2) {
            curFragment = fragment3;
            toolbar.setTitle("세 번째 화면");
        } else if (position == 3) {
            curFragment = fragment1;
            toolbar.setTitle("네 번째 화면");
        } else if (position == 4) {
            curFragment = fragment2;
            toolbar.setTitle("다섯 번째 화면");
        } else if (position == 5) {
            curFragment = fragment3;
            toolbar.setTitle("여섯 번째 화면");
        }

        getSupportFragmentManager().beginTransaction()
                .replace(R.id.container, curFragment).commit();
        // → 화면 전환
        
        return curFragment;
    }//onFragmentSelected

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        if(drawer.isDrawerOpen(GravityCompat.START)) {
        // → drawer(내비게이션 메뉴바)가 열려있을 경우
            drawer.closeDrawer(GravityCompat.START);
            // drawer가 사라지게끔 한다.
        } else {
            super.onBackPressed();
            // back 버튼의 본래의 기능을 수행하게 끔 한다.
        }
    }//onBackPressed()
}//class

/*
클릭 리스너를 다는 방법 2번째

해당 클래스에 implements NavigationView.OnNavigationItemSelectedListener
> alt + enter하여 메소드 오버라이드
> 메소드를 활성화 시키기 위해 navigationView.setNavigationItemSelectedListener(this); 작성
*/