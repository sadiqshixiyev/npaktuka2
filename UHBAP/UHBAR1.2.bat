@echo off

"C:\silentInstaller\maxima-5.48.1-win64.exe" /S
"C:\silentInstaller\7z2501-x64.exe" /S
"C:\silentInstaller\DockerDesktopInstaller.exe" install --quiet --accept-license
"C:\silentInstaller\GitHubDesktopSetup-x64.exe" install --silent
"C:\silentInstaller\KNIME5.5.1Installer(64bit).exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
"C:\silentInstaller\pycharm-2025.2.1.1.exe" /S
"C:\silentInstaller\gimp-3.0.4-setup.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
"C:\silentInstaller\Zettlr-3.6.0-x64.exe" /S

:: Браузеры
"C:\silentInstaller\MicrosoftEdgeSetup.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
"C:\silentInstaller\Yandex.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /ALLUSERS /NOICONS /MERGETASKS=!runcode
"C:\silentInstaller\ChromeSetup.exe" /S
"C:\silentInstaller\FirefoxInstaller.exe" /S

"C:\silentInstaller\jazz.exe" /S
"C:\silentInstaller\TelemostSetup.exe" /quiet

"C:\silentInstaller\texstudio-4.8.8-win-qt6-signed.exe" /S
"C:\silentInstaller\Anaconda3-2025.06-0-Windows-x86_64.exe" /S
msiexec /i "C:\silentInstaller\qalculate-5.7.0b-x64.msi" /qn ALLUSERS=1 REBOOT=ReallySuppress
msiexec /i "C:\silentInstaller\Flameshot-13.1.0-win64.msi" /qn ALLUSERS=1 REBOOT=ReallySuppress
"C:\silentInstaller\SumatraPDF-3.5.2-64-install.exe" /S
msiexec /i "C:\silentInstaller\Far30b6446.x64.20250301.msi" /qn ALLUSERS=1 REBOOT=ReallySuppress

:: VSCode
"C:\silentInstaller\VSCodeUserSetup-x64-1.103.2.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
timeout /t 15 /nobreak >nul

:: Расширения VSCode
call :InstallExtension ms-python.python
call :InstallExtension ms-python.vscode-pylance
call :InstallExtension ms-python.black-formatter
call :InstallExtension ms-vscode.cpptools
call :InstallExtension ms-vscode.cpptools-extension-pack
call :InstallExtension bradgashler.htmltagwrap
call :InstallExtension formulahendry.auto-rename-tag
call :InstallExtension ecmel.vscode-html-css
call :InstallExtension xabikos.JavaScriptSnippets
call :InstallExtension ms-ceintl.vscode-language-pack-ru
call :InstallExtension formulahendry.code-runner
call :InstallExtension ms-vscode.vscode-settings-cycler

:: Языки программирования
"C:\silentInstaller\julia-1.11.6-win64.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
"C:\silentInstaller\python-3.13.7-amd64.exe" /quiet /norestart
"C:\silentInstaller\rustup-init.exe" -y --no-modify-path

:: WSL2
wsl --install -d Ubuntu-22.04 --quiet

:: Chocolatey программы
choco install googlechrome -y --force
choco install firefox -y --force
choco install microsoft-edge -y --force
choco install 7zip -y --force
choco install flameshot -y --force
choco install qalculate -y --force
choco install yandex-browser-stable -y --force

exit

:InstallExtension
code --install-extension %1
goto :EOF