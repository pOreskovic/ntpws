<?php 
    session_start();
    require_once "db.php";
    
    $category = $_GET["type"];
    $id = $_GET["id"];

    $stmt = $conn->prepare("SELECT * FROM $category WHERE id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styleComponentCategoryDisplay.css">
    <link rel="stylesheet" href="detailedComponent.css">
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
            <a href="pcbuilds.php">PC BUILDS</a>
            <a href="contact.php">CONTACT</a>
            <div class="icons">
            <form class="currency">
                    <label><input type="radio" name="currency"  id="eurRadio" value="EUR" checked>EUR</label>
                    <label><input type="radio" name="currency" id="usdRadio" value="USD">USD</label>
                </form>
                <a href="cart.php"><img src="images/shopping-cart.png"></a>
                <a href="login.php"><img src="images/user.png"></a>
            </div>
            
        </nav>
    </header>
    <main>
        <nav class="extraNavBar">
            <img src="images/home.png" onclick="homeButtonClick()">
            <img src="images/next.png" class="nextIcon">
            <a href="components.php" id="componentsNavButton">Components</a>
            <img src="images/next.png" class="nextIcon" id="nextArrow2">
            <a href="componentCategoryDisplay.php?category=<?php echo $category;?>" id="currentCategoryLabel"></a>
            <h4 id="cartMessage">ITEM ADDED TO YOUR CART!</h4>
        </nav>
        <section class="productPreview">
            <h1><?php echo $row['name']; ?></h1>
            <img src="images/<?php echo $row['image']?>" alt="Product Image">
            <div class="productPriceCard">
                <h2>Key Specifications</h2>
                <p>Brand: <?php echo $row['brand']; ?></p>
                <p class="specification"><?php if(isset($row["dimensions_mm"])) echo "Dimensions in mm: " . $row["dimensions_mm"];?></p>
                <p class="specification"><?php if(isset($row["capacity_gb"])) echo "Capacity/Memory: " . $row["capacity_gb"] . "GB";?></p>
                <p class="specification"><?php if(isset($row["interface"])) echo "Interface: " . $row["interface"];?></p>
                <p class="specification"><?php if(isset($row["power_w"])) echo "Power: " . $row["power_w"] . "W";?></p>
                <p class="specification"><?php if(isset($row["efficiency"])) echo "Efficiency: " . $row["efficiency"];?></p>
                <p class="specification"><?php if(isset($row["modular"])) echo "Modular: " . $row["modular"];?></p>
                <p class="specification"><?php if(isset($row["cores"])) echo "Cores: " . $row["cores"];?></p>
                <p class="specification"><?php if(isset($row["threads"])) echo "Threads: " . $row["threads"];?></p>
                <p class="specification"><?php if(isset($row["speed_mhz"])) echo "Speed: " . $row["speed_mhz"] . "MHz";?></p>
                <p class="specification"><?php if(isset($row["type"])) echo "Type: " . $row["type"];?></p>
                <p class="specification"><?php if(isset($row["memory_gb"])) echo "Memory: " . $row["memory_gb"] . " GB";?></p>
                <p class="specification"><?php if(isset($row["chipset"])) echo "Chipset: " . $row["chipset"];?></p>
                <p class="specification"><?php if(isset($row["socket"])) echo "Socket: " . $row["socket"];?></p>
                <p class="specification"><?php if(isset($row["form_factor"])) echo "Form Factor: " . $row["form_factor"];?></p>
                <p class="specification"><?php if(isset($row["cpu"])) echo "Form Factor: " . $row["cpu"];?></p>
                <p class="specification"><?php if(isset($row["ram"])) echo "Form Factor: " . $row["ram"];?></p>
                <p class="specification"><?php if(isset($row["gpu"])) echo "Form Factor: " . $row["gpu"];?></p>
                <p class="specification"><?php if(isset($row["mbo"])) echo "Form Factor: " . $row["mbo"];?></p>
                <p class="specification"><?php if(isset($row["storage"])) echo "Form Factor: " . $row["storage"];?></p>
                <h3>Price:</h3>
                <h2 class="price" data-eur="<?php echo $row['price'];?>"><?php echo $row['price'];?> EUR</h2>
                <button onclick="addToCart()"><img src="images/shopping-cart.png">Add to Cart</button>
                <h3>Left in Stock: <?php echo $row['stock']; ?></h3>
                <h3>Delivery in 5-7 work days.</h3>
            </div>
            <div class="description">
                <h2>Product Description & Full Specifications</h2>
                <p><?php echo $row['description'];?></p>
            </div>
        </section>
    </main>
    <footer>© 2026 Gaming Gear. All rights reserved.</footer>
</body>
</html>

<script>
    function homeButtonClick(){
        window.location.href = `index.php`;
    }

    const currentCategory = "<?php echo $category;?>";
    const textValue = {gpu:"Graphics Cards", cpu:"Processors", ram:"RAM Modules", storage:"Storage", motherboards:"Motherboards", cooling:"Cooling", cases:"Cases", psu:"Power Supplies", pc:"PC Builds"}[currentCategory];
    document.getElementById("currentCategoryLabel").innerHTML = textValue;
    if(currentCategory == "pc"){
        document.getElementById("nextArrow2").style.display = "none";
        document.getElementById("componentsNavButton").style.display = "none";
    }

    document.querySelectorAll(".specification").forEach(element => {
        if(element.innerHTML.length < 1){
            element.style.display = "none";
        }else{
            element.style.display = "block";
        }
    });
        
    const id = <?= (int)$id ?>;
    const type = "<?= $category ?>";

    function addToCart(){
        fetch(`addToCart.php?id=${id}&type=${type}`)
        .then(res => res.json())
        .then(data => {
            if(data.success){
                scrollToTop();
                document.getElementById("cartMessage").style.display = "block";
                document.getElementById("cartMessage").innerHTML = "ITEM ADDED TO YOUR CART!";
                document.getElementById("cartMessage").className = "cartSuccess";
            }else{
                scrollToTop();
                document.getElementById("cartMessage").style.display = "block";
                document.getElementById("cartMessage").innerHTML = "THIS ITEM IS NOT AVAILABLE";
                document.getElementById("cartMessage").className = "cartFail";
            }
        });
        
    }

    function scrollToTop() {
        window.scrollTo(0, 0);
    }

</script>