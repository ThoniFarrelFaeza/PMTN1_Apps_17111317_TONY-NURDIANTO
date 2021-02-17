<?php
$db = mysqli_connect("localhost", "root", "", "pmtn1");
if (!$db) {
	echo "Database connect error" . mysqli_error();
}
$id = $_POST['id'];
$result = $db->query("SELECT * From post_table WHERE id = '" . $id . "' ");
$data = mysqli_fetch_array($result);
if ($data['images']) {
	unlink('Uploads/' . $data['images']);
}

$db->query("DELETE FROM post_table WHERE id = '" . $id . "' ");
