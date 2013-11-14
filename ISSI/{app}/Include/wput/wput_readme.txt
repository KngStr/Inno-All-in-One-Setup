DESCRIPTION
Wput is a free utility that is able to upload files to a ftp-server.

Wput is non-interactive and background-capable. It can upload files or
whole directories and is meant to be a robust client even for unstable
connections and will therefore retry to upload a file, if the connection
broke.

Wput supports resuming, so it automatically continues uploading from the
point where the previous upload stopped, meaning that you can kill Wput
anytime and it will (if the remote ftp-server supports this, being most
likely the case) finish the partial uploaded file.

Wput supports connections through proxies, allowing you to use it in an
environment that can access the internet only via a proxy or to provide
anonymity by hiding your ip-address to the server. For SOCKSv5-proxies
Wput supports also listening mode, allowing you to use port-mode ftp
through a proxy (useful if the remote ftp is behind a firewall or a
gateway).

Wput supports timestamping, so it will (in the ideal case and if time-
stamping is enabled) only upload files, that are newer than the remote-
file.

The upload-rate of Wput can be restricted, so that Wput won’t eat all
available bandwidth
 
OPTIONS
 -V
  
 --version
 
 Display the version of wput.
 
 -h
  
 --help
 
 Print a help screen, with a short description of wput’s command-line
options.
 
 -b
  
 --background
 
 Go to background immediately after startup. If no output file is given,
wput will redirect its output to "./wputlog"
 
 -o logfile
 
 --output-file=logfile
 
 Log all messages to logfile.
 
 -a logfile
 
 --append-output=logfile
 
 Append all logged messages to logfile.
 
 -q
  
 --quiet
 
 Turn off Wput’s output.
 
 -v
  
 --verbose
 
 Turn on verbose output. This gives some more information about what Wput
does. If you specify this flag twice, you get debug output.
 
 -nv
  
 --less-verbose
 
 Be less verbose. That means reducing Wput’s output to a minimun. Specifiing
this flag more often is equal to the --quiet flag. Some people also like
combining the -v and -nv flags, being quite senseless.
 
 -i file
 
 --input-file=file
 
 Reads URLs and filenames from file. If there are URLs on the command-line too,
these will be retrieved first, unless sorting is enabled. See also the URL-Input
-Handling section. If file is -, the URLs will be read from stdin. If you want
to pipe the contents of the file that shall be uploaded to stdin, this cannot be
done (yet). But you can use the --input-pipe flag and read the contents a) from
a named pipe -I "cat named.pipe; echo > /dev/null" or b) directly from the command,
that outputs the data. (See --input-pipe) Do not do things like 
find | wput ftp://host/ -i -! Wput would upload all files from the current directory
(since the first output of find will be ’.’) and afterwards each file again (since
find postes its name to Wput. And further problematic is that Wput will upload each
directory that is given by find and since find itself recurses all directories, the
files would be uploaded three times (or even more often for further subdirectories).
Use wput ftp://host/ to upload everything from the local directory. Or use 
find ! -type d | wput ftp://host/ -i - to tell find, not to output directories.
 
 -s
  
 --sort
 
 If sorting is enabled Wput first reads all URLs from any input-devices available
and will sort them before transmitting each file. The sorting order is: ip/hostname,
port, username, password, directory, filename. Sorting requires a bit more memory
since all data needs to be hold there.
 
 --basename=path
 
 This option causes Wput to snip path from all input-files when they are connected
to the URL. wput /usr/share/doc.tgz ftp://host/ would create ftp://host//usr/share/doc.tgz,
whereas specifing /usr/share/ as basename will result in ftp://host/doc.tgz being created.
 
 -I command
 
 --input-pipe=command
 
 If no file/directory can be "guessed" (see "Guessing Local File") from the URL, the
output of command is taken as file-input. command is invoked as follows:
 
 command ftp "username" "ip/hostname" port "remote_directory" "remote_filename"
 
   The hostname is only supplied if the ip cannot be resolved. If you do not want these
parameters to confuse the programm from which you read the contents, use something like
’-I "cat file; echo > /dev/null"’ so that these parameters are passed to echo and to
/dev/null afterwards. Since the progressbar is not capable of handling unknown filesizes,
the filesize is set to 1 GiB. Therefore the ETA shows a wrong value.
 
 -R
   
 --remove-source-files
 
 Unlinks/deletes files that have been successfully transmitted.
 
 --bind-address= ADDRESS
 
 When making client TCP/IP connections, bind() to ADDRESS on the local machine. ADDRESS
may be specified as a hostname or IP address. This option can be useful if your machine
is bound to multiple IPs.
 
 -t number
 
 --tries=number
 
 Set number of retries to number. Specify -1 for infinite retrying. The default is to
retry 3 times, with some exceptions on fatal errors.
 
 -nc
  
 --dont-continue
 
 If this flag is specified, resuming will be turned off, meaning that a remote file
being smaller than the local one will be overwritten. To skip this file, you have to
enable --skip-existing. See also USAGE.resumehandling
 
 -u
  
 --reupload
 
 If this flag is specified, a remote file having the same size as the local one is to
be uploaded. Skipping is default.
 
 --skip-larger
 
 If this flag is specified, a remote file being larger than the local one will be
skipped. Default is reuploading it.
 
 --skip-existing
 
 If this flag is specified, the upload of a file will be skipped if the remote file
already exists.
 
 -N
  
 --timestamping
 
 If timestamping is enabled, Wput will retrieve a directory list and parse it to
determine the remote file-date. If the local file is newer than the remote one (there
is a default allowed timevariance of 5 seconds, which can be adjusted in the wputrc-file)
it is uploaded, otherwise skipped. The local date is dermined by the mtime (time of last
modification), using the current time-zone. This should be equal to the output of ls -l.
Since you usually do not want to resume existing files, you should employ the --reupload
--dont-continue flags as well.
 
 -l RATE
 
 --limit-rate=RATE
 
 If you don’t want Wput to eat up all available bandwidth, specify this flag. RATE is a
numeric value. The units ’K’ (for KiB) and ’M’ (for MiB) are understood. The upload rate
is limited on average, meaning that if you limit the rate to 10K and Wput was just able
to send with 5K for the first seconds, it will send (if possible) afterwards more than
10K until the average rate of 10K is fulfilled.
 
 --no-directories
 
 If Wput is unable to CWD into a directory, it will try to create it. If this is not the
desired behaviour specify this flag to force Wput not to create any directories.
 
 -Y MODE
 
 --proxy=MODE
 
 MODE can be either http for http-based proxies (such as SQUID), socks for SOCKSv5 proxies
or off to disable the proxy.
 
 --proxy-user=NAME
 
 If the proxy-server requires authentication, use NAME as user-name. You need to specify
--proxy-pass too. These information can also be stored in the wputrc-file.
 
 --proxy-pass=PASS
 
 Specifies the password to use for the proxy.
 
 -p
  
 --port-mode
 
 Per default, Wput uses passive mode ftp, which works well for most configurations.
If passive mode fails, Wput automatically falls back to port mode. If you want Wput
to start using port mode ftp, specify this flag.
 
 -A
  
 --ascii
 
 Wput automatically determines which transfer-format to use, by looking at the file-extensions.
Certain files are recognized as ASCII. These are: txt, c, java, cpp, sh, f, f90, f77, f95, bas",
pro, csh, ksh, conf, htm, html, php, pl, cgi, inf, js, asp, bat, cfm, css, dhtml, diz, h, hpp,
ini, mak, nfo, shtml, shtm, tcl, pas Specifying this flag forces Wput to use ASCII mode file
transfers.
 
 -B
  
 --binary
 
 Specifiing this flag forces Wput to use BINARY mode file transfers.
 
 --force-tls
 
 If this flag is specified and Wput is linked with the OpenSSL-library, the flag enforces the
usage of TLS: If no TLS-connection can be established the process will cancel and not try to
go on with an unencrypted connection
 

Wput is written by Hagen Fritsch <hagen (at) itooktheredpill.dyndns.org>
http://wput.sourceforge.net/ 

files: wput.exe , libeay32.dll , ssleay32.dll
