## how to take back ownership from missing owner using windows
revoke ownership

    takeown /F "C:\path\to\folder" /R /D Y

grant to everyone

    icacls "C:\path\to\folder" /grant Everyone:F /T /C /Q
