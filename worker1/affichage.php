<?php
$file1='/var/www/html/worker1.txt';
$Data1="";

# worker data
if (file_exists($file1)) {
$fh = fopen($file1,'r');
while ($line = fgets($fh)) {
  $worker1 = $line;
}
fclose($fh);
}
# affichage
$File = "/var/www/html/index.html";
$Handle = fopen($File, 'w');
$Data1 = "worker 1 vaut ".$worker1."\n";
fwrite($Handle, $Data1);

fclose($Handle);
?>
