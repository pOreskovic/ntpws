<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $conn = new mysqli("localhost", "gg_db_admin", "ggadminpass1$", "gg");
    if ($conn->connect_error) {
        echo "Error: " . $conn->connect_error;
    } else {
        $firstName = $_POST['firstName'];
        $lastName = $_POST['lastName'];
        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = password_hash($_POST['passw'], PASSWORD_DEFAULT);

        $stmt = $conn->prepare("INSERT INTO users (firstName, lastName, username, email, password) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $firstName, $lastName, $username, $email, $password);
        $stmt->execute();

        header("Location: login.php");
        exit;
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
        <h1>Registration</h1>
        <form method="POST" id="registerForm">
            <h3>Create a new account</h3>
            <hr/>
            <input type="text" placeholder="First Name" name="firstName" id="firstName">
            <input type="text" placeholder="Last Name" name="lastName" id="lastName">
            <input type="text" placeholder="Username" name="username" id="username">
            <input type="email" placeholder="E-mail address" name="email" id="email">
            <input type="password" placeholder="Password" name="passw" id="passw1">
            <input type="password" placeholder="Repeat Password" name="passwRepeat" id="passw2">
            <h5 id="error"></h5>
            <hr/>
            <p>Upon completing your registration successfully, you will be redirected to the Sign In page, where you may sign in using your newly created account credentials.</p>
            <button type="submit">Register</button><hr/>
            <h3>Already a member?</h3>
            <br>
            <a href="login.php">Sign In</a>
        </form>

        <script>
            document.getElementById("registerForm").addEventListener("submit", function(event) {
                const username = document.getElementById("username").value;
                const firstName = document.getElementById("firstName").value;
                const lastName = document.getElementById("lastName").value;
                const email = document.getElementById("email").value;
                const passw1 = document.getElementById("passw1").value;
                const passw2 = document.getElementById("passw2").value;
                const error = document.getElementById("error");
                formOK = true;
            
                if (firstName.length < 1) {
                    error.textContent = "Enter first name!";
                    formOK = false;
                } else if(lastName.length < 1){
                    error.textContent = "Enter last name!";
                    formOK = false;
                } else if(username.length < 5){
                    error.textContent = "Username must have at least 5 characters!";
                    formOK = false;
                } else if(email.length < 1){
                    error.textContent = "Enter email!";
                    formOK = false;
                } else if(passw1.length < 5){
                    error.textContent = "Password must have at least 5 characters!"
                    formOK = false
                } else if(passw1 != passw2){
                    error.textContent = "Passwords don't match!";
                    formOK = false;
                }

                if(formOK == false){
                    event.preventDefault();
                }
            });
        </script>

    </main>
    <footer>Gaming Gear d.o.o  •  Turopoljska 17, 10410 Velika Gorica  •  01/1234-567  •  OIB: 12345678912  •  info@ggtrgovina.hr</footer>
</body>
</html>