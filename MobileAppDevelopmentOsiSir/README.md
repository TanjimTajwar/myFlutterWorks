# Java Multi-Tool Project (Android + Console)

This project includes the following tools, implemented in Java:

1. Temperature Converter  
2. BMI Calculator  
3. General Calculator  
4. Islamic Inheritance (simplified educational model)  
5. Reverse String Tool  
6. To-Do List Manager  
7. Phone Call Simulator  
8. Zakah Calculator  
9. Email Sender Simulator  
10. Children Math Quiz

## Project Structure

- `app` - Android app module (run on emulator/phone)
- `console` - Java console app module (run in terminal/Cursor)

## Run in Android Studio

1. Open Android Studio.
2. Click **Open** and select this project folder (`MobileAppDevelopmentOsiSir`).
3. Wait for Gradle sync to complete.
4. Start an emulator or connect an Android device.
5. Select the `app` run configuration.
6. Click **Run**.

The Android app opens with all 10 tools in one scrollable screen.

## Run in Terminal (Console App)

From project root:

### Windows (PowerShell)

```powershell
.\gradlew.bat :console:run
```

### macOS/Linux

```bash
./gradlew :console:run
```

This runs the Java console menu where you can choose all 10 tools.

## Run in Cursor

1. Open this folder in Cursor.
2. Open Cursor terminal in the project root.
3. Run:

```powershell
.\gradlew.bat :console:run
```

If you want to run Android in Cursor:

1. Open the same project in Android Studio for emulator/device handling.
2. Or use terminal commands for build/install:

```powershell
.\gradlew.bat :app:assembleDebug
```

(Install/run on device is typically easiest through Android Studio.)

## Notes

- Islamic inheritance calculation is simplified for learning purposes (spouse + children distribution).
- Phone and email features are simulations (no real call/email is sent).
