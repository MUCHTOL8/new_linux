#ps_mem.py

> dv2: a python script showing more accurate process memory useage.

- Instructional video for downloading and running ps_mem.py

`https://www.youtube.com/watch?v=cFcmJKiftEo`

- Instruction forum for fixing the "/usr/bin/env: python: No such file or directory" error.

`https://stackoverflow.com/questions/3655306/ubuntu-usr-bin-env-python-no-such-file-or-directory`

#------------------------------ The Above Videos' Instructions Are Copied Below For Convenience -----------------------------

- Download the script

`wget http://www.pixelbeat.org/scripts/ps_mem.py`

- move the script to usr (which is in $PATH) so you can call it from anywhere.

`mv ps_mem.py /usr/local/sbin`

- change the permissions so you don't have to call python directly to run the script.

`sudo chmod 755 /usr/local/sbin/ps_mem.py`

- make sure python3 is installed.

`apt-get install python3`

- find the python3 binary location.

`whereis python3`

- using the information from the whereis command create a symlink from python3 to python1 

`sudo ln -s /usr/bin/python3 /usr/bin/python`


