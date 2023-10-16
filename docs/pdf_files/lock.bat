@echo off

rem 引数に目的のフォルダを指定
SET targetDir=%1
SET targetExt=pdf 

FOR %%F IN (%targetDir%\*.%targetExt%) DO (
    qpdf --encrypt seiritz2024 seiritz2024 256 -- --replace-input %%F
    rem 逆にパスワードを解除するのは,
    rem qpdf --decrypt --password=seiritz2024 --replace-input (ファイル) 
)