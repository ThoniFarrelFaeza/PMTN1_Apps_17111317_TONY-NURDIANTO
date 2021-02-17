<?php
$db = mysqli_connect("localhost", "root", "", "pmtn1");
if (!$db) {
    echo "Database connect error" . mysqli_error();
}

$list = array();
$result = $db->query("SELECT * FROM comments WHERE isSeen = 0");
if ($result) {
    while($row = $result->fetch_assoc()){
        $list [] = $row;
    }
    echo json_encode($list);
}
