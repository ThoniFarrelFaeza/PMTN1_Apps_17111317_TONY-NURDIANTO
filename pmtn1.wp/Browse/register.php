<?php
	$db = mysqli_connect("localhost","root","","pmtn1");
	if(!$db){
		echo "Database connect error".mysqli_error();
	}

    $users = $_POST['users'];
    $passw = $_POST['passw'];
    $tlp = $_POST['tlp'];
    $email = $_POST['email'];
    

    $sql = "SELECT * FROM `login_register` WHERE users ='".$users."' ";
    $query = mysqli_query($db,$sql);
    $userdata = array();

    $count = mysqli_num_rows($query);
    if($count == 1){
        echo json_encode("ERROR");
    }else{
        $insert = "INSERT INTO login_register (users,passw,tlp,email) VALUES ('".$users."','".$passw."','".$tlp."','".$email."')";
        $result = mysqli_query($db,$insert);
        if($result){
         $sql = "SELECT * FROM `login_register` WHERE users ='".$users."' ";
        $query = mysqli_query($db,$sql);
        $data = mysqli_fetch_array($query);
        $userdata = $data;
        }
            echo json_encode( $userdata);
    }
 