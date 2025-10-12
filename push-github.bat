@echo off
echo 🚀 Pushing to GitHub...
echo.

echo 📋 Checking Git status...
git status
echo.

echo 📁 Adding all changes...
git add .
echo.

echo 💾 Committing changes...
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "timestamp=%YYYY%-%MM%-%DD% %HH%:%Min%:%Sec%"

git commit -m "Auto-commit: %timestamp%"
echo.

echo ⬆️ Pushing to GitHub...
git push origin develop
echo.

echo ✅ Successfully pushed to GitHub!
echo.
echo 📊 Final status:
git status --short
