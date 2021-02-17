<?php
	$db = mysqli_connect("localhost","root","","pmtn1");
	if(!$db){
		echo "Database connect error".mysqli_error();
	}

    $names = $_POST ['names'];
    $list = array();
	$result = $db->query("SELECT * From post_table WHERE category_name = '".$names."'");
	
	if($result){
		while($row = $result->fetch_assoc()){
			$list[] = $row;
		}
		echo json_encode($list);
	}
?>