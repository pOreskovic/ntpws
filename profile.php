<?php 
session_start();
if(!$_SESSION['logged_in']){
    header("Location: login.php");
}

$conn = new mysqli("localhost", "gg_db_admin", "ggadminpass1$", "gg");
if ($conn->connect_error) {
    echo "Error: " . $conn->connect_error;
} else {
    $stmt = $conn->prepare("SELECT firstName, lastName, email, country, city, address, zip FROM users WHERE username = ?");
    $stmt->bind_param("s", $_SESSION["username"]);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();

        $firstName = $row["firstName"];
        $lastName = $row["lastName"];
        $email = $row["email"];
        $country = $row["country"];
        $city = $row["city"];
        $address = $row["address"];
        $zip = $row["zip"];
    } else {
        echo "There was an error while fetching user data from database!";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!$conn->connect_error) {
        $firstName = $_POST['firstName'];
        $lastName = $_POST['lastName'];
        $country = $_POST['country'];
        $city = $_POST['city'];
        $address = $_POST['address'];
        $zip = $_POST['zip'];

        $stmt = $conn->prepare("UPDATE users SET firstName = ?, lastName = ?, country = ?, city = ?, address = ?, zip = ? WHERE username = ?");
        $stmt->bind_param("sssssss", $firstName, $lastName, $country, $city, $address, $zip, $_SESSION["username"]);
        $stmt->execute();
        $confirmation = "Changes Saved";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styleProfile.css">
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
                <a href="login.php"><img src="images/userBlue.png" ></a>
            </div>
            
        </nav>
    </header>
    <main>
        <div class="sideNav">
            <a href="adminPanel.php" id="adminbutton" class="sideNavButton">Admin Panel</a>
            <a href="profile.php" class="selectedSideNavButton">Personal Information</a>
            <a href="userOrders.php" class="sideNavButton">Order Overview</a>
            <a href="deleteAccount.php" class="sideNavButton">Delete Account</a>
            <a href="logout.php" class="sideNavButton">Log Out</a>
        </div>
        <div class="dashboard">
            <h2>Personal Information</h2>
            <form class="userInfoForm" method="POST">
                <hr/>
                <div class="infoContainer">
                    <label>Email</label>
                    <input type="text" disabled value="<?php echo $email;?>"><br>
                    <label>Username</label>
                    <input type="text" disabled placeholder="<?php echo $_SESSION['username'];?>"><br>
                    <label>First Name</label>
                    <input type="text" value="<?php echo $firstName;?>" name="firstName"><br>
                    <label>Last Name</label>
                    <input type="text" value="<?php echo $lastName;?>" name="lastName"><br>
                </div>
                <div class="infoContainer">
                    <label>Country</label>
                    <input type="text" value="<?php echo $country;?>" name="country"><br>
                    <label>City</label>
                    <input type="text" value="<?php echo $city;?>" name="city"><br>
                    <label>Address</label>
                    <input type="text" value="<?php echo $address;?>" name="address"><br>
                    <label>ZIP Code</label>
                    <input type="text" value="<?php echo $zip;?>" name="zip"><br>
                </div>
                <hr/>
                <p>In order to use shipment option for your orders, you have to enter your Country, City, Address and ZIP.</p>
                <button type="submit">Save Changes</button>
                <h5><?php if(isset($confirmation)){echo $confirmation;}?></h5>
                
            </form>
        </div>
    </main>
    <footer>© 2026 Gaming Gear. All rights reserved.</footer>

    <script>
        const adminUser = <?php echo $_SESSION['admin']?>;
        if(adminUser){
            document.getElementById("adminbutton").style.display = "block";
        }else{
            document.getElementById("adminbutton").style.display = "none";
        }
    </script>
</body>
</html>