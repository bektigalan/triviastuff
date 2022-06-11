# Trivia Stuff (Indeed)  
## Delete empty lines using Regexp
```
^(\r|\n\r?)
^[ \t]*$\r?\n
^\h*\R
```
## Delete HTML comments
```
<!--(.*?)-->
```
## Delete PHP comments
```
/\*(.|\n)*?\*/
```
## Delete all spaces expect inside of string
```
(""[^""\\]*(?:\\.[^""\\]*)*"")|\s+
```

## Sublime Text Best Plugins
- Package Control
- emmet
- color highlight
- AdvancedNewFile
- SidebarEnhancements

In case you do not know how to preview .html file in github
https://htmlpreview.github.io/?[url file]

## Self update composer in Ubuntu  
1. ```which composer``` //check where installed composer
2. ```php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"``` //download ```composer-setup.php``` file in current working directory
3. ```php composer-setup.php``` //create ```composer.phar``` in current working directory
4. ```sudo mv composer.phar``` //to replace file composer
5. ```sudo composer self-update``` //to update

## How to check ssl certificate using terminal
```
curl --insecure -vvI https://[IP] 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }'
```

## How to delete junk files from linux

```
find {{PATH}} -name "index.html.*{{PATTERN}}" -delete
```