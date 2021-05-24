<?php
$mysqli = new mysqli('127.0.0.1','root','123456');
$sql = "show slave status";
$rs = $mysqli->query($sql);
#var_dump($rs);
$data = $rs->fetch_assoc();
#var_dump($data);
if ($data['Slave_IO_Running']=='Yes' && $data['Slave_SQL_Running'] == 'Yes'){
  echo 'slave is ok'."\n";
}else{
  echo 'Last_IO_Error:'.$data['Last_IO_Error']."\n"; 
}
