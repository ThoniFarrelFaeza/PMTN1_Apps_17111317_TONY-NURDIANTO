<?php
$db = mysqli_connect("localhost", "root", "", "pmtn1");
if (!$db) {
    echo "Database connect error" . mysqli_error();
}

$id = $_POST['id'];
$title = $_POST['title'];
$body = $_POST['body'];
$category_name = $_POST['category_name'];

$create_date = date('d/m/Y');
$author = $_POST['author'];

$images = $_FILES['images']['name'];
$imagePath = "Uploads/" . $images;

$tmp_name = $_FILES['images']['tmp_name'];
move_uploaded_file($tmp_name, $imagePath);

$db->query("UPDATE post_table SET images = '" . $images . "', author = '" . $author . "', post_date = '" . $create_date . "', title =  '" . $title . "', body = '" . $body . "', category_name = '" . $category_name . "' WHERE id = '" . $id . "' ");
