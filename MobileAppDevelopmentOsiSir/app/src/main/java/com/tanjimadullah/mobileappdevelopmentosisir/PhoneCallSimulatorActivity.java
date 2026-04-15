package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class PhoneCallSimulatorActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_phone_call_simulator);

        EditText numberInput = findViewById(R.id.phoneInput);
        Button callButton = findViewById(R.id.phoneCallButton);
        TextView output = findViewById(R.id.phoneOutput);

        callButton.setOnClickListener(v -> {
            String number = numberInput.getText().toString().trim();
            if (number.isEmpty()) {
                Toast.makeText(this, "Enter a number first", Toast.LENGTH_SHORT).show();
                return;
            }
            output.setText("Dialing " + number + "... Connected! (simulation)");
        });
    }
}
