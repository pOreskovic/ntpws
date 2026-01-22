<?php
session_start();
require "db.php";

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$userId = $_SESSION['user_id'];
$fullName = $_POST['firstName'] . " " . $_POST['lastName'];
$address = $_POST['address'];
$city = $_POST['city'];
$zip = $_POST['postalCode'];
$country = $_POST['country'];
$payment = $_POST['paymentMethod'];

if(isset($_POST["saveAddress"])){
    $stmt = $conn->prepare("UPDATE users SET country=?, city=?, address=?, zip=? WHERE id=?");
    $stmt->bind_param("ssss", $country, $city, $address, $zip, $userId);
    $stmt->execute();
}


$stmt = $conn->prepare("SELECT id FROM carts WHERE user_id=?");
$stmt->bind_param("i", $userId);
$stmt->execute();
$cart = $stmt->get_result()->fetch_assoc();

$cartId = $cart['id'];

$stmt = $conn->prepare("SELECT * FROM cart_items WHERE cart_id=?");
$stmt->bind_param("i", $cartId);
$stmt->execute();
$items = $stmt->get_result();

$totalPrice = 0;
$cartData = [];

while ($item = $items->fetch_assoc()) {
    $type = $item['component_type'];
    $id = $item['component_id'];

    $stmt2 = $conn->prepare("SELECT name, price FROM $type WHERE id=?");
    $stmt2->bind_param("i", $id);
    $stmt2->execute();
    $product = $stmt2->get_result()->fetch_assoc();

    $totalPrice += $product['price'] * $item['quantity'];

    $cartData[] = [
        "type" => $type,
        "id" => $id,
        "name" => $product['name'],
        "price" => $product['price'],
        "qty" => $item['quantity']
    ];
}

$stmt = $conn->prepare("INSERT INTO orders (user_id, full_name, address, city, postal_code, country, payment_method, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("issssssd", $userId, $fullName, $address, $city, $zip, $country, $payment, $totalPrice);
$stmt->execute();
$orderId = $stmt->insert_id;

foreach ($cartData as $item) {
    $stmt = $conn->prepare("INSERT INTO order_items (order_id, component_type, component_id, name, price, quantity) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("isissi", $orderId, $item['type'], $item['id'], $item['name'], $item['price'], $item['qty']);
    $stmt->execute();
}

$stmt = $conn->prepare("DELETE FROM cart_items WHERE cart_id=?");
$stmt->bind_param("i", $cartId);
$stmt->execute();

header("Location: userOrders.php");
exit;
?>
