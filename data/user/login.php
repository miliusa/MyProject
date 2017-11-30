<?php
/**
* 接收客户端提交的登录信息：name、pwd，执行登录验证；
* 返回表明登录成功或失败的JSON消息：
* 如：{"code":200, "msg":"check passed"}
*/
require_once('../init.php');
header('Access-Control-Allow-Credentials:true');
header('Content-Type: application/json;charset=UTF-8');
@$uname = $_REQUEST['uname'] or die('{"code":401,"msg":"uname required"}');
@$upwd = $_REQUEST['upwd'] or die('{"code":402,"msg":"upwd required"}');

$sql = "SELECT uid,uname FROM mls_user WHERE upwd='$upwd' AND (uname='$uname' OR user_phone='$uname' OR email='$uname')";
$result = mysqli_query($conn,$sql);

if(!$result){       //SQL语句执行失败
  echo('{"code":500, "msg":"db execute err"}');
}else {
  $row = mysqli_fetch_assoc($result);
  if(!$row){        //用户名或密码错误
    echo('{"code":201, "msg":"uname or upwd err"}');
  }else {           //登录成功
    session_start();
    $_SESSION['loginUname'] = $row['uname'];
    $_SESSION['loginUid'] = $row['uid'];
    $pageToJump = @$_SESSION['pageToJump'];
    if($pageToJump==='cart' && @$_SESSION['toBuyPid']){
      //完成购物车添加
      $sql = "SELECT sid FROM mls_shopping_cart WHERE uid=$_SESSION[loginUid] AND product_id=$_SESSION[toBuyPid]";
      $result = mysqli_query($conn, $sql);
      if( mysqli_fetch_row($result) ){
        $sql = "UPDATE mls_shopping_cart SET count=count+1 WHERE uid=$_SESSION[loginUid] AND product_id=$_SESSION[toBuyPid]";
      }else {
        $sql = "INSERT INTO mls_shopping_cart VALUES(NULL, $_SESSION[loginUid], $_SESSION[toBuyPid], $_SESSION[toBuyCount],false)";
      }
      $result = mysqli_query($conn, $sql);
      unset($_SESSION['toBuyLid']);
      unset($_SESSION['toBuyCount']);
      unset($_SESSION['pageToJump']);

      echo('{"code":200, "msg":"login succ", "pageToJump":"'.$pageToJump.'"}');
    }else if($pageToJump==='cart'){
      //完成购物车查看
      unset($_SESSION['pageToJump']);
      echo('{"code":200, "msg":"login succ", "pageToJump":"'.$pageToJump.'"}');
    }else {
      echo('{"code":200, "msg":"login succ"}');
    }
  }
}