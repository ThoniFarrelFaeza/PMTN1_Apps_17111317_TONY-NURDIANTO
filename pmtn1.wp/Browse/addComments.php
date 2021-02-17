<?php
$db = mysqli_connect("localhost", "root", "", "pmtn1");
if (!$db) {
    echo "Database connect error" . mysqli_error();
}

$comment = $_POST['comment'];
$user_email = $_POST['user_email'];
$post_id = $_POST['post_id'];
$curDate = date('d/m/Y');

$db->query("INSERT INTO comments(comment,user_email,post_id,comments_date)VALUES('".$comment."', '".$user_email."', '".$post_id."', '".$curDate."')");
