<?php
/**
* 根据产品编号pid查询商品的所有信息
* 参数： pid
* 返回：{
*     "details":{ ..., "imgList":[{},...] }
*     "shop":{ "sid":.., "sname":.., "storeImg":..,..}
*  }
*/
require_once('../init.php');
header('Content-Type: application/json;charset=UTF-8');

@$pid = $_REQUEST['pid'];
if(!$pid){
  $pid = 1;
}

$output = [
  'details'=>[],
  'shop'=>[]
];
//读取商品的信息
$sql = "SELECT * FROM mls_product WHERE pid=$pid";
$result = mysqli_query($conn, $sql);
$output['details'] = mysqli_fetch_assoc($result);

//读取商品的图片列表
$sql = "SELECT * FROM mls_product_img WHERE product_id=$pid ORDER BY iid";
$result = mysqli_query($conn, $sql);
$output['details']['imgList'] = mysqli_fetch_all($result,MYSQLI_ASSOC);

//读取店铺信息
$sid = $output['details']['store_id'];
$sql = "SELECT * FROM mls_store WHERE sid=$sid";
$result = mysqli_query($conn, $sql);
$output['shop'] = mysqli_fetch_assoc($result);

echo json_encode($output);