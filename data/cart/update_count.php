<?php
/**
* 修改购物车条目中的购买数量
*/
header('Content-Type: application/json;charset=UTF-8');
require_once('../init.php');

@$sid = $_REQUEST['sid'] or die('{"code":401,"msg":"sid required"}');
@$count = $_REQUEST['count'] or die('{"code":402,"msg":"count required"}');

$sql = "UPDATE mls_shopping_cart SET count=$count WHERE sid=$sid";
$result = mysqli_query($conn, $sql);
if($result){
  echo '{"code":200, "msg":"update succ"}';
}else {
  echo '{"code":500, "msg":"update err"}';
}
