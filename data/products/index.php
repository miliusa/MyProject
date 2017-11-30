<?php
/**
* 向首页提供必需的数据，包括轮播广告、今日新品、一周热销、美丽优选
* 返回数据形如：
  {
    carouselItems: [ ],
    newArrialItems: [ ],
    topSaleItems: [ ]
  }
*/
header('Content-Type: application/json;charset=UTF-8');

$output = [];

require_once('../init.php');

//1.首页轮播广告
$sql = "SELECT cid,imgUrl FROM mls_index_carousel";
$result = mysqli_query($conn, $sql);
$output['carouselItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

//2.今日新品
$sql = "SELECT pid,title,price,favorite FROM mls_product WHERE seq_new_arrival>0 ORDER BY seq_new_arrival LIMIT 20";
$result = mysqli_query($conn, $sql);
$output['newArrivalItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);
for($i=0;$i<count($output['newArrivalItems']);$i++){
	$pid = $output['newArrivalItems'][$i]['pid'];
	$sql = "SELECT md FROM mls_product_img WHERE product_id=$pid LIMIT 0,1";
	$result = mysqli_query($conn, $sql);
	$output['newArrivalItems'][$i]['md'] = mysqli_fetch_row($result)[0];
}

//3.一周热销
$sql = "SELECT pid,title,price,favorite FROM mls_product WHERE seq_top_sale>0 ORDER BY seq_top_sale LIMIT 20";
$result = mysqli_query($conn, $sql);
$output['topSaleItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);
for($i=0;$i<count($output['topSaleItems']);$i++){
	$pid = $output['topSaleItems'][$i]['pid'];
	$sql = "SELECT md FROM mls_product_img WHERE product_id=$pid LIMIT 0,1";
	$result = mysqli_query($conn, $sql);
	$output['topSaleItems'][$i]['md'] = mysqli_fetch_row($result)[0];
}

echo json_encode($output);

