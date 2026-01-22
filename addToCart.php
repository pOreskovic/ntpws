<?php
session_start();
require "db.php";

$id = (int)$_GET['id'];
$type = $_GET['type'];
$userId = $_SESSION['user_id'];

$stmt = $conn->prepare("SELECT id, stock FROM $type WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$stock = $result->fetch_assoc()['stock'];

if($stock >= 1){
    $newStock = $stock - 1;
    $stmt = $conn->prepare("UPDATE $type SET stock=? WHERE id=?");
    $stmt->bind_param("ii", $newStock, $id);
    $stmt->execute();

    $stmt = $conn->prepare("SELECT id FROM carts WHERE user_id=?");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows === 0) {
        $stmt = $conn->prepare("INSERT INTO carts (user_id) VALUES (?)");
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $cartId = $stmt->insert_id;
    } else {
        $cartId = $result->fetch_assoc()['id'];
    }
    
    $stmt = $conn->prepare("INSERT INTO cart_items (cart_id, component_type, component_id, quantity)
        VALUES (?, ?, ?, 1) ON DUPLICATE KEY UPDATE quantity = quantity + 1");
    $stmt->bind_param("isi", $cartId, $type, $id);
    $stmt->execute();
    
    echo json_encode([
        "success" => true
    ]);
 
}else{
    echo json_encode([
        "success" => false
    ]);
}

exit;

?>