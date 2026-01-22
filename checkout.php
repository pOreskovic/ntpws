<?php
session_start();
require "db.php";

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$userId = $_SESSION['user_id'];
$stmt = $conn->prepare("SELECT * FROM users WHERE id=?");
$stmt->bind_param("i", $userId);
$stmt->execute();
$user = $stmt->get_result()->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout | Gaming Gear</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styleCheckout.css">
</head>
<body>
<script src="currencyExchange.js"></script>
<header>
    <nav>
        <div class="logo">
            <a><img src="images/letter-g.png"></a>
            <h2>GAMING GEAR</h2>
        </div>
        <a href="index.php">HOME</a>
        <a href="components.php">COMPONENTS</a>
        <a href="pcbuilds.php">PC BUILDS</a>
        <a href="contact.php">CONTACT</a>
        <div class="icons">
            <form class="currency">
                <label><input type="radio" name="currency"  id="eurRadio" value="EUR" checked>EUR</label>
                <label><input type="radio" name="currency" id="usdRadio" value="USD">USD</label>
            </form>
            <a href="cart.php"><img src="images/shopping-cart-blue.png"></a>
            <a href="login.php"><img src="images/user.png" ></a>
        </div>
    </nav>
</header>

<main>
    <section class="checkoutContainer">
        <h1>Checkout</h1>
        <form method="POST" action="placeOrder.php" class="checkoutForm">
            <div class="checkoutCard">
                <h2>Delivery Address</h2>
                <h5>First Name</h5>
                <input type="text" name="firstName" placeholder="Full Name" required value="<?= htmlspecialchars($user['firstName']) ?>">
                <h5>Last Name</h5>
                <input type="text" name="lastName" placeholder="Last Name" required value="<?= htmlspecialchars($user['lastName']) ?>">
                <h5>Address</h5>
                <input type="text" name="address" placeholder="Street Address" required value="<?= htmlspecialchars($user['address']) ?>">
                <h5>City</h5>
                <input type="text" name="city" placeholder="City" required value="<?= htmlspecialchars($user['city']) ?>">
                <h5>ZIP Code</h5>
                <input type="text" name="postalCode" placeholder="Postal Code" required value="<?= htmlspecialchars($user['zip']) ?>">
                <h5>Country</h5>
                <input type="text" name="country" placeholder="Country" required value="<?= htmlspecialchars($user['country']) ?>">
                <h5>Email</h5>
                <input type="email" required value="<?= htmlspecialchars($user['email']) ?>" >
                <label class="paymentOption">Save this address for future orders<input type="checkbox" name="saveAddress"></label>
            </div>
            <div class="checkoutCard">
                <h2>Payment Method</h2>
                <label class="paymentOption">
                    Credit / Debit Card
                    <input type="radio" name="paymentMethod" value="card" required>
                </label>

                <label class="paymentOption">
                    Cash on Delivery
                    <input type="radio" name="paymentMethod" value="cash">
                </label>

                <label class="paymentOption">
                    Bank Transfer
                    <input type="radio" name="paymentMethod" value="bank">
                </label>
            </div>
            <button type="submit" class="confirmBtn">Confirm Order</button>
        </form>
    </section>
</main>
<footer>
    © 2026 Gaming Gear. All rights reserved.
</footer>
</body>
</html>