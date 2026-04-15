package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Locale;

public class ZakahCalculatorActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_zakah_calculator);

        EditText wealthInput = findViewById(R.id.wealthInput);
        EditText percentInput = findViewById(R.id.percentInput);
        Button calculateButton = findViewById(R.id.zakahCalculateButton);
        TextView output = findViewById(R.id.zakahOutput);

        calculateButton.setOnClickListener(v -> {
            Double wealth = parseDouble(wealthInput.getText().toString());
            Double percent = parseDouble(percentInput.getText().toString());
            if (wealth == null || percent == null || percent < 0) {
                Toast.makeText(this, "Enter valid wealth and percent", Toast.LENGTH_SHORT).show();
                return;
            }

            double zakah = wealth * (percent / 100.0);
            output.setText(String.format(Locale.US, "Zakah due: %.2f", zakah));
        });
    }

    private Double parseDouble(String value) {
        try {
            return Double.parseDouble(value.trim());
        } catch (Exception ignored) {
            return null;
        }
    }
}
