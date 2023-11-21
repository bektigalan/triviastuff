### Remove Executable Image Files
```bash
find /var/www/html -type f \( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.JPG' -o -name '*.PNG' -o -name '*.JPEG' \) -exec chmod -x {} \;
```