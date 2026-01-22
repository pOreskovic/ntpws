<?php 
session_start();

if($_SESSION['logged_in'] == false){
    header('Location: index.php');
    exit;
}

if($_SESSION['admin'] == 0){
    header('Location: profile.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $conn = new mysqli("localhost", "gg_db_admin", "ggadminpass1$", "gg");
    if ($conn->connect_error) {
        echo "Error: " . $conn->connect_error;
    } else {
        $componentType = $_POST['componentType'];
        $productName = $_POST['productName'];
        $brand = $_POST['brand'];
        $price = $_POST['price'];
        $description = $_POST['description'];
        $stockAmount = $_POST['stockAmount'];
        $imageName = basename($_FILES["imagePath"]["name"]);
        $targetPath = "images/" . $imageName;
        move_uploaded_file($_FILES["imagePath"]["tmp_name"], $targetPath);
        $imagePath = $imageName;

        if ($componentType == "gpu"){
            $chipset = $_POST['chipset'];
            $memorygb = $_POST['memorygb'];
            $stmt = $conn->prepare("INSERT INTO gpu (name, chipset, brand, memory_gb, price, image, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("sssidssi", $productName, $chipset, $brand, $memorygb, $price, $imagePath, $description, $stockAmount);

        }elseif ($componentType == "cpu") {
            $socket = $_POST['socket'];
            $speed = $_POST['procSpeed'];
            $cores = $_POST['cores'];
            $threads = $_POST['threads'];
            $stmt = $conn->prepare("INSERT INTO cpu (name, brand, socket, speed_mhz, cores, threads, price, image, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("sssiiidssi", $productName, $brand, $socket, $speed, $cores, $threads, $price, $imagePath, $description, $stockAmount);

        }elseif ($componentType == "ram") {
            $capacitygb = $_POST['ramCapacitygb'];
            $type = $_POST['ramType'];
            $speed = $_POST['speed'];
            $stmt = $conn->prepare("INSERT INTO ram (name, brand, capacity_gb, type, speed_mhz, price, image, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssisidssi", $productName, $brand, $capacitygb, $ramType, $speed, $price, $imagePath, $description, $stockAmount);

        }elseif ($componentType == "psu") {
            $power = $_POST['power'];
            $efficiency = $_POST['efficiency'];
            $modular = $_POST['modular'];
            $stmt = $conn->prepare("INSERT INTO psu (name, brand, power_w, efficiency, modular, price, image, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssissdssi", $productName, $brand, $power, $efficiency, $modular, $price, $imagePath, $description, $stockAmount);

        }elseif ($componentType == "motherboards") {
            $socket = $_POST['gpuSocket'];
            $chipset = $_POST['gpuChipset'];
            $formFactor = $_POST['gpuFormFactor'];
            $stmt = $conn->prepare("INSERT INTO motherboards (name, brand, socket, chipset, form_factor, price, image, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("sssssdssi", $productName, $brand, $socket, $chipset, $formFactor, $price, $imagePath, $description, $stockAmount);

        }elseif ($componentType == "cases") {
            $dimensions = $_POST['caseDimensions'];
            $formFactor = $_POST['formFactor'];
            $stmt = $conn->prepare("INSERT INTO cases (name, brand, form_factor, dimensions_mm, price, image, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssssdssi", $productName, $brand, $formFactor, $dimensions, $price, $imagePath, $description, $stockAmount);

        }elseif ($componentType == "storage") {
            $type = $_POST['storageType'];
            $capacitygb = $_POST['capacitygb'];
            $interface = $_POST['interface'];
            $stmt = $conn->prepare("INSERT INTO storage (name, brand, type, capacity_gb, interface, price, image, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("sssisdssi", $productName, $brand, $type, $capacitygb, $interface, $price, $imagePath, $description, $stockAmount);

        }elseif ($componentType == "cooling") {
            $type = $_POST['type'];
            $dimensions = $_POST['dimensions'];
            $stmt = $conn->prepare("INSERT INTO cooling (name, brand, type, dimensions_mm, price, image, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssssdssi", $productName, $brand, $type, $dimensions, $price, $imagePath, $description, $stockAmount);

        }elseif ($componentType == "pc"){
            $cpu = $_POST['pccpu'];
            $ram = $_POST['pcram'];
            $gpu = $_POST['pcgpu'];
            $mbo = $_POST['pcmbo'];
            $storage = $_POST['pcstorage'];
            $stmt = $conn->prepare("INSERT INTO pc (name, brand, cpu, ram, gpu, mbo, storage, price, image, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("sssssssdssi", $productName, $brand, $cpu, $ram, $gpu, $mbo, $storage, $price, $imagePath, $description, $stockAmount);
        }

        $stmt->execute();
        $userMessage = "'" . $productName . "'" . " was added to the database.";
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
    <link rel="stylesheet" href="styleAdminPanel.css">
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
            <a href="adminPanel.php" id="adminbutton" class="selectedSideNavButton">Admin Panel</a>
            <a href="profile.php" class="sideNavButton">Personal Information</a>
            <a href="userOrders.php" class="sideNavButton">Order Overview</a>
            <a href="deleteAccount.php" class="sideNavButton">Delete Account</a>
            <a href="logout.php" class="sideNavButton">Log Out</a>
        </div>
        <div class="adminDashboard">
            <div class="compTypeSelector">
                <h2>Product Selector</h2>
                <form method="POST" class="addComponentForm" id="addComponentForm" enctype="multipart/form-data">
                    <select name="componentType" id="componentTypeDropDown" placeholder="Select Component Type">
                        <option value="" selected disabled>Select Component Type</option>
                        <option value="gpu">Graphics Card</option>
                        <option value="cpu">Procesors</option>
                        <option value="ram">RAM</option>
                        <option value="psu">Power Supplies</option>
                        <option value="motherboards">Motherboards</option>
                        <option value="cases">Cases</option>
                        <option value="storage">Storage</option>
                        <option value="cooling">CPU Cooling</option>
                        <option value="pc">PC Build</option>
                    </select>
                    <hr>
                    <h3 id="addNewText">Add New</h3>
                    <p class="instructionMessage">When you select a component type, a dedicated form will appear, allowing you to add a new instance of that component to the database.</p>
                    <!--COMMON ELEMENTS--> 
                    <input type="text" name="productName" placeholder="Name" class="commonElement">
                    <input type="text" name="brand" placeholder="Brand" class="commonElement">
                    <!--GPU-->
                    <input type="text" name="chipset" placeholder="Chipset"  class="gpuInput">
                    <input type="number" name="memorygb" placeholder="Memory [GB]"  class="gpuInput">
                    <!--CPU-->
                    <input type="text" name="socket" placeholder="Socket [i.e. AM5]" class="cpuInput">
                    <input type="number" name="procSpeed" placeholder="Speed [MHZ]" class="cpuInput">
                    <input type="number" name="cores" placeholder="Cores" class="cpuInput">
                    <input type="number" name="threads" placeholder="Threads" class="cpuInput">
                    <!--RAM-->
                    <input type="number" name="ramCapacitygb" placeholder="Memory Amount [GB]" class="ramInput">
                    <input type="text" name="ramType" placeholder="Type (i.e. DDR3/4/5)" class="ramInput">
                    <input type="number" name="speed" placeholder="Speed in MHz" class="ramInput">
                    <!--PSU-->
                    <input type="number" name="power" placeholder="Power [W]" class="psuInput">
                    <input type="text" name="efficiency" placeholder="Efficiency" class="psuInput">
                    <input type="text" name="modular" placeholder="Modular: [Yes, No]" class="psuInput">
                    <!--motherboards-->
                    <input type="text" name="gpuSocket" placeholder="Socket [i.e. AM5]" class="motherboardsInput">
                    <input type="text" name="gpuChipset" placeholder="Chipset [i.e. B650]" class="motherboardsInput">
                    <input type="text" name="gpuFormFactor" placeholder="Form Factor: [i.e. ATX]" class="motherboardsInput">
                    <!--CASES-->
                    <input type="text" name="caseDimensions" placeholder="Dimensions [in mm, i.e. 200x50x100]" class="casesInput">
                    <input type="text" name="formFactor" placeholder="Form Factor: [i.e. ATX]" class="casesInput">
                    <!--STORAGE-->
                    <input type="text" name="storageType" placeholder="Type [SSD/HDD]" class="storageInput">
                    <input type="number" name="capacitygb" placeholder="Capacity [GB]" class="storageInput">
                    <input type="text" name="interface" placeholder="Interface [i.e. SATA, Nvme]" class="storageInput">
                    <!--COOLING-->
                    <input type="text" name="type" placeholder="Type [i.e. FAN, AIO]" class="coolingInput">
                    <input type="text" name="dimensions" placeholder="Dimensions [in mm, i.e. 200x50x100]" class="coolingInput">
                    <!--PC-->
                    <input type="text" name="pccpu" placeholder="Processor Model" class="pcInput">
                    <input type="text" name="pcram" placeholder="RAM Model" class="pcInput">
                    <input type="text" name="pcgpu" placeholder="GPU Model" class="pcInput">
                    <input type="text" name="pcmbo" placeholder="Motherboard Model" class="pcInput">
                    <input type="text" name="pcstorage" placeholder="Storage" class="pcInput">
                    <!--COMMON ELEMENTS-->  
                    <input type="number" name="price" placeholder="Price [in EUR]" class="commonElement" step="0.01">
                    <textarea name="description" placeholder="Description" class="commonElement" rows="6"></textarea>
                    <input type="number" name="stockAmount" placeholder="Amount in Stock" min="0" step="1" class="commonElement">
                    <input type="file" name="imagePath" placeholder="Image Path" class="commonElement">
                    <button type="submit" id="commonElementButton">Save to Database</button>
                </form>
                <h3 id="userMessage"><?php if(isset($userMessage)){echo $userMessage;};?></h3>
            </div>
            <div class="databaseWindow">
                <h2>Database Preview</h2>
                <hr/>
                <div id="results"></div>
                <p class="instructionMessage">Once you select a component type from the component selector, all components of that category stored in the database will be displayed here.
                     You will be able to preview each component and perform edit or delete actions as needed.</p>
            </div>
        </div>
        
    </main>
    <footer>Gaming Gear d.o.o  •  Turopoljska 17, 10410 Velika Gorica  •  01/1234-567  •  OIB: 12345678912  •  info@ggtrgovina.hr</footer>

    <script>
        const adminUser = <?php echo $_SESSION['admin']?>;
        if(adminUser){
            document.getElementById("adminbutton").style.display = "block";
        }else{
            document.getElementById("adminbutton").style.display = "none";
        }

        hideEverythingExcept = function(activeInput){
            inputTypes = ["gpuInput", "cpuInput", "ramInput", "psuInput", "motherboardsInput", "casesInput", "storageInput", "coolingInput", "pcInput"];

            inputTypes.forEach(inputType => {
                if(inputType != activeInput){
                    document.querySelectorAll("." + inputType).forEach(el => el.style.display = "none");
                }else if(inputType == activeInput){
                    document.querySelectorAll("." + inputType).forEach(el => el.style.display = "block");
                }else{
                    alert("Error while trying to display inputs for adding components.");
                }
            });
        }

        function editItem(id, type) {
            window.location.href = `editComponent.php?type=${type}&id=${id}`;
        }

        function deleteItem(id, type) {
            if (confirm('Are you sure you want to permanently delete this component from the websites database? Once you confirm, component will be deleted.')) {
                window.location.href = `deleteFromDatabase.php?type=${type}&id=${id}`;
            }
        }

    
        componentTypeDropDown = document.getElementById("componentTypeDropDown");

        componentTypeDropDown.addEventListener("change", function(){
            document.querySelectorAll(".commonElement").forEach(el => el.style.display = "block");
            document.getElementById("commonElementButton").style.display = "block";
            document.querySelectorAll(".instructionMessage").forEach(el => el.style.display = "none");
            document.getElementById("addNewText").style.display = "block";
            document.getElementById("userMessage").innerHTML = "";
            selectedInputType = "." + componentTypeDropDown.value + "Input";

            if(componentTypeDropDown.value == "gpu"){
                hideEverythingExcept("gpuInput");
            }else if(componentTypeDropDown.value == "cpu"){
                hideEverythingExcept("cpuInput");
            }else if(componentTypeDropDown.value == "ram"){
                hideEverythingExcept("ramInput");
            }else if(componentTypeDropDown.value == "psu"){
                hideEverythingExcept("psuInput");
            }else if(componentTypeDropDown.value == "motherboards"){
                hideEverythingExcept("motherboardsInput");
            }else if(componentTypeDropDown.value == "cases"){
                hideEverythingExcept("casesInput");
            }else if(componentTypeDropDown.value == "storage"){
                hideEverythingExcept("storageInput");
            }else if(componentTypeDropDown.value == "cooling"){
                hideEverythingExcept("coolingInput");
            }else if(componentTypeDropDown.value == "pc"){
                hideEverythingExcept("pcInput");
            }

            document.querySelectorAll(".commonElement").forEach(el =>{
                el.style.border = "1px solid white";
                el.style.boxShadow = "0 0 2px white";
            });

            document.querySelectorAll(selectedInputType).forEach(el =>{
                el.style.border = "1px solid white";
                el.style.boxShadow = "0 0 2px white";
            });

            fetch("getComponents.php?type=" + this.value)
                .then(res => res.json())
                .then(data => {
                    const container = document.getElementById("results");
                    container.innerHTML = '';

                    data.forEach(item =>{
                        container.innerHTML += `
                <div class="componentCard">
                    <img src="images/${item.image}" alt="component picture">
                    <h3>${item.name}</h3>
                    <p>Price: ${item.price} €</p>
                    <div class="actions">
                        <button onclick="editItem(${item.id}, '${item.type}')">Edit/Details</button>
                        <button onclick="deleteItem(${item.id}, '${item.type}')">Delete</button>
                    </div>
                </div>
            `;
                    })
                })

        })

        document.getElementById("addComponentForm").addEventListener("submit", function(event) {
            incompleteForm = false;
            selectedInputType = "." + componentTypeDropDown.value + "Input";

            document.querySelectorAll(".commonElement").forEach(el =>{
                if (el.value.length < 1) {
                    incompleteForm = true;
                    el.style.border = "1px solid red";
                    el.style.boxShadow = "0 0 2px red";
                    document.getElementById("userMessage").style.color = "red";
                }else{
                    el.style.border = "1px solid white";
                    el.style.boxShadow = "0 0 2px white";
                }
            });

            document.querySelectorAll(selectedInputType).forEach(el =>{
                if (el.value.length < 1) {
                    incompleteForm = true;
                    el.style.border = "1px solid red";
                    el.style.boxShadow = "0 0 2px red";
                    document.getElementById("userMessage").style.color = "red";
                }else{
                    el.style.border = "1px solid white";
                    el.style.boxShadow = "0 0 2px white";
                }
            });

            if(incompleteForm){
                event.preventDefault();
                document.getElementById("userMessage").innerText = "Form Incomplete!";
            }
                
        });

    </script>
</body>
</html>