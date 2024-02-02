# Create New Session
```
tmux new -s test123
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
CTRL+B & 0 / CTRL+B & 1 / CTRL+B & 2 / CTRL+B & 3
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
CTRL+B & C New session

