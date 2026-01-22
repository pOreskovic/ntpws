<?php 
session_start();
require_once "db.php";

$sql = "
    SELECT component_type, component_id, SUM(quantity) AS total_sold
    FROM order_items
    GROUP BY component_type, component_id
    ORDER BY total_sold DESC
    LIMIT 4
";

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styleIndex.css">
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
            <a style="color: #1fbcff; border-bottom: 3px solid #1fbcff;" href="index.php">HOME</a>
            <a href="components.php">COMPONENTS</a>
            <a href="pcbuilds.php">PC BUILDS</a>
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
        <section class="hero">
            <div class="heroText">
                <h1>Build Your <br><span>Ultimate Gaming PC</span></h1>
                <p>The best graphics cards, processors and components for top performance.</p>
                <div class="heroButtons">
                    <a href="components.php" class="primaryBtn">Shop Now</a>
                    <a href="pcbuilds.php" class="secondaryBtn">View PC Builds</a>
                </div>
            </div>
            <div class="heroImage">
                <img src="images/pc.image.index.png">
            </div>

        </section>
        <section class="categories">
            <h2>Core Components</h2>
            <div class="categoryGrid">
                <a class="categoryCard" href="componentCategoryDisplay.php?category=gpu">
                    <img src="images/gpuCategory.png">
                    <h4>Graphics Cards</h4>
                </a>
                <a class="categoryCard" href="componentCategoryDisplay.php?category=cpu">
                    <img src="images/cpuCategory.png">
                    <h4>Processors</h4>
                </a>
                <a class="categoryCard" href="componentCategoryDisplay.php?category=motherboards">
                    <img src="images/mboCategory.png">
                    <h4>Motherboards</h4>
                </a>
                <a class="categoryCard" href="componentCategoryDisplay.php?category=ram">
                    <img src="images/ramCategory.png">
                    <h4>RAM</h4>
                </a>
                
            </div>
        </section>

        <img src="images/betweenSections.jpg">

        <section class="popular">
            <h2>Best Sellers</h2>
            <div class="productGrid">
                <?php
                    while ($row = $result->fetch_assoc()) {

                        $type = $row['component_type'];
                        $id   = $row['component_id'];

                        $stmt = $conn->prepare("SELECT id, name, price, image FROM $type WHERE id=?");
                        $stmt->bind_param("i", $id);
                        $stmt->execute();
                        $product = $stmt->get_result()->fetch_assoc();

                        if ($product) {
                            $typeAppndx = "'" . $type . "'";
                            echo '<div class="productCard">
                            <img src="images/' . $product["image"] . '">
                            <h3>' . $product["name"] . '</h3>
                            <p class="price" data-eur="' . $product["price"] .'">' . $product["price"] .'EUR</p>
                            
                            <button onclick="openDetails(' . $typeAppndx . ',' . $id .')">Details</button>
                            </div>';
                        }
                    }
                ?>
            </div>
        </section>

        <img src="images/letter-g.png" class="betweenSections">

        <section class="whyUs">
            <h2>Why Shop at Gaming Gear?</h2>

            <div class="whyGrid">
                <img src="images/delivery.png">
                <img src="images/reliability.png">
                <img src="images/expertSupport.png">
                <img src="images/bestprices.png">
            </div>
        </section>
    </main>
    <footer>© 2026 Gaming Gear. All rights reserved.</footer>
</body>
</html>

<script>
    function openDetails(type, id){
        window.location.href = 'detailedComponent.php?type=' + type + '&id=' + id;
    }
</script>