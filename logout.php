<?php
    session_start();
    $_SESSION["username"] = "";
    $_SESSION["logged_in"] = false;
    header("Location: index.php");
?>