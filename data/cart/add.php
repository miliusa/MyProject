<?php
/**
* 添加到购物车
*/
header('Access-Control-Allow-Credentials:true');
header('Content-Type: application/json;charset=UTF-8');
require_once('../init.php');

@$pid = $_REQUEST['pid'] or die('{"code":401,"msg":"pid required"}');
@$buyCount = $_REQUEST['buyCount'] or die('{"code":402,"msg":"buyCount required"}');

session_start();

if(!@$_SESSION['loginUid']){	
  $_SESSION['pageToJump'] = 'cart';
  $_SESSION['toBuyPid'] = $pid;
  $_SESSION['toBuyCount'] = $buyCount;
  die('{"code":300, "msg":"login required"}');
}else{
	$uid = $_SESSION['loginUid'];
}

$sql = "SELECT sid FROM mls_shopping_cart WHERE uid=$uid AND product_id=$pid";
$result = mysqli_query($conn, $sql);
if( mysqli_fetch_row($result) ){
  $sql = "UPDATE mls_shopping_cart SET count=count+$buyCount WHERE uid=$uid AND product_id=$pid";
}else {
  $sql = "INSERT INTO mls_shopping_cart VALUES(NULL, $uid, $pid, $buyCount, false)";
}
$result = mysqli_query($conn, $sql);
if($result){
  echo '{"code":200, "msg":"add succ"}';
}else {
  echo '{"code":500, "msg":"add err"}';
}
