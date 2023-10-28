@echo off
FORFILES /P .\out\ /M %1.* /C "cmd /c (if not @ext==\"pdf\" if not @ext==\"log\" del /Q /F @path)"