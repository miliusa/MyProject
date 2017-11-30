<?php
/**
* 分页显示所有的商品
*/
require_once('../init.php');
//header('Content-Type: application/json;charset=UTF-8');

@$orderKw = $_REQUEST['orderKw'];
@$familyKw = $_REQUEST['familyKw'];
@$kw = $_REQUEST['kw'];
@$pno = $_REQUEST['pno'];

if(!$kw){
  $kw = '';
  if($familyKw){
	  $sql = "SELECT fid FROM mls_product_family WHERE fname LIKE '$familyKw'";
	  $result = mysqli_query($conn,$sql);
	  $fid = mysqli_fetch_row($result)[0];
	  $fSql = " family_id LIKE $fid AND ";
  }else{
	$fSql = '';
  }
}else{
  $fSql = '';
}

if(!$pno){
  $pno = 1;
}else {
  $pno = intval($pno);
}

//判断排序条件
if(!$orderKw || $orderKw == 'recommended'){
	$order = ' ORDER BY seq_recommended';
}else if($orderKw == 'topSale'){
	$order = ' ORDER BY seq_top_sale';
}else if($orderKw == 'newArrival'){
	$order = ' ORDER BY seq_new_arrival';
}else if($orderKw == 'priceDesc'){
	$order = ' ORDER BY price DESC';
}else if($orderKw == 'priceAsc'){
	$order = ' ORDER BY price';
}

$output = [
  'recordCount' => 0,     //满足条件的总记录数
  'pageSize' => 10,        //每页大小，即每页最多可以显示的记录数量
  'pageCount' => 0,       //总页数
  'pno' => $pno,          //当前数据所在页号
  'data' => null          //当前页中的数据
];

//获取总记录数
$sql = "SELECT COUNT(*) FROM mls_product WHERE ".$fSql." title LIKE '%$kw%'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_row($result);
$output['recordCount'] = intval($row[0]);

//计算总页数
$output['pageCount'] = ceil($output['recordCount']/$output['pageSize']);

//获取指定页中的数据
$start = ($output['pno']-1)*$output['pageSize'];
$count = $output['pageSize'];
$sql = "SELECT pid,title,price,sold_count,favorite FROM mls_product WHERE ".$fSql." title LIKE '%$kw%'".$order." LIMIT $start,$count";
$result = mysqli_query($conn,$sql);

if(!$result){       //SQL语句执行失败
	echo $sql;
  echo('{"code":500, "msg":"db execute err"}');
}else {
  $list = mysqli_fetch_all($result, MYSQLI_ASSOC);
  for($i=0; $i<count($list); $i++){
    $pid = $list[$i]['pid'];
    $sql = "SELECT md FROM mls_product_img WHERE product_id=$pid LIMIT 0,1";
    $result = mysqli_query($conn, $sql);
    $list[$i]['md'] = mysqli_fetch_row($result)[0];
  }
  $output['data'] = $list;
  echo json_encode($output);
}