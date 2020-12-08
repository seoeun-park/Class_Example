package com.example.my28_gridview;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Point;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

public class SingerAdapter extends BaseAdapter {
    // BaseAdapter를 그냥 상속받을 경우에는 오류가 난다.
    // 이 같은 경우에는 메소드를 오버라이드시켜야한다.

    Context context;
    ArrayList<SingerDto> dtos;
    Point size;

    LayoutInflater inflater;
    AlertDialog dialog;

    public SingerAdapter(Context context, ArrayList<SingerDto> dtos, Point size) {
        this.context = context;
        this.dtos = dtos;
        this.size = size;

        inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    public void addDto(SingerDto dto) {
        dtos.add(dto);
    }

    public void delDto(int position) {
        dtos.remove(position);
        // → 해당 position에 있는 dto를 지움
    }

    public void removeAllDto() {
        dtos.clear();
        // → dto 전체를 지움
    }

    @Override
    public int getCount() {
        return dtos.size();
    }

    @Override
    public Object getItem(int position) {
        return dtos.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(final int position, View view, ViewGroup viewGroup) {
        SingerViewHolder viewHolder;

        if(view == null) {      // 화면에 view가 하나도 없을 때
            view = inflater.inflate(R.layout.singer_view, viewGroup, false);
            // → inflater를 통해 화면(view)에 singer_view라는 xml파일을 붙여 넣기

            viewHolder = new SingerViewHolder();
            viewHolder.tvName = view.findViewById(R.id.name);
            viewHolder.tvPhoneNum = view.findViewById(R.id.phonenum);
            viewHolder.imageView = view.findViewById(R.id.imageView);
            // → viewHolder를 생성한 후 요소 찾기

            view.setTag(viewHolder);
        } else {        // 화면에 view가 있을 때
            viewHolder = (SingerViewHolder) view.getTag();
        }

        final SingerDto dto = dtos.get(position);
        String name = dto.getName();
        String phonenum = dto.getPhonenum();
        int resId = dto.getResId();

        viewHolder.tvName.setText(name);
        viewHolder.tvPhoneNum.setText(phonenum);
        viewHolder.imageView.setImageResource(resId);
        // → 찾은 요소안에 데이터와 이미지 넣기

        // 이미지뷰를 클릭했을 때 실행되는 리스너
        viewHolder.imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(context,
                        "선택 : " + position +
                             ", 이름 : " + dtos.get(position).getName(),
                        Toast.LENGTH_SHORT).show();

                //popupImg(dtos.get(position).getResId());
                popupImgXml(dto);
            }
        });//viewHolder.imageView.setOnClickListener()

        return view;
    }

    //Inner Class : 따로 새 자바 파일을 만들지 않고 xml의 내용을 볼 수 있게끔 해주는 클래스
    public class SingerViewHolder{
        public ImageView imageView;
        public TextView tvName, tvPhoneNum;
    }//SingerViewHolder()

/*
    // 팝업창으로 이미지 띄우기
    private void popupImg(int resId) {
        ImageView imageView = new ImageView(context);
        imageView.setImageResource(resId);

        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setTitle("이미지 띄우기");
        builder.setView(imageView);
        builder.setNegativeButton("종료", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                if(dialog != null) {
                    dialog.dismiss();
                }
            }//onClick()
        });//builder.setNegativeButton()
        dialog = builder.create();
        dialog.show();
    }//popupImg()
*/
    public void popupImgXml(SingerDto dto) {
        // xml 붙이기
        LayoutInflater inflater = LayoutInflater.from(context);
        // → context에서 inflater 가져오기

        View view = inflater.inflate(R.layout.popupimg, null);
        ImageView imageView = view.findViewById(R.id.imageView);
        TextView tvName = view.findViewById(R.id.tvName);
        TextView tvPhoneNum = view.findViewById(R.id.tvPhoneNum);
        TextView tvAge = view.findViewById(R.id.tvAge);

        imageView.setImageResource(dto.getResId());
        tvName.setText(dto.getName());
        tvPhoneNum.setText(dto.getPhonenum());
        tvAge.setText("" + dto.getAge());

        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setTitle("DTO 띄우기")
                .setView(view)
                .setNegativeButton("종료", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        if(dialog != null) {
                            dialog.dismiss();
                        }
                    }//onClick()
                });//builder.setNegativeButton()
        dialog = builder.create();
        dialog.show();

        // 디바이스 사이즈를 받아 팝업 크기창을 조절
        int sizeX = size.x;
        int sizeY = size.y;

        WindowManager.LayoutParams params = dialog.getWindow().getAttributes();

        params.x = (int) Math.round(sizeX * 0.005);     // 시작 X 위치
        params.y = (int) Math.round(sizeY * 0.01);      // 시작 y 위치
        params.width = (int) Math.round(sizeX * 0.9);
        params.height = (int) Math.round(sizeY * 0.8);
        dialog.getWindow().setAttributes(params);

    }//popupImgXml()
}
