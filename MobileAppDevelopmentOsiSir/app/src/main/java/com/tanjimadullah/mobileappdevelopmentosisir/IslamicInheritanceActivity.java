package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Locale;

public class IslamicInheritanceActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_islamic_inheritance);

        EditText estateInput = findViewById(R.id.estateInput);
        EditText husbandInput = findViewById(R.id.husbandInput);
        EditText wivesInput = findViewById(R.id.wivesInput);
        EditText sonsInput = findViewById(R.id.sonsInput);
        EditText daughtersInput = findViewById(R.id.daughtersInput);
        Button calculateButton = findViewById(R.id.inheritanceCalculateButton);
        TextView output = findViewById(R.id.inheritanceOutput);

        calculateButton.setOnClickListener(v -> {
            Double estate = parseDouble(estateInput.getText().toString());
            Integer husband = parseInt(husbandInput.getText().toString());
            Integer wives = parseInt(wivesInput.getText().toString());
            Integer sons = parseInt(sonsInput.getText().toString());
            Integer daughters = parseInt(daughtersInput.getText().toString());

            if (estate == null || estate <= 0 || husband == null || wives == null || sons == null || daughters == null) {
                Toast.makeText(this, "Enter valid values", Toast.LENGTH_SHORT).show();
                return;
            }
            if (husband < 0 || husband > 1 || wives < 0 || wives > 4 || sons < 0 || daughters < 0 || (husband == 1 && wives > 0)) {
                Toast.makeText(this, "Invalid family values", Toast.LENGTH_SHORT).show();
                return;
            }

            boolean hasChildren = sons + daughters > 0;
            double spouseShare = 0;
            if (husband == 1) {
                spouseShare = hasChildren ? estate * 0.25 : estate * 0.5;
            } else if (wives > 0) {
                spouseShare = hasChildren ? estate * 0.125 : estate * 0.25;
            }

            double remaining = estate - spouseShare;
            int units = (sons * 2) + daughters;
            double sonEach = 0;
            double daughterEach = 0;
            if (units > 0) {
                double unitValue = remaining / units;
                sonEach = unitValue * 2;
                daughterEach = unitValue;
            }

            String spouseLine = "No spouse share.";
            if (husband == 1) {
                spouseLine = String.format(Locale.US, "Husband: %.2f", spouseShare);
            } else if (wives > 0) {
                spouseLine = String.format(Locale.US, "Wives total: %.2f, each: %.2f", spouseShare, spouseShare / wives);
            }

            output.setText(String.format(
                    Locale.US,
                    "%s\nEach son: %.2f\nEach daughter: %.2f\n(educational simplified model)",
                    spouseLine, sonEach, daughterEach
            ));
        });
    }

    private Double parseDouble(String value) {
        try {
            return Double.parseDouble(value.trim());
        } catch (Exception ignored) {
            return null;
        }
    }

    private Integer parseInt(String value) {
        try {
            return Integer.parseInt(value.trim());
        } catch (Exception ignored) {
            return null;
        }
    }
}
