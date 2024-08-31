## Tee

The tee command in Linux is a useful utility that reads from standard input (usually the output of another command) and writes to both standard output (the terminal) and one or more files simultaneously. 


```
ping 8.8.8.8 |tee this.file 
```

exp: this does ping and puts the outcome inside a file named this.file 


---

## At commnad 
this command is used to schedule commands or scripts to run at a specific time in the future. 

```
at [OPTION] TIME
```

### To schedule a job with at

---

1.type the at command followed by the time you want to execute the job.


```
at 14:30
```

2.Input the Command

```
./script.sh
```

3. Press Ctrl+D to end your input.

---

### To view the list of jobs you've scheduled with at, use:

```
atq
```


Removing a Scheduled Job

If you want to remove a scheduled job, you can do so using the job number (which you can get from atq):

```
at -r JOBId
```

