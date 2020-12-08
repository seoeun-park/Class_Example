package com.example.my28_gridview;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Point;
import android.os.Bundle;
import android.view.Display;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.GridView;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    Button btnAdd;
    GridView gridView;

    SingerAdapter adapter;
    ArrayList<SingerDto> dtos;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Point size = getDiviceSize();

        dtos = new ArrayList<>();
        btnAdd = findViewById(R.id.btnAdd);
        gridView = findViewById(R.id.gridView);
        adapter = new SingerAdapter(MainActivity.this, dtos, size);

        adapter.addDto(new SingerDto("양파새끼",
                                    "010-1111-1111",
                                    7, R.drawable.y));
        adapter.addDto(new SingerDto("아따맘마",
                                    "010-1111-2222",
                                    43, R.drawable.m));
        adapter.addDto(new SingerDto("아따파파",
                                    "010-1111-3333",
                                    45, R.drawable.f));
        adapter.addDto(new SingerDto("뚱이",
                                    "010-1111-4444",
                                    0, R.drawable.dd));
        adapter.addDto(new SingerDto("도라에몽",
                                    "010-1111-5555",
                                    0, R.drawable.d));
        gridView.setAdapter(adapter);
        gridView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
                SingerDto dto = (SingerDto) adapter.getItem(position);
                Toast.makeText(MainActivity.this,
                                "선택 : " + position +
                                     "\n이름 : " + dto.getName() +
                                     "\n전번 : " + dto.getPhonenum() +
                                     "\n나이 : " + dto.getAge() +
                                     "\n이름 : " + dto.getResId(),
                                Toast.LENGTH_SHORT).show();
            }
        });//listView.setOnItemClickListener()

        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String name = "리사 심슨";
                String phonenum = "010-1111-6666";
                int age = 6;
                int resId = R.drawable.l;

                SingerDto dto = new SingerDto(name, phonenum, age, resId);
                adapter.addDto(dto);

                adapter.notifyDataSetChanged();
                // → 화면에 보이도록 갱신
            }
        });//btnAdd.setOnClickListener()
    }//onCreate()

    // 어플을 띄울 기기의 해상도를 구하는 메소드
    private Point getDiviceSize() {
        Display display = getWindowManager().getDefaultDisplay();
        Point size = new Point();
        display.getRealSize(size);
        //getSize : 디바이스의 전체 크기
        //getRealSize : 디바이스의 화면 크기(전체 크기에서 하단 메뉴바, 햄버거 제외)

        int width = size.x;
        int height = size.y;

        return size;
    }//getDiviceSize()
}//class