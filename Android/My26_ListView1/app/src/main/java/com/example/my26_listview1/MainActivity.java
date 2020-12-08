package com.example.my26_listview1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Adapter;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    TextView textView;
    ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = findViewById(R.id.textView);
        listView = findViewById(R.id.listView);

        ArrayList<String> list = new ArrayList<>();

        final ArrayAdapter<String> adapter
                = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, list);
        // android.R.layout.simple_list_item_1 : 안드로이드에서 기본적으로 제공해주는 리스트 레이아웃

        listView.setAdapter(adapter);
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView,
                                    View view, int position, long id) {
                String selected_item = (String) adapterView.getItemAtPosition(position);

                textView.setText(selected_item);
            }
        });//listView.setOnItemClickListener()

        list.add("떡볶이");
        list.add("피자");
        list.add("치킨");
        list.add("보쌈");
        list.add("족발");
        list.add("파스타");
        list.add("짬뽕");
        list.add("짜장면");
        list.add("탕수육");
        list.add("삼겹살");
        list.add("냉면");
        list.add("쌀국수");
        list.add("돈까스");
        list.add("초밥");
        list.add("아구찜");
        list.add("감자탕");

    }//onCreate()
}//class