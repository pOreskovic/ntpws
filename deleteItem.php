<?php
    require "db.php";
    $cartID = $_GET["cartid"];
    $type = $_GET["type"];
    $id = $_GET["id"];
    $quantity = $_GET["quantity"];

    $stmt = $conn->prepare("DELETE FROM cart_items WHERE cart_id=? AND component_type=? AND component_id=?");
    $stmt->bind_param("isi", $cartID, $type, $id);
    $stmt->execute();

    $stmt = $conn->prepare("UPDATE $type SET stock=stock+? WHERE id=?");
    $stmt->bind_param("ii", $quantity, $id);
    $stmt->execute();

    header("Location: cart.php");

?>