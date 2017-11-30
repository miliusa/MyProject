<?php
/**
* 删除购物车条目
*/
header('Content-Type: application/json;charset=UTF-8');
require_once('../init.php');

@$sid = $_REQUEST['sid'] or die('{"code":401,"msg":"sid required"}');

$sql = "DELETE FROM mls_shopping_cart WHERE sid=$sid";
$result = mysqli_query($conn, $sql);
if($result){
  echo '{"code":200, "msg":"delete succ"}';
}else {
  echo '{"code":500, "msg":"delete err"}';
}
