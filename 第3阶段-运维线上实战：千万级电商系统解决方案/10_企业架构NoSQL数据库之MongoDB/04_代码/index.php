<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]

// 定义应用目录
define('APP_PATH', __DIR__ . '/../application/');
$data = array(
  // 用户访问的ip
  'ip' => $_SERVER['HTTP_X_REAL_IP'],
  // 访问地址  访问是什么功能
  'url' => $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
  // 用户访问的客户端信息
  'agent' => $_SERVER['HTTP_USER_AGENT'],
  // 访问的时间
  'time' => time()
);
// 连接管理数据库
$manager = new MongoDB\Driver\Manager('mongodb://root:root@192.168.17.109/admin');
// 实列化写入方法
$bulk = new MongoDB\Driver\BulkWrite;
$rs = $bulk->insert($data);
// 执行语句
$result = $manager->executeBulkWrite('tp5shop.logs', $bulk);
// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
