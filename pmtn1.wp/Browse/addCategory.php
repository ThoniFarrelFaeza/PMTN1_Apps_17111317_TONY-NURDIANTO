<?php
	$db = mysqli_connect("localhost","root","","pmtn1");
	if(!$db){
		echo "Database connect error".mysqli_error();
	}
    $names = $_POST ['names'];
    $curDate=date('d/m/Y');

    $db->query("INSERT INTO category(names,create_date)VALUES('".$names."','".$curDate."')");