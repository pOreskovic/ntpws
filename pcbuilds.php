<?php 
    session_start();
    require_once "db.php";

    $stmt = $conn->prepare("SELECT * FROM pc");
    $stmt->execute();
    $result = $stmt->get_result();
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styleComponentCategoryDisplay.css">
    <title>GG - Gaming Gear</title>
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
            <a style="color: #1fbcff; border-bottom: 3px solid #1fbcff;" href="pcbuilds.php">PC BUILDS</a>
            <a href="contact.php">CONTACT</a>
            <div class="icons">
            <form class="currency">
                    <label><input type="radio" name="currency"  id="eurRadio" value="EUR" checked>EUR</label>
                    <label><input type="radio" name="currency" id="usdRadio" value="USD">USD</label>
                </form>
                <a href="cart.php"><img src="images/shopping-cart.png"></a>
                <a href="login.php"><img src="images/user.png" ></a>
            </div>
            
        </nav>
    </header>
    <main>
    <h1 class="pcBuildsH1">PC Builds</h1>
        <?php 
            while ($row = $result->fetch_assoc()) {
                echo '<div class="componentCard">
                    <img src="images/' . $row["image"] .'">
                    <h3>' . $row["name"] . '</h3>
                    <p class="price" data-eur="' . $row["price"] . '">Price: ' . $row["price"] . ' EUR</p>
                    <div class="actionButtons">
                    <button onclick="itemDetails(' . $row["id"] .')">Details</button>
                    <button onclick="addToCart(' . $row["id"] . ',"pc")"><img src="images/shopping-cart.png">Add to Cart</button>
                    </div>
                </div>';
            }
        ?>
    </main>
    <footer>© 2026 Gaming Gear. All rights reserved.</footer>
</body>
</html>

<script>
    function itemDetails(id){
        window.location.href = `detailedComponent.php?type=pc&id=${id}`;
    }

    function addToCart(id, type){
        fetch(`addToCart.php?id=${id}&type=pc`)
        .then(res => res.json())
        .then(data => {
            if(data.success){
                alert("Item Added to Cart!");
            }else{
                alert("Item not available!");
            }
        });
    }

</script>
