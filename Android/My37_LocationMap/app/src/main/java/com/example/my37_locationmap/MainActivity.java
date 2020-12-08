package com.example.my37_locationmap;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;

import java.util.List;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";

    SupportMapFragment mapFragment;
    GoogleMap map;
    Button btnLoc, btnKor2Loc;
    EditText editText;

    MarkerOptions myMarker;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        checkDangerousPermissions();

        editText = findViewById(R.id.editText);
        btnLoc = findViewById(R.id.button1);
        btnKor2Loc = findViewById(R.id.button2);

        mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(new OnMapReadyCallback() {
            @Override
            public void onMapReady(GoogleMap googleMap) {
                Log.d(TAG, "onMapReady: ");

                map = googleMap;
                map.setMyLocationEnabled(true);

            }
        });//mapFragment.getMapAsync()

        MapsInitializer.initialize(this);

        btnLoc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                requestMyLocation();
            }
        });//btnLoc.setOnClickListener()

        btnKor2Loc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(editText.getText().toString().length() > 0) {
                    Location location =
                            getLocationFromAddress(getApplicationContext(), editText.getText().toString());
                    showCurrentLocation(location);
                }
            }//onClick()
        });//btnKor2Loc.setOnClickListener()


    }//onCreate()

    private Location getLocationFromAddress(Context context, String address) {
        Geocoder geocoder = new Geocoder(context);
        List<Address> addresses;
        Location resLocation = new Location("");

        try {
            addresses = geocoder.getFromLocationName(address, 5);
            // → editText에서 작성한 주소를 받아 최대 5개의 결과를 반환

            if (addresses == null || addresses.size() == 0) {
                return null;
            }
            Address addressLoc = addresses.get(0);
            // → 일치할 확률이 제일 큰 0번째 결과를 변수(addressLoc)에 저장

            resLocation.setLatitude(addressLoc.getLatitude());
            resLocation.setLongitude(addressLoc.getLongitude());

        } catch (Exception e) {
            e.getMessage();
        }

        return resLocation;
    }//getLocationFromAddress()

    private void requestMyLocation() {
        LocationManager manager =
                (LocationManager) getSystemService(Context.LOCATION_SERVICE);

        try {
            long minTime = 10000;
            float minDistance = 0;

            // 1. NETWORK_PROVIDER : 내 위치 확인하기를 누르면 구글 본사가 나옴
            /*manager.requestLocationUpdates(
                    LocationManager.NETWORK_PROVIDER,
                    minTime, minDistance,
                    new LocationListener() {
                        @Override
                        public void onLocationChanged(@NonNull Location location) {
                            showCurrentLocation(location);
                        }//onLocationChanged()
                    }//LocationListener()
            );//manager.requestLocationUpdates()*/

            // 2. GPS_PROVIDER : 내 위치 확인하기를 누르면 실제 내 위치가 나옴
            manager.requestLocationUpdates(
                    LocationManager.GPS_PROVIDER,
                    minTime, minDistance,
                    new LocationListener() {
                        @Override
                        public void onLocationChanged(@NonNull Location location) {
                            showCurrentLocation(location);
                        }//onLocationChanged()
                    }//LocationListener()
            );//manager.requestLocationUpdates()

            Location lastLocation =
                    manager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
            if (lastLocation != null) {
                Double latitude = lastLocation.getLatitude();
                Double longitude = lastLocation.getLongitude();

                String msg = "Latitude : " + latitude
                        + "\nLongitude : " + longitude;

                Log.d(TAG, "showCurrentLocation: " + msg);
                Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
            }

        } catch (SecurityException e) {
            Log.d(TAG, "requestMyLocation: " + e.getMessage());
        }
    }//requestMyLocation()

    private void showCurrentLocation(Location location) {
        LatLng curPoint =
                new LatLng(location.getLatitude(), location.getLongitude());

        String msg = "Latitude : " + curPoint.latitude
                     + "\nLongitude : " + curPoint.longitude;

        Log.d(TAG, "showCurrentLocation: " + msg);
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();

        map.animateCamera(CameraUpdateFactory.newLatLngZoom(curPoint, 18));

        //마커 찍기
        Location markerLocation = new Location("");
        markerLocation.setLatitude(35.153817);
        markerLocation.setLongitude(126.8889);
        showMyLocationMarker(markerLocation);
    }//showCurrentLocation()

    private void showMyLocationMarker(Location location) {
        if (myMarker == null) {
            myMarker = new MarkerOptions();
            myMarker.position(
                    new LatLng(location.getLatitude(), location.getLongitude()));
            myMarker.title("◎ 내 위치\n");
            myMarker.snippet("여기가 어딘가?");
            myMarker.icon(BitmapDescriptorFactory.fromResource(R.drawable.mylocation));
            map.addMarker(myMarker);
        }
    }//showMyLocationMarker()

    //----------------------------------------------------------------
    // 위험 권한
    private void checkDangerousPermissions() {
        String[] permissions = {
                Manifest.permission.INTERNET,
                Manifest.permission.ACCESS_COARSE_LOCATION,
                Manifest.permission.ACCESS_FINE_LOCATION
        };

        int permissionCheck = PackageManager.PERMISSION_GRANTED;
        for (int i = 0; i < permissions.length; i++) {
            permissionCheck = ContextCompat.checkSelfPermission(this, permissions[i]);
            if (permissionCheck == PackageManager.PERMISSION_DENIED) {
                break;
            }
        }

        if (permissionCheck == PackageManager.PERMISSION_GRANTED) {
            Toast.makeText(this, "권한 있음", Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(this, "권한 없음", Toast.LENGTH_LONG).show();

            if (ActivityCompat.shouldShowRequestPermissionRationale(this, permissions[0])) {
                Toast.makeText(this, "권한 설명 필요함.", Toast.LENGTH_LONG).show();
            } else {
                ActivityCompat.requestPermissions(this, permissions, 1);
            }
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == 1) {
            for (int i = 0; i < permissions.length; i++) {
                if (grantResults[i] == PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this, permissions[i] + " 권한이 승인됨.", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(this, permissions[i] + " 권한이 승인되지 않음.", Toast.LENGTH_LONG).show();
                }
            }
        }
    }
}//class