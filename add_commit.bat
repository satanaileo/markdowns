set /p commit_msg=Please input commit message:
git status
git add -A
git commit -m "%commit_msg%"
git push origin master
pause