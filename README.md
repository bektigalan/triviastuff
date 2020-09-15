Delete empty lines using Regexp
```
^(\r|\n\r?)
^[ \t]*$\r?\n
^\h*\R
```
Delete HTML comments
```
<!--(.*?)-->
```