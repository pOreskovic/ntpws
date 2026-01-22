<?php
    require "db.php";
    $type = $_GET["type"];
    
    $stmt = $conn->prepare("DELETE FROM $type WHERE id = ?");
    $stmt->bind_param("s", $_GET['id']);
    $stmt->execute();
    header("Location: adminPanel.php");
?>