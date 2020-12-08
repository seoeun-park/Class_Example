package com.example.my15_touchevent;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ScrollView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    View view1, view2;
    TextView textView;
    ScrollView scrollView;
    GestureDetector detector;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        view1 = findViewById(R.id.view1);
        view2 = findViewById(R.id.view2);
        textView = findViewById(R.id.textView);
        scrollView = findViewById(R.id.scrollView);

        view1.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {
            // 매개변수 : view → 터치한 view / motionEvent → 눌렀는 지, 움직였는 지, 뗐는 지를 인식
                int action = motionEvent.getAction();
                float curX = motionEvent.getX();    // motionEvent가 일어난 위치의 X좌표
                float curY = motionEvent.getY();    // motionEvent가 일어난 위치의 X좌표

                if (action == motionEvent.ACTION_DOWN) {
                    printString("손가락 눌림 : " + curX + ", " + curY);
                } else if (action == motionEvent.ACTION_MOVE){
                    printString("손가락 움직임 : " + curX + ", " + curY);
                } else if (action == motionEvent.ACTION_UP){
                    printString("손가락 뗌 : " + curX + ", " + curY);
                }

                // ※ MotionEvent 클래스의 이벤트
                // 1. ACTION_DOWN : 화면을 터치했을 때 발생하는 이벤트
                // 2. ACTION_UP : 화면을 터치한 다음 뗐을 때 발생하는 이벤트
                // 3. ACTION_MOVE : 화면을 터치한 상태에서  움직였을 때 발생하는 이벤트

                // https://developer.android.com/reference/android/view/MotionEvent#ACTION_MOVE
                // → MotionEvent의 레퍼런스 주소
                return true;
            }
        });//view1.setOnTouchListener()

        view2.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {
                detector.onTouchEvent(motionEvent);


                return true;
            }
        });//view2.setOnTouchListener()

        detector = new GestureDetector(this, new GestureDetector.OnGestureListener() {
            //화면을 눌렀을 때
            @Override
            public boolean onDown(MotionEvent motionEvent) {
                printString("onDown() 호출됨");
                return true;
            }

            // 화면을 눌렀다 떼는 경우
            @Override
            public void onShowPress(MotionEvent motionEvent) {
                printString("onShowPress() 호출됨");
            }

            //화면을 한손가락으로 눌렀다 떼는 경우
            @Override
            public boolean onSingleTapUp(MotionEvent motionEvent) {
                printString("onSingleTapUp() 호출됨");
                return true;
            }

            //화면이 눌린 채 일정한 속도와 방향으로 움직였다 떼는 경우
            @Override
            public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent1, float distanceX, float distanceY) {
            // 매개변수 : distanceX → X축을 기준으로 이동된 거리 / distanceY → Y축을 기준으로 이동된 거리
                printString("onScroll() 호출됨 => " + distanceX + ", " + distanceY);
                return true;
            }

            // 화면을 손가락으로 오랫동안 눌렀을 경우
            @Override
            public void onLongPress(MotionEvent motionEvent) {
                printString("onLongPress() 호출됨");
            }

            // 화면이 눌린 채 가속도를 붙여 손가락을 움직였다 떼는 경우
            @Override
            public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent1, float v1, float v2) {
            // 매개변수 : v1 → 속도, 즉 X축을 따라 초당 픽셀로 측정됨 / v2 → Y축을 따라 초당 픽셀로 측정되는 속도
                printString("onFling() 호출됨 => " + v1 + ", " + v2);
                return true;
            }
        });//GestureDetector.OnGestureListener()
    }//onCreate()

    private void printString(String s) {
        textView.append(s + "\n");

        scrollView.fullScroll(View.FOCUS_DOWN);
    }//printString()

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {     //키보드의 BACK 버튼을 눌렀을 때 발생
            printString("시스템에서 [BACK]버튼을 눌렀습니다.");
            return true;
        } else if (keyCode == KeyEvent.KEYCODE_VOLUME_UP) {     //키보드의 Vol Up 버튼을 눌렀을 때 발생
            printString("시스템에서 [Vol Up]버튼을 눌렀습니다.");
            return true;
        } else if (keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {     //키보드의 Vol Down 버튼을 눌렀을 때 발생
            printString("시스템에서 [Vol Down]버튼을 눌렀습니다.");
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }//onKeyDown()
}//class