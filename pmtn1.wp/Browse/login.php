<?php
$db = mysqli_connect("localhost", "root", "", "pmtn1");
if (!$db) {
    echo "Database connect error";
}


$users = $_POST['users'];
$passw = $_POST['passw'];

$sql = "SELECT * FROM `login_register` WHERE users ='" . $users . "' AND passw ='" . $passw . "' ";
$query = mysqli_query($db, $sql);
$userdata = array();
$count = mysqli_num_rows($query);
if ($count == 1) {
        $sql = "SELECT * FROM `login_register` WHERE users ='" . $users . "' ";
        $query = mysqli_query($db, $sql);
        $data = mysqli_fetch_array($query);
        $userdata = $data;
    echo json_encode($userdata);
} else {
    
    echo json_encode("ERROR");
}
