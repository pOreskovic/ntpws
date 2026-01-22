<?php 
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = new mysqli("localhost", "gg_db_admin", "ggadminpass1$", "gg");
    if ($conn->connect_error) {
        echo "Error: " . $conn->connect_error;
    } else {
        $stmt = $conn->prepare("SELECT password FROM users WHERE username = ?");
        $stmt->bind_param("s", $_SESSION["username"]);
        $stmt->execute();
        $result = $stmt->get_result();

        $password = $_POST["password"];
        if ($result->num_rows === 1) {
            $row = $result->fetch_assoc();
            if(password_verify($password, $row['password'])){
                $stmt = $conn->prepare("DELETE FROM users WHERE username = ?");
                $stmt->bind_param("s", $_SESSION["username"]);
                $stmt->execute();
                $_SESSION["username"] = "";
                $_SESSION["logged_in"] = false;
                header("Location: index.php");
            }else{
                $errorMessage = "Incorrect User Password!";
            }
        }
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
            <a href="profile.php" class="sideNavButton">Personal Information</a>
            <a href="userOrders.php" class="sideNavButton">Order Overview</a>
            <a href="deleteAccount.php" class="selectedSideNavButton">Delete Account</a>
            <a href="logout.php" class="sideNavButton">Log Out</a>
        </div>
        <div class="dashboard">
            <h2>Delete Account</h2>
            <p>In order to delete your account, mark the checkbox and enter your password. Then click on delete profile button.</p>
            <form method="POST" id="deleteAccountForm">
                <h5>Proceeding will delete user account with username: <?php echo $_SESSION['username']?></h5>
                <input placeholder="User Password" type="password" name="password" required class="usrpass"><br>
                <label><input type="checkbox" id="checkbox"> I want to permanently delete this account.</label><br>
                <button type="submit" id="deleteProfileButton">Delete Profile</button>
                <h5 id="errorMessage"><?php if(isset($errorMessage)) echo $errorMessage;?></h5>
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

        document.getElementById("deleteAccountForm").addEventListener("submit", function(event){
            if(document.getElementById("checkbox").checked){
                document.getElementById("errorMessage").innerText = ""
            }else{
                document.getElementById("errorMessage").innerText = "Checkbox is not checked."
                event.preventDefault();
            }
        })

    </script>
</body>
</html>