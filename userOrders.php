<?php 
    session_start();
    require_once "db.php";
    
    if (!isset($_SESSION['user_id'])) {
        header("Location: login.php");
        exit;
    }
    
    $userId = $_SESSION['user_id'];
    
    $stmt = $conn->prepare("SELECT * FROM orders WHERE user_id=? ORDER BY created_at DESC");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $orders = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styleProfile.css">
    <link rel="stylesheet" href="styleUserOrders.css">
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
            <a>PC BUILDS</a>
            <a>CONTACT</a>
            <div class="icons">
                <form class="currency">
                    <label><input type="radio" name="currency"  id="eurRadio" checked>EUR</label>
                    <label><input type="radio" name="currency" id="usdRadio">USD</label>
                </form>
                <a href="cart.php"><img src="images/shopping-cart.png"></a>
                <a href="login.php"><img src="images/userBlue.png"></a>
            </div>
            
        </nav>
    </header>
    <main>
        <div class="sideNav">
            <a href="adminPanel.php" id="adminbutton" class="sideNavButton">Admin Panel</a>
            <a href="profile.php" class="sideNavButton">Personal Information</a>
            <a href="userOrders.php" class="selectedSideNavButton">Order Overview</a>
            <a href="deleteAccount.php" class="sideNavButton">Delete Account</a>
            <a href="logout.php" class="sideNavButton">Log Out</a>
        </div>
        <section class="ordersContainer">
            <h1>My Orders</h1>

            <?php while($order = $orders->fetch_assoc()): ?>
                <div class="orderCard">
                    <h2>Order #<?php echo $order['id']; ?></h2>
                    <p>Status: <?php echo $order['status'] ?></p>
                    <p>Total: <span class="price" data-eur="<?php echo $order['total_price'] ?>"><?php echo $order['total_price'] ?> EUR</span></p>
                    <p>Date: <?php echo $order['created_at'] ?></p>

                    <div class="orderItems">
                        <?php
                            $stmt = $conn->prepare("SELECT * FROM order_items WHERE order_id=?");
                            $stmt->bind_param("i", $order['id']);
                            $stmt->execute();
                            $items = $stmt->get_result();
                        ?>
                        <?php while($item = $items->fetch_assoc()): ?>
                            <p>
                                <?php echo $item['name'] ?> × <?php echo $item['quantity'] ?>  
                                (<span class="price" data-eur="<?php echo $item['price'] ?>"><?php echo $item['price'] ?> EUR</span>)
                            </p>
                        <?php endwhile; ?>
                    </div>
                </div>
            <?php endwhile; ?>
        </section>
    </main>
    <footer>© 2026 Gaming Gear. All rights reserved.</footer>
</body>
</html>

<script>
    const adminUser = <?php echo $_SESSION['admin']?>;
    if(adminUser){
        document.getElementById("adminbutton").style.display = "block";
    }else{
        document.getElementById("adminbutton").style.display = "none";
    }
</script>