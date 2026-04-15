package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Locale;

public class BmiCalculatorActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bmi_calculator);

        EditText weightInput = findViewById(R.id.bmiWeightInput);
        EditText heightInput = findViewById(R.id.bmiHeightInput);
        Button calculateButton = findViewById(R.id.bmiCalculateButton);
        TextView output = findViewById(R.id.bmiOutput);

        calculateButton.setOnClickListener(v -> {
            Double weight = parseDouble(weightInput.getText().toString());
            Double height = parseDouble(heightInput.getText().toString());

            if (weight == null || height == null || height <= 0) {
                Toast.makeText(this, "Enter valid weight and height", Toast.LENGTH_SHORT).show();
                return;
            }

            double bmi = weight / (height * height);
            output.setText(String.format(Locale.US, "BMI: %.2f (%s)", bmi, categoryFor(bmi)));
        });
    }

    private String categoryFor(double bmi) {
        if (bmi < 18.5) return "Underweight";
        if (bmi < 25) return "Normal";
        if (bmi < 30) return "Overweight";
        return "Obese";
    }

    private Double parseDouble(String value) {
        try {
            return Double.parseDouble(value.trim());
        } catch (Exception ignored) {
            return null;
        }
    }
}
