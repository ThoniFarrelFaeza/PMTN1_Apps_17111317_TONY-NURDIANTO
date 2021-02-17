<?php
	$db = mysqli_connect("localhost","root","","pmtn1");
	if(!$db){
		echo "Database connect error".mysqli_error();
	}
    $id = $_POST['id'];
    $names = $_POST['names'];
    $curDate=date('d/m/Y h:i');

    $db->query("UPDATE category SET names = '".$names."',create_date = '".$curDate."' WHERE id = '".$id."' ");