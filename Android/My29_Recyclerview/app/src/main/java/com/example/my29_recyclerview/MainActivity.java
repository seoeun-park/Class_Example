package com.example.my29_recyclerview;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    RecyclerView recyclerView;
    ArrayList<Person> items;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        items = new ArrayList<>();

        recyclerView = findViewById(R.id.recyclerView);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this,
                            RecyclerView.VERTICAL, false);
        // → RecyclerView.VERTICAL : 하위 요소(item)를 수직으로 정렬
        // → reverseLayout : 요소의 배치 순서를 위에서 아래로 정렬(false), 아래서 위로 정렬(true)

        recyclerView.setLayoutManager(layoutManager);

        final PersonAdapter adapter = new PersonAdapter(this, items);
        adapter.addItem(new Person("양파 새끼",
                                "010-1111-1111",
                                7, R.drawable.y));
        adapter.addItem(new Person("단비",
                "010-1111-2222",
                4, R.drawable.d));
        adapter.addItem(new Person("뚱이",
                "010-1111-3333",
                0, R.drawable.dd));
        adapter.addItem(new Person("아따맘마",
                "010-1111-4444",
                43, R.drawable.m));
        adapter.addItem(new Person("리사 심슨",
                "010-1111-5555",
                6, R.drawable.l));

        recyclerView.setAdapter(adapter);

        // 아이템을 클릭했을 때 실행되는 리스너
        adapter.setOnItemClickListener(new OnPersonItemClickListener() {
            @Override
            public void onItemClick(PersonAdapter.ViewHolder holderm,
                                    View view, int position) {
            // 매개변수 : holderm
                Person item = adapter.getItem(position);
                Toast.makeText(MainActivity.this,
                                "아이템 선택됨 " + item.getName(),
                                Toast.LENGTH_SHORT).show();
            }
        });//adapter.setOnItemClickListener()
    }//onCreate()
}//class

/*
Recycler View에서 클릭리스너를 만드는 방법
    (List View에서는 기본적으로 제공한다. 가급적이면 List View로 구현할 것)
interface 만들기 + onItemClick 메소드 선언
> adapter에서 만들어놓은 interface를 implement한다.
> 선언부에 OnPersonItemClickListener listener;처럼 선언한다.
> 인터페이스에서 선언한 onItemClick를 adapter에서 구현
> 생성자 메소드에서 클릭리스너를 정의
> onCreateViewHolder 메소드에서 리턴값(this)을 추가
> 메인에서 클릭 리스너를 쓸 수 있도록 setOnItemClickListener 메소드 정의
  - 선언해놓은 변수 listener를 초기화
> 메인 액티비티에서 adapter에서 정의한 클릭리스너를 구현
*/