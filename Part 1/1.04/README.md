```bash
(base) tomas@tomas-ubuntu:~$ docker run -it -d ubuntu
de6e0e59e739eb3d7af4d23d17e5eff5855b35862612cdf5f225571de4b616c0

(base) tomas@tomas-ubuntu:~$ docker exec -it de bash
root@de6e0e59e739:/# apt update  
[...]
root@de6e0e59e739:/# apt upgrade  
[...]
root@de6e0e59e739:/# apt install curl
[...]
root@de6e0e59e739:/# exit
exit

(base) tomas@tomas-ubuntu:~$ docker exec -it de sh -c 'echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;'
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="https://www.helsinki.fi/">here</a>.</p>
</body></html>
```