<?php
$conn = new mysqli("localhost", "root", "", "gg");

$type = $_GET['type'] ?? '';

$allowed = ['gpu','cpu','ram','psu','cases','storage','motherboards','cooling', 'pc'];

if (!in_array($type, $allowed)) exit;

$sql = "SELECT id, name, image, price FROM $type";
$result = $conn->query($sql);

$data = [];
while ($row = $result->fetch_assoc()) {
    $row['type'] = $type;
    $data[] = $row;
}

echo json_encode($data);

?>