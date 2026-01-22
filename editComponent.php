<?php
    session_start();
    require_once "db.php"; 

    if (!isset($_SESSION["username"])) {
        header("Location: login.php");
        exit;
    }

    if (!isset($_GET["id"], $_GET["type"])) {
        header("Location: adminPanel.php");
        exit;
    }

    $id = intval($_GET["id"]);
    $type = $_GET["type"];

    $stmt = $conn->prepare("SELECT * FROM $type WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $component = $result->fetch_assoc();

    if (!$component) {
        die("Component not found.");
    }


    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $productName = $_POST['produ$productName'];
        $brand = $_POST['brand'];
        $price = $_POST['price'];
        $description = $_POST['description'];
        $stockAmount = $_POST['stockAmount'];
        $imagePath = $component['image'];

        if (!empty($_FILES["imagePath"]["name"])) {
            $imagePath = basename($_FILES["imagePath"]["name"]);
            move_uploaded_file($_FILES["imagePath"]["tmp_name"], "images/" . $imagePath);
        }

        if ($type == "gpu"){
            $chipset = $_POST['chipset'];
            $memorygb = $_POST['memorygb'];
            $stmt = $conn->prepare("UPDATE gpu SET name=?, chipset=?, brand=?, memory_gb=?, price=?, image=?, description=?, stock=? WHERE id=?");
            $stmt->bind_param("sssidssii", $productName, $chipset, $brand, $memorygb, $price, $imagePath, $description, $stockAmount,$id);

        }elseif ($type == "cpu") {
            $socket = $_POST['socket'];
            $cores = $_POST['cores'];
            $speed = $_POST['procSpeed'];
            $threads = $_POST['threads'];
            $stmt = $conn->prepare("UPDATE cpu SET name=?, brand=?, socket=?, speed_mhz=?, cores=?, threads=?, price=?, image=?, description=?, stock=? WHERE id=?");
            $stmt->bind_param("sssiiidssii", $productName, $brand, $socket, $speed, $cores, $threads, $price, $imagePath, $description, $stockAmount,$id);

        }elseif ($type == "ram") {
            $capacitygb = $_POST['capacitygb'];
            $type = $_POST['ramType'];
            $speed = $_POST['speed'];
            $stmt = $conn->prepare("UPDATE ram SET name=?, brand=?, capacity_gb=?, type=?, speed_mhz=?, price=?, image=?, description=?, stock=? WHERE id=?");
            $stmt->bind_param("ssisidssii", $productName, $brand, $capacitygb, $type, $speed, $price, $imagePath, $description, $stockAmount,$id);

        }elseif ($type == "psu") {
            $power = $_POST['power'];
            $efficiency = $_POST['efficiency'];
            $modular = $_POST['modular'];
            $stmt = $conn->prepare("UPDATE psu SET name=?, brand=?, power_w=?, efficiency=?, modular=?, price=?, image=?, description=?, stock=? WHERE id=?");
            $stmt->bind_param("ssissdssii", $productName, $brand, $power, $efficiency, $modular, $price, $imagePath, $description, $stockAmount,$id);

        }elseif ($type == "motherboards") {
            $socket = $_POST['mboSocket'];
            $chipset = $_POST['mboChipset'];
            $formFactor = $_POST['mboFormFactor'];
            $stmt = $conn->prepare("UPDATE motherboards SET name=?, brand=?, socket=?, chipset=?, form_factor=?, price=?, image=?, description=?, stock=? WHERE id=?");
            $stmt->bind_param("sssssdssii", $productName, $brand, $socket, $chipset, $formFactor, $price, $imagePath, $description, $stockAmount,$id);

        }elseif ($type == "cases") {
            $dimensions = $_POST['caseDimensions'];
            $formFactor = $_POST['formFactor'];
            $stmt = $conn->prepare("UPDATE cases SET name=?, brand=?, form_factor=?, dimensions_mm=?, price=?, image=?, description=?, stock=? WHERE id=?");
            $stmt->bind_param("ssssdssii", $productName, $brand, $formFactor, $dimensions, $price, $imagePath, $description, $stockAmount,$id);

        }elseif ($type == "storage") {
            $type = $_POST['storageType'];
            $capacitygb = $_POST['storageCapacitygb'];
            $interface = $_POST['interface'];
            $stmt = $conn->prepare("UPDATE storage SET name=?, brand=?, type=?, capacity_gb=?, interface=?, price=?, image=?, description=?, stock=? WHERE id=?");
            $stmt->bind_param("sssisdssii", $productName, $brand, $type, $capacitygb, $interface, $price, $imagePath, $description, $stockAmount,$id);

        }elseif ($type == "cooling") {
            $type = $_POST['type'];
            $dimensions = $_POST['dimensions'];
            $stmt = $conn->prepare("UPDATE cooling SET name=?, brand=?, type=?, dimensions_mm=?, price=?, image=?, description=?, stock=? WHERE id=?");
            $stmt->bind_param("ssssdssii", $productName, $brand, $type, $dimensions, $price, $imagePath, $description, $stockAmount,$id);
        }elseif ($type == "pc"){
            $cpu = $_POST['pccpu'];
            $ram = $_POST['pcram'];
            $gpu = $_POST['pcgpu'];
            $mbo = $_POST['pcmbo'];
            $storage = $_POST['pcstorage'];
            $stmt = $conn->prepare("UPDATE pc SET name=?, brand=?, cpu=?, ram=?, gpu=?, mbo=?, storage=?, price=?, image=?, description=?, stock=?");
            $stmt->bind_param("sssssssdssi", $productName, $brand, $cpu, $ram, $gpu, $mbo, $storage, $price, $imagePath, $description, $stockAmount);
        }

        $stmt->execute();
        header("Refresh:0");
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Component</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styleEditComponent.css">
</head>
<body>
<script src="currencyExchange.js"></script>
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
    <div class="editContainer">
        <h1>Edit Component</h1>
        <hr/>
        <?php if (isset($successMessage)): ?>
            <p class="success"><?= $successMessage ?></p>
        <?php endif; ?>

        <form method="POST" class="editForm" enctype="multipart/form-data">
            <!-- COMMON -->
            <h5 class="commonElement">Component Name</h5>
            <input type="text" name="produ$productName" class="commonElement" value="<?= htmlspecialchars($component['name']) ?>">
            <h5 class="commonElement">Brand [i.e. Gigabyte]</h5>
            <input type="text" name="brand" class="commonElement" value="<?= htmlspecialchars($component['brand']) ?>">
            <!-- GPU -->
            <h5 class="gpuInput">Chipset [i.e. AMD/NVIDIA]</h5>
            <input type="text" name="chipset" class="gpuInput" value="<?= $component['chipset'] ?? '' ?>">
            <h5 class="gpuInput">Memory [GB]</h5>
            <input type="number" name="memorygb" class="gpuInput" value="<?= $component['memory_gb'] ?? '' ?>">
            <!-- CPU -->
            <h5 class="cpuInput">Socket [i.e. AM5]</h5>
            <input type="text" name="socket" class="cpuInput" value="<?= $component['socket'] ?? '' ?>">
            <h5 class="cpuInput">Speed [MHZ]</h5>
            <input type="number" name="procSpeed" class="cpuInput" value="<?= $component['speed_mhz'] ?? '' ?>">
            <h5 class="cpuInput">Cores</h5>
            <input type="number" name="cores" class="cpuInput" value="<?= $component['cores'] ?? '' ?>">
            <h5 class="cpuInput">Threads</h5>
            <input type="number" name="threads" class="cpuInput" value="<?= $component['threads'] ?? '' ?>">
            <!-- RAM -->
            <h5 class="ramInput">Memory [GB]</h5>
            <input type="number" name="capacitygb" class="ramInput" value="<?= $component['capacity_gb'] ?? '' ?>">
            <h5 class="ramInput">Type [i.e. DDR5]</h5>
            <input type="text" name="ramType" class="ramInput" value="<?= $component['type'] ?? '' ?>">
            <h5 class="ramInput">Speed [MHz]</h5>
            <input type="number" name="speed" class="ramInput" value="<?= $component['speed_mhz'] ?? '' ?>">
            <!-- PSU -->
            <h5 class="psuInput">Power [W]</h5>
            <input type="number" name="power" class="psuInput" value="<?= $component['power_w'] ?? '' ?>">
            <h5 class="psuInput">Efficiency [i.e. 80+ Gold]</h5>
            <input type="text" name="efficiency" class="psuInput" value="<?= $component['efficiency'] ?? '' ?>">
            <h5 class="psuInput">Modular PSU [i.e. Yes, No]</h5>
            <input type="text" name="modular" class="psuInput" value="<?= $component['modular'] ?? '' ?>">
            <!-- MOTHERBOARD -->
            <h5 class="motherboardsInput">Socket [i.e. AM5]</h5>
            <input type="text" name="mboSocket" class="motherboardsInput" value="<?= $component['socket'] ?? '' ?>">
            <h5 class="motherboardsInput">Chipset [i.e. B650]</h5>
            <input type="text" name="mboChipset" class="motherboardsInput" value="<?= $component['chipset'] ?? '' ?>">
            <h5 class="motherboardsInput">Form Factor [i.e. ATX]</h5>
            <input type="text" name="mboFormFactor" class="motherboardsInput" value="<?= $component['form_factor'] ?? '' ?>">
            <!-- CASES -->
            <h5 class="casesInput">Dimensions [in mm, i.e. 200x500x100]</h5>
            <input type="text" name="caseDimensions" class="casesInput" value="<?= $component['dimensions_mm'] ?? '' ?>">
            <h5 class="casesInput">Form Factor Support [i.e. ATX]</h5>
            <input type="text" name="formFactor" class="casesInput" value="<?= $component['form_factor'] ?? '' ?>">
            <!-- STORAGE -->
            <h5 class="storageInput">Type [i.e. SSD]</h5>
            <input type="text" name="storageType" class="storageInput" value="<?= $component['type'] ?? '' ?>">
            <h5 class="storageInput">Capacity [GB]</h5>
            <input type="number" name="storageCapacitygb" class="storageInput" value="<?= $component['capacity_gb'] ?? '' ?>">
            <h5 class="storageInput">Interface Type [i.e. SATA]</h5>
            <input type="text" name="interface" class="storageInput" value="<?= $component['interface'] ?? '' ?>">
            <!-- COOLING -->
            <h5 class="coolingInput">Type [i.e. FAN, AIO]</h5>
            <input type="text" name="type" class="coolingInput" value="<?= $component['type'] ?? '' ?>">
            <h5 class="coolingInput">Dimensions [in mm, i.e. 200x500x100]</h5>
            <input type="text" name="dimensions" class="coolingInput" value="<?= $component['dimensions_mm'] ?? '' ?>">
            <!-- PC -->
            <h5 class="pcInput">Processor</h5>
            <input type="text" name="pccpu" class="pcInput" value="<?= $component['cpu'] ?? '' ?>">
            <h5 class="pcInput">RAM</h5>
            <input type="text" name="pcram" class="pcInput" value="<?= $component['ram'] ?? '' ?>">
            <h5 class="pcInput">Graphics Card</h5>
            <input type="text" name="pcgpu" class="pcInput" value="<?= $component['gpu'] ?? '' ?>">
            <h5 class="pcInput">Motherboard</h5>
            <input type="text" name="pcmbo" class="pcInput" value="<?= $component['mbo'] ?? '' ?>">
            <h5 class="pcInput">Storage</h5>
            <input type="text" name="pcstorage" class="pcInput" value="<?= $component['storage'] ?? '' ?>">
            <!-- COMMON -->
            <h5 class="commonElement">Price [in EURO]</h5>
            <input type="number" name="price" class="commonElement" value="<?= $component['price'] ?>">
            <h5 class="commonElement">Descirption</h5>
            <textarea name="description" class="commonElement" rows="15"><?= htmlspecialchars($component['description']) ?></textarea>
            <h5 class="commonElement">Amount in Stock</h5>
            <input type="number" name="stockAmount" class="commonElement" value="<?= $component['stock'] ?>">
            <h5 class="commonElement">Upload New Image</h5>
            <input type="file" name="imagePath" class="commonElement" value="<?= $component['image'] ?>">

            <div class="formActions">
                <button type="submit">Save Changes</button>
                <a href="adminPanel.php" class="cancelBtn">Cancel</a>
            </div>
        </form>
    </div>
</main>
</body>
</html>

<script>
    const type = "<?= $_GET['type'] ?>";
    const componentTypeClass = "." + type + "Input";
    
    document.querySelectorAll(".commonElement").forEach(el => {
        el.style.display = "block";
    });

    document.querySelectorAll(componentTypeClass).forEach(el => {
        el.style.display = "block";
    });


    
</script>
