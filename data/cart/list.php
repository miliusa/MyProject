<?php
/**
* 获取当前登录用户的购物车内容
* $output['code'..,'data'=>[
*	store_id..,
*	sname..,
*	info=>[
*		sid,pid,count,title,price,sm
*	]
* ]]
*/
require_once('../init.php');
header('Access-Control-Allow-Credentials:true');
header('Content-Type: application/json;charset=UTF-8');

session_start();
if(! @$_SESSION['loginUid']){
  $_SESSION['pageToJump'] = 'cart';
  die('{"code":300, "msg":"login required"}');
}

//获取所有店铺id
$sql = "SELECT DISTINCT store_id FROM mls_shopping_cart s,mls_product p WHERE s.product_id=p.pid  AND uid=$_SESSION[loginUid]"; 
$result = mysqli_query($conn, $sql);
$list = mysqli_fetch_all($result,MYSQLI_ASSOC);
//获取对应store_id的sname和商品总记录数
foreach($list as $i=>$s){
	$sql = "SELECT sname FROM mls_store WHERE sid = $s[store_id]";
	$result = mysqli_query($conn, $sql);
	$list[$i]['sname'] = mysqli_fetch_row($result)[0];

	$sql = "SELECT sid,pid,count,title,price FROM mls_shopping_cart s,mls_product p WHERE s.product_id=p.pid AND p.store_id=$s[store_id] AND uid=$_SESSION[loginUid]";
	$result = mysqli_query($conn, $sql);
	$list[$i]['info'] = mysqli_fetch_all($result, MYSQLI_ASSOC);
}


//查询每个商品的第一幅小图片
foreach($list as $i=>$s){
	$p = $s['info'];
	foreach($p as $k=>$v){
		$sql = "SELECT sm FROM mls_product_img WHERE product_id=$v[pid] LIMIT 1";
		$result = mysqli_query($conn, $sql);
		$row = mysqli_fetch_row($result)[0];
		$list[$i]['info'][$k]['sm'] = $row;	
	}
}
$output = [
  'code'=>200,
  'data'=>$list
];
echo json_encode($output);