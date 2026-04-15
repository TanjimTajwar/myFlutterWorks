package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Locale;

public class TemperatureConverterActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_temperature_converter);

        EditText inputCelsius = findViewById(R.id.inputCelsius);
        EditText inputFahrenheit = findViewById(R.id.inputFahrenheit);
        Button btnCToF = findViewById(R.id.btnCToF);
        Button btnFToC = findViewById(R.id.btnFToC);
        TextView output = findViewById(R.id.tempOutput);

        btnCToF.setOnClickListener(v -> {
            Double celsius = parseDouble(inputCelsius.getText().toString());
            if (celsius == null) {
                Toast.makeText(this, "Enter a valid Celsius value", Toast.LENGTH_SHORT).show();
                return;
            }
            double fahrenheit = (celsius * 9.0 / 5.0) + 32;
            output.setText(String.format(Locale.US, "%.2f C = %.2f F", celsius, fahrenheit));
        });

        btnFToC.setOnClickListener(v -> {
            Double fahrenheit = parseDouble(inputFahrenheit.getText().toString());
            if (fahrenheit == null) {
                Toast.makeText(this, "Enter a valid Fahrenheit value", Toast.LENGTH_SHORT).show();
                return;
            }
            double celsius = (fahrenheit - 32) * 5.0 / 9.0;
            output.setText(String.format(Locale.US, "%.2f F = %.2f C", fahrenheit, celsius));
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
