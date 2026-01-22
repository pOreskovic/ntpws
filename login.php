<?php
session_start();
$formStatus = "";

if (isset($_SESSION["logged_in"]) && $_SESSION["logged_in"]){
    header("Location: profile.php");
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $conn = new mysqli("localhost", "gg_db_admin", "ggadminpass1$", "gg");
    if ($conn->connect_error) {
        echo "Error: " . $conn->connect_error;
    } else {
        $username = $_POST['username'];
        $password = $_POST['passw'];

        $stmt = $conn->prepare("SELECT id, username, password, admin FROM users WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {

            $row = $result->fetch_assoc();

            if (password_verify($password, $row['password'])) {
                $_SESSION['username'] = $row['username'];
                $_SESSION['logged_in'] = true;
                $_SESSION['admin'] = $row['admin'];
                $_SESSION['user_id'] = $row['id'];
                header("Location: profile.php"); 
                exit;
            } else {
                $formStatus = "Password Incorrect!";
            }

        } else {
            $formStatus = "Invalid username!";
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
    <link rel="stylesheet" href="styleLogin.css">
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
                <div class="currency">
                    <label><input type="radio" name="currency"  id="eurRadio" value="EUR" checked>EUR</label>
                    <label><input type="radio" name="currency" id="usdRadio" value="USD">USD</label>
                </div>
                <a href="cart.php"><img src="images/shopping-cart.png"></a>
                <a href="login.php"><img src="images/userBlue.png" ></a>
            </div>
        </nav>
    </header>
    <main>
        <h1>Access Your Account</h1>
            <form method="POST">
                <h3>Sign In</h3>
                <hr/>
                <input type="text" placeholder="Username" name="username">
                <input type="password" placeholder="Account Password" name="passw">
                <h5><?php echo $formStatus; ?></h5>
                <hr>
                <p>After signing in, you will be directed to your profile information page. To return to the home page, use the navigation menu at the top of the page.</p>
                <button type="submit">Sign In</button>
                <hr/>
                <h3>Not a member?</h3>
                <br>
                <a href="register.php">Register here</a>
            </form>
    </main>
    <footer>Gaming Gear d.o.o  •  Turopoljska 17, 10410 Velika Gorica  •  01/1234-567  •  OIB: 12345678912  •  info@ggtrgovina.hr</footer>
</body>
</html>