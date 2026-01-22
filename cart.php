<?php
session_start();

if(!$_SESSION['logged_in']){
    echo "nisi ulogiran";
    header("Location: login.php");
    exit;
}else{
    require "db.php";
    $items = [];
    if (isset($_SESSION['user_id'])) {
        $stmt = $conn->prepare("
            SELECT * FROM cart_items ci
            JOIN carts c ON ci.cart_id = c.id
            WHERE c.user_id = ?
        ");
        $stmt->bind_param("i", $_SESSION['user_id']);
        $stmt->execute();
        $items = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styleCart.css">
    <title>Cart</title>
</head>
<script src="currencyExchange.js"></script>
<body>
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
<div class="cartContainer">
    <h1>Your Cart</h1>
    <?php
        $total = 0;

        if (isset($_SESSION['user_id'])) {
            foreach ($items as $item) {
                $type = $item['component_type'];
                $id = $item['component_id'];
                $cartID = $item['cart_id'];
                $typeApndx = "'" . $type . "'";
                $res = $conn->query("SELECT * FROM $type WHERE id=$id")->fetch_assoc();
                $subtotal = $res['price'] * $item['quantity'];
                $total += $subtotal;
                echo '
                <div class="cartItem">
                    <img src="images/' . $res['image'] . '">
                    <div class="nameDiv">
                    <h4>Product Name</h4>
                    <h3>' .  $res['name'] . '</h3>
                    </div>
                    <div class="quantityDiv">
                    <h4>Quantity</h4>
                    <p>' .  $item['quantity'] . ' x</p>
                    </div>
                    <div class="priceDiv">
                    <h4>Price</h4>
                    <p class="price" data-eur="'. $res['price'] . '">'. $res['price'] . ' EUR</p>
                    </div>
                    <div class="totalDiv">
                    <h4>Total Price</h4>
                    <h3 class="price" data-eur="' . $subtotal . '">' . $subtotal . ' EUR</h3>
                    </div>
                    <button onclick="removeFromCart(' . $id . ',' . $typeApndx . ',' . $cartID . ',' . $item["quantity"] . ')">Remove</button>
                </div>';
            }
        }
    ?>
    </div>
    <hr/>
    <h2>Total: <span class="price" data-eur="<?= $total ?>"> <?= $total ?> EUR</span></h2>
    <a href="checkout.php" class="checkoutBtn" id="checkoutButton">Checkout</a>
</main>
</body>
</html>

<script>
    function removeFromCart(id, type, cartID, quantity){
        location.href = "deleteItem.php?id=" + id + "&type=" + type + "&cartid=" + cartID + "&quantity=" + quantity;
    }

    document.getElementById("checkoutButton").addEventListener("click", function(event){
        if(document.querySelectorAll(".cartItem").length < 1){
            event.preventDefault();
            alert("You cannot proceed to checkout because you don't have any items in your cart.")
        }
    })


</script>