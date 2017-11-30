<?php
/**
* 接收客户端
*/
header('Content-Type: application/json;charset=UTF-8');
require_once('../init.php');

@$phone = $_REQUEST['phone'] or die('{"code":404,"msg":"phone required"}');

$sql = "SELECT user_phone FROM mls_user WHERE user_phone = '$phone'";
$result = mysqli_query($conn,$sql);

if(!$result){       //SQL语句执行失败
  echo('{"code":500, "msg":"db execute err"}');
}else {
  $row = mysqli_fetch_assoc($result);
  if(!$row){        //手机号没有注册过
	//随机生成用户名
	$round =  time().rand(1,9999); 
    $uname = "mls_".$round;
	$sql = "INSERT INTO mls_user(user_phone,uname,avatar) VALUES('$phone','$uname','img/avatar/default.jpg')";
	$result = mysqli_query($conn,$sql);

	if(!$result){
	  echo('{"code":500, "msg":"db execute err"}');
	}else {
	  $uid = mysqli_insert_id($conn);
	  echo('{"code":200, "msg":"register succ", "uid":'.$uid.'}');
	}

  }else {           //手机号已经被注册过    
	echo('{"code":201, "msg":"user_phone has used"}');   
  }
}

