<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>GG - Contact</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="contact.css">
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
        <a style="color:#1fbcff;border-bottom:3px solid #1fbcff;" href="contact.php">CONTACT</a>
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
<main class="contactPage">

    <h1>Contact Us</h1>
    <p class="subtitle">
        Have questions about products, orders or support?  
        We are here to help.
    </p>

    <section class="contactContainer">

        <div class="contactInfo">

            <div class="infoCard">
                <h2>📍 Our Location</h2>
                <p>Gaming Gear d.o.o.</p>
                <p>Ulica grada Vukovara 269D</p>
                <p>10000, Zagreb, Croatia</p>
            </div>

            <div class="infoCard">
                <h2>📞 Contact</h2>
                <p>Email: support@gaminggear.hr</p>
                <p>Phone: +385 1 234 5678</p>
                <p>Working hours: Mon–Fri 09:00–17:00</p>
            </div>

        </div>

        <div class="mapContainer">
            <iframe
                src="https://www.google.com/maps?q=Ulica%20grada%20Vukovara%20269D%20Zagreb&output=embed"
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>

    </section>

</main>
<footer>
    © 2026 Gaming Gear. All rights reserved.
</footer>

</body>
</html>
