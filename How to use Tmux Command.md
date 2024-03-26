# Create New Session
```
tmux new -s test123
```
or
```
tmux
```
# Join the session
```
tmux a -t tes123
```
# Exit from Tmux
Press from your keyboard 
```
CTRL+B > D
```
Or
```
CTRL+D
```

```
tmux ls
```
```
tmux a -t 0
```
```
CTRL+B 0 / CTRL+B 1 / CTRL+B 2 / CTRL+B 3
```
```
sar -r -f /var/log/sa/sa01 | less
sar -r -f /var/log/sa/sa02 | less
sar -r -f /var/log/sa/sa03 | less
```
```
sar -r -f /var/log/sa/sa01 | more
sar -r -f /var/log/sa/sa02 | more
sar -r -f /var/log/sa/sa03 | more
```
```
sar -r -f /var/log/sa/sa20
sar -u -f /var/log/sa/sa20
```

# Create new session
```
CTRL+B C
```

# Exit the session
```
CTRL+B D
```
Or
```
tmux detach
```
Or
```
Exit
```
Or
```
logout
```

# To move another window
```
CTRL+Up or Down or Left or Right Arrow
```
