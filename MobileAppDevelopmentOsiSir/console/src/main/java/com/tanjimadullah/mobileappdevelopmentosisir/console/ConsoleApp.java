package com.tanjimadullah.mobileappdevelopmentosisir.console; // Define package for console module.

import java.util.ArrayList; // Import ArrayList implementation.
import java.util.List; // Import List interface.
import java.util.NoSuchElementException; // Import exception used when stdin has no more lines.
import java.util.Random; // Import random generator class.
import java.util.Scanner; // Import scanner for keyboard input.

public class ConsoleApp { // Define main console application class.
    private static final Scanner SCANNER = new Scanner(System.in); // Keep one scanner instance for all input.
    private static final List<String> TODO_ITEMS = new ArrayList<>(); // Store to-do tasks in memory.
    private static final Random RANDOM = new Random(); // Use one random object for quiz generation.

    public static void main(String[] args) { // Entry point of console program.
        System.out.println("Java Multi Tool Console App"); // Print app banner.
        while (true) { // Keep showing menu until user exits.
            printMenu(); // Display all tool options.
            int choice = readInt("Choose option: "); // Read selected menu item.
            switch (choice) { // Route to selected tool.
                case 1: // Temperature converter option.
                    temperatureConverter(); // Run tool method.
                    break; // Exit switch branch.
                case 2: // BMI calculator option.
                    bmiCalculator(); // Run tool method.
                    break; // Exit switch branch.
                case 3: // General calculator option.
                    generalCalculator(); // Run tool method.
                    break; // Exit switch branch.
                case 4: // Islamic inheritance option.
                    islamicInheritance(); // Run tool method.
                    break; // Exit switch branch.
                case 5: // Reverse string option.
                    reverseStringTool(); // Run tool method.
                    break; // Exit switch branch.
                case 6: // To-do manager option.
                    todoListManager(); // Run tool method.
                    break; // Exit switch branch.
                case 7: // Phone simulator option.
                    phoneCallSimulator(); // Run tool method.
                    break; // Exit switch branch.
                case 8: // Zakah calculator option.
                    zakahCalculator(); // Run tool method.
                    break; // Exit switch branch.
                case 9: // Email simulator option.
                    emailSenderSimulator(); // Run tool method.
                    break; // Exit switch branch.
                case 10: // Children quiz option.
                    childrenMathQuiz(); // Run tool method.
                    break; // Exit switch branch.
                case 0: // Exit option.
                    System.out.println("Goodbye!"); // Print goodbye text.
                    return; // End program.
                default: // Unknown input branch.
                    System.out.println("Invalid choice."); // Warn about invalid menu value.
            }
            System.out.println(); // Add empty line after each tool run.
        }
    }

    private static void printMenu() { // Print menu options.
        System.out.println("====================================="); // Top separator.
        System.out.println("1. Temperature Converter"); // Option 1 label.
        System.out.println("2. BMI Calculator"); // Option 2 label.
        System.out.println("3. General Calculator"); // Option 3 label.
        System.out.println("4. Islamic Inheritance (Simplified)"); // Option 4 label.
        System.out.println("5. Reverse String Tool"); // Option 5 label.
        System.out.println("6. To-Do List Manager"); // Option 6 label.
        System.out.println("7. Phone Call Simulator"); // Option 7 label.
        System.out.println("8. Zakah Calculator"); // Option 8 label.
        System.out.println("9. Email Sender Simulator"); // Option 9 label.
        System.out.println("10. Children Math Quiz"); // Option 10 label.
        System.out.println("0. Exit"); // Exit option label.
        System.out.println("====================================="); // Bottom separator.
    }

    private static void temperatureConverter() { // Tool 1: temperature conversion.
        double value = readDouble("Temperature value: "); // Read number value.
        String from = readString("From unit (C/F/K): ").toUpperCase(); // Read source unit.
        String to = readString("To unit (C/F/K): ").toUpperCase(); // Read target unit.

        double celsius = toCelsius(value, from); // Normalize to Celsius.
        double converted = fromCelsius(celsius, to); // Convert from Celsius to target.
        System.out.printf("Result: %.2f %s%n", converted, to); // Print formatted result.
    }

    private static void bmiCalculator() { // Tool 2: BMI computation.
        double weight = readDouble("Weight in kg: "); // Read body weight.
        double height = readDouble("Height in meters: "); // Read height.
        if (height <= 0) { // Validate height input.
            System.out.println("Height must be greater than 0."); // Show validation text.
            return; // Stop for invalid height.
        }
        double bmi = weight / (height * height); // Apply BMI formula.
        System.out.printf("BMI: %.2f (%s)%n", bmi, bmiCategory(bmi)); // Print BMI + category.
    }

    private static void generalCalculator() { // Tool 3: simple calculator.
        double a = readDouble("First number: "); // Read first operand.
        double b = readDouble("Second number: "); // Read second operand.
        String op = readString("Operator (+,-,*,/): "); // Read operator.

        switch (op) { // Perform selected arithmetic operation.
            case "+": // Addition.
                System.out.printf("Result: %.2f%n", a + b); // Print addition result.
                break; // Exit branch.
            case "-": // Subtraction.
                System.out.printf("Result: %.2f%n", a - b); // Print subtraction result.
                break; // Exit branch.
            case "*": // Multiplication.
                System.out.printf("Result: %.2f%n", a * b); // Print multiplication result.
                break; // Exit branch.
            case "/": // Division.
                if (b == 0) { // Prevent divide-by-zero.
                    System.out.println("Cannot divide by zero."); // Show error.
                } else { // Safe divide branch.
                    System.out.printf("Result: %.2f%n", a / b); // Print division result.
                }
                break; // Exit branch.
            default: // Unknown operator.
                System.out.println("Invalid operator."); // Show validation message.
        }
    }

    private static void islamicInheritance() { // Tool 4: simplified inheritance.
        double estate = readDouble("Estate value: "); // Read total estate.
        int husband = readInt("Husband (0 or 1): "); // Read husband count.
        int wives = readInt("Number of wives (0-4): "); // Read wives count.
        int sons = readInt("Number of sons: "); // Read sons count.
        int daughters = readInt("Number of daughters: "); // Read daughters count.

        if (estate <= 0 || husband < 0 || husband > 1 || wives < 0 || wives > 4 || sons < 0 || daughters < 0) { // Validate ranges.
            System.out.println("Invalid input."); // Show invalid input message.
            return; // Stop on invalid input.
        }
        if (husband == 1 && wives > 0) { // Validate spouse rule.
            System.out.println("Cannot have husband and wives together."); // Show conflict message.
            return; // Stop on invalid spouse combination.
        }

        boolean hasChildren = (sons + daughters) > 0; // Determine if there are children.
        double spouseShare = 0; // Initialize spouse share.
        if (husband == 1) { // Husband case.
            spouseShare = hasChildren ? estate * 0.25 : estate * 0.5; // Husband fraction rule.
        } else if (wives > 0) { // Wives case.
            spouseShare = hasChildren ? estate * 0.125 : estate * 0.25; // Wives total fraction rule.
        }

        double remaining = estate - spouseShare; // Compute remaining amount.
        int units = (sons * 2) + daughters; // Weighted child units (2:1 ratio).
        double sonEach = 0; // Initialize per-son share.
        double daughterEach = 0; // Initialize per-daughter share.
        if (units > 0) { // Ensure division is valid.
            double unitValue = remaining / units; // Compute value of one unit.
            sonEach = unitValue * 2; // Set son share.
            daughterEach = unitValue; // Set daughter share.
        }

        System.out.printf("Spouse total share: %.2f%n", spouseShare); // Print spouse total.
        if (wives > 0) { // Wife-specific details.
            System.out.printf("Each wife share: %.2f%n", spouseShare / wives); // Print each wife share.
        }
        System.out.printf("Each son share: %.2f%n", sonEach); // Print each son share.
        System.out.printf("Each daughter share: %.2f%n", daughterEach); // Print each daughter share.
        System.out.println("Note: simplified inheritance model."); // Print educational note.
    }

    private static void reverseStringTool() { // Tool 5: reverse input text.
        String input = readString("Enter text: "); // Read original text.
        System.out.println("Reversed: " + new StringBuilder(input).reverse()); // Print reversed text.
    }

    private static void todoListManager() { // Tool 6: in-memory to-do manager.
        while (true) { // Keep running until user chooses back.
            System.out.println("To-Do Manager: 1=Add, 2=List, 3=Clear, 0=Back"); // Print sub-menu.
            int cmd = readInt("Command: "); // Read sub-command.
            if (cmd == 1) { // Add task branch.
                String item = readString("Task: "); // Read task text.
                if (!item.trim().isEmpty()) { // Validate non-empty task.
                    TODO_ITEMS.add(item.trim()); // Store trimmed task.
                    System.out.println("Added."); // Confirm add.
                }
            } else if (cmd == 2) { // List tasks branch.
                if (TODO_ITEMS.isEmpty()) { // Check empty list.
                    System.out.println("No tasks."); // Print empty message.
                } else { // Non-empty list branch.
                    for (int i = 0; i < TODO_ITEMS.size(); i++) { // Loop through all tasks.
                        System.out.printf("%d. %s%n", i + 1, TODO_ITEMS.get(i)); // Print numbered task.
                    }
                }
            } else if (cmd == 3) { // Clear tasks branch.
                TODO_ITEMS.clear(); // Remove all tasks.
                System.out.println("All tasks cleared."); // Confirm clear.
            } else if (cmd == 0) { // Back command branch.
                return; // Exit to main menu.
            } else { // Unknown command branch.
                System.out.println("Invalid command."); // Show validation message.
            }
        }
    }

    private static void phoneCallSimulator() { // Tool 7: fake phone call flow.
        String number = readString("Phone number: "); // Read phone number.
        System.out.println("Dialing " + number + "... Connected! (simulation)"); // Print simulated call status.
    }

    private static void zakahCalculator() { // Tool 8: zakah calculator.
        double wealth = readDouble("Total wealth: "); // Read wealth amount.
        double nisab = readDouble("Nisab threshold: "); // Read nisab threshold.
        if (wealth < nisab) { // Check if wealth is below threshold.
            System.out.println("Zakah due: 0.00 (below nisab)"); // Print no-zakah result.
            return; // Stop when below threshold.
        }
        System.out.printf("Zakah due: %.2f%n", wealth * 0.025); // Print 2.5% zakah amount.
    }

    private static void emailSenderSimulator() { // Tool 9: fake email sender.
        String to = readString("To email: "); // Read recipient email.
        String subject = readString("Subject: "); // Read subject text.
        String body = readString("Body: "); // Read message body.
        System.out.println("Email sent! (simulation)"); // Print simulated send confirmation.
        System.out.println("To: " + to); // Print recipient.
        System.out.println("Subject: " + subject); // Print subject.
        System.out.println("Body length: " + body.length()); // Print body length summary.
    }

    private static void childrenMathQuiz() { // Tool 10: random child-friendly quiz.
        int a = RANDOM.nextInt(10) + 1; // Pick first number between 1 and 10.
        int b = RANDOM.nextInt(10) + 1; // Pick second number between 1 and 10.
        int operation = RANDOM.nextInt(3); // Pick operation index.
        String op; // Hold symbol to display.
        int answer; // Hold correct answer.

        if (operation == 0) { // Addition branch.
            op = "+"; // Set operator text.
            answer = a + b; // Calculate answer.
        } else if (operation == 1) { // Subtraction branch.
            op = "-"; // Set operator text.
            if (a < b) { // Keep subtraction non-negative.
                int tmp = a; // Save a temporarily.
                a = b; // Swap a with b.
                b = tmp; // Complete swap.
            }
            answer = a - b; // Calculate subtraction answer.
        } else { // Multiplication branch.
            op = "*"; // Set operator text.
            answer = a * b; // Calculate multiplication answer.
        }

        int userAnswer = readInt("Question: " + a + " " + op + " " + b + " = "); // Ask question and read answer.
        if (userAnswer == answer) { // Validate user answer.
            System.out.println("Correct! Great job!"); // Print success.
        } else { // Wrong answer branch.
            System.out.println("Not correct. Right answer: " + answer); // Print correction.
        }
    }

    private static String bmiCategory(double bmi) { // Convert BMI number to text category.
        if (bmi < 18.5) { // Lower range.
            return "Underweight"; // Return underweight label.
        } else if (bmi < 25) { // Normal range.
            return "Normal"; // Return normal label.
        } else if (bmi < 30) { // Overweight range.
            return "Overweight"; // Return overweight label.
        } else { // High range.
            return "Obese"; // Return obese label.
        }
    }

    private static double toCelsius(double value, String from) { // Convert source temperature to Celsius.
        if ("F".equals(from)) { // Fahrenheit branch.
            return (value - 32) * 5.0 / 9.0; // Fahrenheit to Celsius formula.
        } else if ("K".equals(from)) { // Kelvin branch.
            return value - 273.15; // Kelvin to Celsius formula.
        } else { // Celsius branch.
            return value; // Already Celsius.
        }
    }

    private static double fromCelsius(double value, String to) { // Convert Celsius to target unit.
        if ("F".equals(to)) { // Fahrenheit branch.
            return (value * 9.0 / 5.0) + 32; // Celsius to Fahrenheit formula.
        } else if ("K".equals(to)) { // Kelvin branch.
            return value + 273.15; // Celsius to Kelvin formula.
        } else { // Celsius branch.
            return value; // Keep same value.
        }
    }

    private static String readString(String prompt) { // Utility to read text input.
        System.out.print(prompt); // Show prompt without newline.
        try { // Try to read one full input line.
            return SCANNER.nextLine(); // Return one full typed line.
        } catch (NoSuchElementException ex) { // Handle non-interactive stdin safely.
            System.out.println(); // Move to a new line after the prompt.
            System.out.println("No interactive input detected. Please run from a terminal and type values."); // Explain what happened.
            System.out.println("Tip: run `.\\gradlew.bat :console:run --console=plain` in PowerShell."); // Give actionable instruction.
            System.exit(0); // Exit gracefully so Gradle does not mark run as failed.
            return ""; // Keep compiler happy; this line is unreachable.
        }
    }

    private static int readInt(String prompt) { // Utility to read validated integer.
        while (true) { // Keep asking until valid.
            try { // Try parsing user input.
                return Integer.parseInt(readString(prompt).trim()); // Parse and return integer.
            } catch (NumberFormatException ignored) { // Catch invalid integer format.
                System.out.println("Please enter a valid integer."); // Show retry message.
            }
        }
    }

    private static double readDouble(String prompt) { // Utility to read validated decimal number.
        while (true) { // Keep asking until valid.
            try { // Try parsing user input.
                return Double.parseDouble(readString(prompt).trim()); // Parse and return double.
            } catch (NumberFormatException ignored) { // Catch invalid number format.
                System.out.println("Please enter a valid number."); // Show retry message.
            }
        }
    }
}
