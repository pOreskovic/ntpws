<?php 
session_start()
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
            <a href="index.php">HOME</a>
            <a style="color: #1fbcff; border-bottom: 3px solid #1fbcff;" href="components.php">COMPONENTS</a>
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
        <nav class="extraNavBar">
            <img src="images/home.png" onclick="homeButtonClick()">
            <img src="images/next.png" class="nextIcon">
            <a href="components.php">Components</a>
        </nav>
        <h2>All Components</h2>
        <hr/>
        <section class="categories">
            <div class="categoryGrid">
                <a class="categoryCard" onclick="openCategory('gpu')">
                    <img src="images/gpuCategory.png">
                    <h4>Graphics Cards</h4>
                </a>
                <a class="categoryCard" onclick="openCategory('cpu')">
                    <img src="images/cpuCategory.png">
                    <h4>Processors</h4>
                </a>
                <a class="categoryCard" onclick="openCategory('motherboards')">
                    <img src="images/mboCategory.png">
                    <h4>Motherboards</h4>
                </a>
                <a class="categoryCard" onclick="openCategory('ram')">
                    <img src="images/ramCategory.png">
                    <h4>RAM</h4>
                </a>
                <a class="categoryCard" onclick="openCategory('storage')">
                    <img src="images/storageCategory.png">
                    <h4>Storage</h4>
                </a>
                <a class="categoryCard" onclick="openCategory('psu')">
                    <img src="images/psuCategory.png">
                    <h4>Power Supplies</h4>
                </a>
                <a class="categoryCard" onclick="openCategory('cases')">
                    <img src="images/casesCategory.png">
                    <h4>Cases</h4>
                </a>
                <a class="categoryCard" onclick="openCategory('cooling')">
                    <img src="images/coolingCategory.png">
                    <h4>Cooling</h4>
                </a>
                
            </div>
        </section>
    </main>
    <footer>© 2026 Gaming Gear. All rights reserved.</footer>
</body>
</html>

<script>
    let openCategory = function(category){
        window.location.href = `componentCategoryDisplay.php?category=${category}`;
    }

    function homeButtonClick(){
        window.location.href = `index.php`;
    }
</script>