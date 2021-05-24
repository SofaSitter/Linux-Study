<?php

/**
 * @Author: jsy135135
 * @email:732677288@qq.com
 * @Date:   2019-06-13 13:07:30
 * @Last Modified by:   jsy135135
 * @Last Modified time: 2019-06-13 13:29:06
 */
class Link{
  public function __construct(){
    $this->master = new mysqli('192.168.17.100','tp5shop',"\$Abc3721",'tp5shop');
    $this->slave = new mysqli('192.168.17.105','tp5shop',"\$Abc3721",'tp5shop');
  }
}
$mysql = new mysqli('192.168.17.105','tp5shop','$Abc3721','tp5shop');
// $rs = $mysql->query("select * from tpshop_goods");
// while ($row = $rs->fetch_assoc()) {
//   var_dump($row);
// }
// $link = new Link();