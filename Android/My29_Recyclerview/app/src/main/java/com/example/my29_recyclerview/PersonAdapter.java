package com.example.my29_recyclerview;

// viewHolder () 메소드 정의

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class PersonAdapter extends RecyclerView.Adapter<PersonAdapter.ViewHolder>
                            implements OnPersonItemClickListener {

    private static final String TAG = "main:PersonAdapter";
    OnPersonItemClickListener listener;

    Context context;
    ArrayList<Person> items;

    // 생성자 메소드
    public PersonAdapter(Context context, ArrayList<Person> items) {
        this.context = context;
        this.items = items;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
    // 매개변수 : parent → MainActivity
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        // → 화면을 붙일 때 사용하는 inflater 찾기

        View itemView = inflater.inflate(R.layout.person_view, parent, false);
        // → 루트 없이 parent에 person_view를 붙임

        return new ViewHolder(itemView, this);
    }//onCreateViewHolder()

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, final int position) {
        Log.d(TAG, "onBindViewHolder: " + position);

        Person item = items.get(position);
        holder.setItem(item);

        /*
        holder.parentLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(context, position + "번째 항목이 클릭됨", Toast.LENGTH_SHORT).show();
            }
        });//parentLayout.setOnClickListener()
        */
        
        holder.imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(context, position + "번째 이미지 뷰가 클릭됨", Toast.LENGTH_SHORT).show();
            }
        });//imageView.setOnClickListener()
    }//onBindViewHolder()

    @Override
    public int getItemCount() {
        return items.size();
    }//getItemCount()

    // 데이터를 삽입해주는 메소드
    public void addItem(Person item) {
        items.add(item);
    }

    public Person getItem(int position) {
        return items.get(position);
    }//getItem()

    // 메인에서 클릭 리스너 불러 쓰기 위해서 정의하는 메소드
    public void setOnItemClickListener(OnPersonItemClickListener listener) {
        this.listener = listener;
    }//setOnItemClickListener()

    @Override
    public void onItemClick(ViewHolder holderm, View view, int position) {
        if (listener != null) {     // 메인에서 클릭 리스너를 실행했을 때
            listener.onItemClick(holderm, view, position);
        }
    }//onItemClick()

    public static  class ViewHolder extends RecyclerView.ViewHolder {
        LinearLayout parentLayout;
        TextView tvName, tvPhonenum;
        ImageView imageView;

        // 생성자
        public ViewHolder(@NonNull View itemView, final OnPersonItemClickListener listener) {
            super(itemView);

            // 요소 찾기
            parentLayout = itemView.findViewById(R.id.parentLayout);
            tvName = itemView.findViewById(R.id.name);
            tvPhonenum = itemView.findViewById(R.id.phonenum);
            imageView = itemView.findViewById(R.id.imageView);

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    int position = getAdapterPosition();

                    if (listener != null) {
                        listener.onItemClick(ViewHolder.this,
                                                     view, position);
                    }
                }//onClick()
            });//itemView.setOnClickListener()
        }//ViewHolder 생성자

        // DTO 데이터를 View에 보이도록 하는 메소드
        public  void setItem(Person item) {
            tvName.setText(item.getName());
            tvPhonenum.setText(item.getPhonenum());
            imageView.setImageResource(item.getResId());
        }//setItem()
    }//class ViewHolder

}//class PersonAdapter
