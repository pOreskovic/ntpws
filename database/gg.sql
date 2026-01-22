-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2026 at 02:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gg`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`) VALUES
(3, 11),
(2, 16);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `component_type` varchar(50) NOT NULL,
  `component_id` int(8) NOT NULL,
  `quantity` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `component_type`, `component_id`, `quantity`) VALUES
(28, 3, 'gpu', 4, 1),
(46, 2, 'cpu', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `form_factor` varchar(20) NOT NULL,
  `dimensions_mm` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `name`, `brand`, `form_factor`, `dimensions_mm`, `image`, `description`, `price`, `stock`, `created_at`) VALUES
(1, 'Kućište Zalman Chronix, Mid tower, kaljeno staklo, bez napajanja, ATX, crno', 'Zalman', 'ATX', '436(L) x 215(W) x 487(H) ', 'zalmanCase.jpg', 'Modern & Sleek Design\r\nThe Chronix combines style and functionality, offering a clean, streamlined look that complements any setup while ensuring optimal performance and ease of use.\r\n\r\nTool-Free Glass Panels\r\nThe Front and Side panels can be easily and completely removed for convenient access to PC components.\r\n\r\nPre-installed ARGB Infinity Mirror Fans\r\nComes with three pre-installed 120mm addressable RGB fans, delivering stunning visuals and full customization for your gaming PC.\r\n\r\nSpecifications:\r\nCase Form Factor ATX Mid-Tower\r\nMaterials Steel, Plastic , Tempered Glass\r\nWeight 6.1kg\r\nDimensions 436(L) x 215(W) x 487(H) mm\r\nMotherboard Support ATX / mATX / Mini-ITX\r\nFan Support Top : 3 x 120mm / 2 x 140mm\r\nSide : 2 x 120mm\r\nRear : 1 x 120mm\r\nBottom : 3 x 120mm\r\nFan(s) Included Side : 2 x 120mm (ARGB Fan)\r\nRear : 1 x 120mm (ARGB Fan)\r\nRadiator Support Top : 120mm/ 140mm / 240mm/ 280mm / 360mm\r\nSide : 120mm / 240mm\r\nRear : 120mm\r\nMax. PSU Length 200mm\r\nMax. VGA Length 410mm\r\nMax. CPU Cooler Height 165mm\r\nDrive Bays 1 x Combo(3.5’’ or 2.5’’), 1 x 3.5’’HDD, 2 x 2.5’’SSD\r\nPCI Expansion Slots 7 pcs\r\nI/O Ports Power, Reset & LED, HD Audio, 1 x USB 2.0, 1 x USB 3.0,\r\n1 x USB Type-C(5Gbps )', 68.00, 7, '2026-01-21 23:28:10'),
(2, 'Kućište Bit Force Voltron ARGB-4, Mid tower, kaljeno staklo, bez napajanja, ATX, crno', 'Bit Force', 'ATX', '410mm x 210mm x 450mm', 'kuciste-bit-force-voltron-argb-4-midi-tower-kaljeno-staklo-b-67126-62340_250793.jpg', 'Mid Tower ARGB Gaming PC kućište\r\n- MBO Podrška: ATX, mATX, ITX\r\n- Disk Utori Podrška: 2 x 3.5\" HDD, 2 x 2.5\" SSD\r\n- I/O Utori: USB 3.0 x1, USB 2.0 x2; HD Audio;\r\n- Bočna Strana: Kaljeno Staklo\r\n- Prednja Strana: Aluminijska Metalna Mreža\r\n- Materijal Strukture: SPCC 0.6mm\r\n- PCI Utori: 7\r\n- Odjeljak za napajanje: Da\r\n- Filter protiv prašine: 2 (Vrh/Dno)\r\n- Ventilatori Uključeni: 4 x 120mm RGB ventilator x 4 (3 x Prednji, 1 x Stražnji)\r\n- Ventilatori Podrška: 3 x 120mm (Prednji), 1 x 120mm (Stražnji), 2 x 120mm (Vrh), 2 x 120mm (Dno)\r\n- Vod. hlađenje Podrška: 1 x 360/240/120mm (Prednje/Vrh/Stražnje)\r\n- VGA Podrška (duljina): 360mm\r\n- CPU Podrška (visina): 165mm\r\n- PSU Podrška (duljina): 165mm\r\n- Dimenzije proizvoda: 410mm(D) x 210mm(Š) x 450mm(V)', 69.00, 9, '2026-01-22 14:10:54'),
(3, 'Kućište DeepCool Wave V2, Mini tower, bez napajanja, Micro ATX, crno', 'DeepCool', 'Micro ATX', '390*175*350mm(L×W×H)', 'kuciste-deepcool-wave-v2.jpg', 'WAVE V2 is a Micro ATX case designed with maximum compatibility in mind. Small size (390 x 175 x 350 mm) makes WAVE V2 the ideal choice for gamers or DIY enthusiasts who are looking for computer cases that actually fits in their limited space. Unique surface treatment provides an elegant and minimalist visual.\r\n\r\nCLASSICAL SMALL CASE MANAGEMENT\r\nUnique surface treatment provides an elegant and minimalist visual. Case dimensions of 390 x 175 x 350 mm. Support VGA card installation up to 340 mm length.\r\n\r\nOPTIMIZED AIRFLOW DESIGN & COOLING SYSTEM\r\n1x 120 mm fan mounting ports on the front panel. 120 mm and 90 mm mounting ports at the front / rear panel. Enhanced cable management to achieve orderly interiors.\r\n\r\nSpecifications:\r\nProduct Dimensions 390*175*350mm(L×W×H)\r\nMaterials ABS+SPCC\r\nMotherboard Support Mini-ITX / Micro-ATX\r\nFront I/O Ports USB3.0×1, USB2.0×2, Audio×1, Mic×1\r\nExpansion Slots 4 Slots\r\nPre-Installed Fans None\r\nFan Support Front: 1×120mm Side: 120mm Rear: 1×90mm\r\nRadiator Support Front: 120mm\r\nCPU Cooler Height Limit 140mm\r\nGPU Length Limit 340mm\r\nPower Supply Type ATX PS2 (maximum length: 150mm)', 32.17, 4, '2026-01-22 14:11:56'),
(4, 'Kućište DeepCool CH780 WH, Full tower, kaljeno staklo, bez napajanja, E-ATX, bijelo', 'DeepCool', 'E-ATX', '528×250×551mm(L×W×H)', 'kuciste-deepcool-ch780.jpg', 'CH780 WH\r\nThe CH780 WH is a majestic premium ATX Max case that places an emphasis on displaying the beauty of the high-end hardware inside. Air flow and radiator compatibility are not ignored, as there are a plethora of fan and radiator combinations. Beauty and air flow without the need for a mesh front panel.\r\n\r\nEXTENSIVE COOLING CAPABILITY\r\nFan options are plentiful, with the ability to mount nine 120mm or 140mm fans or go to the extreme and add up to four 200mm fans into the conversation. The highly modular fan rails make these configurations a reality.The CH780 WH can also support up to three 420mm radiators simultaneously. 420mm radiators can be mounted to the top, bottom, and side of the motherboard tray. The CPU cooler height is limited to 132mm due to the internal configuration.\r\n\r\nPLENTY OF I/O PORTS\r\nWith four USB 3.0 ports, a Gen2 Type-C port, and a hybrid audio port, there is no shortage of devices that can be accessed from the top front I/O panel.\r\n\r\nSpecifications:\r\nProduct Dimensions: 528×250×551mm(L×W×H)\r\nNet Weight: 13.7Kg\r\nMaterials: ABS+SPCC+Tempered Glass\r\nMotherboard Support: Mini-ITX / M-ATX / ATX / E-ATX\r\nFront I/O Ports: USB3.0×4, Audio×1, Gen2 Type-C×1\r\n3.5\" Drive Bays: 2\r\n2.5\" Drive Bays: 2+1\r\nExpansion Slots: 3 Slots\r\nPre-Installed Fans: Side:1×420mm ARGB\r\nFan Support: Top: 3×120 / 3×140 / 2×180 / 2×200mm\r\nSide: 3×120 / 3×140mm\r\nBottom: 3×120 / 3×140 / 2×180 / 2×200mm\r\nRadiator Support: Top: 120/140/240/280/360/420mm\r\nSide: 120/140/240/280/360/420mm\r\nBottom: 120/140/240/280/360/420mm\r\nCPU Cooler Height Limit: 132mm\r\nGPU Length Limit: 480mm\r\nPower Supply Type: ATX PS2(maximum length: 180mm)', 193.75, 1, '2026-01-22 14:13:15');

-- --------------------------------------------------------

--
-- Table structure for table `cooling`
--

CREATE TABLE `cooling` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `type` varchar(100) NOT NULL,
  `dimensions_mm` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cooling`
--

INSERT INTO `cooling` (`id`, `name`, `brand`, `type`, `dimensions_mm`, `image`, `description`, `price`, `stock`, `created_at`) VALUES
(1, 'Hladnjak za procesor DeepCool AG300, 1x92mm, Intel i AMD', 'DeepCool', 'FAN + HEAT SINK TOWER', '119×77×130', 'ag300.jpg', 'Efficient Cooling Power\r\nThree direct contact copper heat pipes effectively transfer heat for optimal dissipation through the heat sink tower. The 92mm PWM fan outputs balanced airflow for performance and silence.\r\n\r\nNew Family Appearance\r\nThe AG300 adopts a new DeepCool family design and features a unique matrix fin array that densely packs each fin for a neat and firm construction. The nickel plated heat pipes provide extra protection against copper corrosion.\r\n\r\nEasy Installation\r\nCompatible with multiple socket platforms from Intel and AMD with support for the latest changes. Ensure a proper mount pressure with the included brackets for a seamless installation.\r\n\r\nSpecifications:\r\nCompatibility\r\nIntel LGA 1700/1200/1151/1150/1155\r\nAMD AM5/AM4\r\nTechnical Spec\r\nProduct Dimensions 119×77×129 mm(L×W×H)\r\nFan Dimensions 92×92×25 mm(L×W×H)\r\nFan Speed 500~3050 RPM±10%\r\nFan Airflow 36.75 CFM\r\nFan Air Pressure 2.89 mmAq\r\nFan Noise <= 30.5 dB(A)\r\nFan Connector 4-pin PWM\r\nBearing Type Hydro Bearing\r\nFan Rated Voltage 12 VDC\r\nFan Rated Current 0.13 A\r\nFan Power Consumption 1.56 W', 20.00, 4, '2026-01-21 23:22:21'),
(2, 'DeepCool LE500 Marrs, 2x120mm, green LED, Intel & AMD', 'DeepCool', 'AIO Water Cooling', '282×120×27', 'vodeno-hladenje-deepcool-le500.jpg', 'Keeping it Cool\r\nThe LE series coolers deliver an upgraded cooling power of 220W thanks to an enlarged copper cold plate with efficient micro-channel waterways and paired with a new high-performance fan for optimal thermals.\r\n\r\nNew Style, New Look\r\nBringing in a new family style with an updated DeepCool design, the LE series also adopts a static Marrs green LED lighting system for an understated look. The cooling block\'s 52mm height allows for better mini-ITX system compatibility without sacrificing performance.\r\n\r\nHigh Efficiency Fans\r\nThe new fan design offers amazing high static pressure for better cooling performance while keeping optimal noise levels.\r\n\r\nSpecifications:\r\nCompatibility:\r\nIntel LGA1700/1200/1151/1150/1155\r\nAMD AM5/AM4\r\nRadiator Dimensions: 282×120×27 mm(L×W×H)\r\nRadiator Material: Aluminum\r\nTube length: 415 mm(L×W×H)\r\nPump Dimensions: 91×80×52 mm(L×W×H)\r\nPump Speed: 2400 RPM±10%\r\nPump Noise: 17.8 dB(A)\r\nPump Connector: 3-pin\r\nPump Rated Voltage: 12 VDC\r\nPump Rated Current: 0.27 A\r\nPump Power Consumption: 3.24 W\r\nFan Dimensions: 120×120×25 mm(L×W×H)\r\nFan Speed: 500~2250RPM±10%\r\nFan Airflow: 85.85 CFM\r\nFan Air Pressure: 3.27 mmAq\r\nFan Noise: <= 32.9 dB(A)\r\nFan Connector: 4-pin PWM\r\nBearing Type: Hydro Bearing\r\nFan Rated Voltage: 12 VDC\r\nFan Rated Current: 0.31A\r\nFan Power Consumption: 3.72 W\r\nLED Type: Marrs Green LED', 60.00, 4, '2026-01-21 23:26:48'),
(3, 'Vodeno hlađenje Lian Li GA II Lite 240 Performance, 2x120mm, Intel i AMD, crno', 'Lian Li', 'AIO', '276 x 120 x 27mm', 'vodeno-hladenje-lian-li-ga-ii-lite-240.jpg', 'ROTATABLE LOGO\r\nEach pump includes a removable logo lid, allowing the logo orientation to adjust to any setup.\r\n\r\nSTUNNING PUMP LIGHTING\r\nFeaturing 16 LEDs beneath the pump cap, paired with dual infinity mirror rings and the outer diffuser, the pump head illuminates with eye-catching, multi-layered lighting effects that enhance your build’s aesthetics.\r\n\r\nPRE-INSTALLED DAISY-CHAIN FANS\r\nFeatures large airflow radiator fans that are daisy-chained and installed on the radiator for an easy cable connection and a seamless view while effectively cooling the radiator.\r\n\r\nSpecifications:\r\nPUMP SPEED 3800 RPM\r\nWATER BLOCK DIMENSIONS 74 x 74 x 67mm\r\nRADIATOR DIMENSIONS 276 x 120 x 27mm\r\nRADIATOR MATERIAL Aluminum\r\nRADIATOR FINS Single Wave\r\nTUBE LENGTH 400mm\r\nFAN DIMENSIONS 124 x 120 x 28mm\r\nFAN SPEED 200 ~ 2500 RPM\r\nFAN STATIC PRESSURE 5 mmH20\r\nFAN AIRFLOW 73.14 CFM\r\nFAN NOISE LEVEL 29.8 dBA\r\nBEARING TYPE FDB Bearing\r\nSOCKETS Intel: LGA 1851/1700 AMD: AM5 / AM4', 99.99, 5, '2026-01-22 14:15:34'),
(4, 'Hladnjak za procesor Zalman CNPS9X Optima2, 120mm ARGB, Intel i AMD', 'Zalman', 'FAN', '120 x 75 x 155(H)mm', 'zalman-cpu-cooler-120mm-fan.jpg', 'Addressable RGB Lighting\r\nStunning and bright ARGB colors shine through the white matte blades of CNPS9X Optima2 presenting your built in the most beautiful light possible.\r\n\r\nBlack Anodized Top Cover & Chrome-Coated Heatpipes\r\nBlack Anodized Top Cover & Chrome-Coated heatpipes add aesthetic to CNPS9X Optima2 increases thermal conductivity and rust resistance of the heatpipes.\r\n\r\nQuiet Operation\r\n120mm PWM fan ensures a quiet performance with a maximum noise level of 29.5dB(A).\r\n\r\nSpecifications:\r\nModel CNPS9X OPTIMA2\r\nDimensions (Cooler) 120 x 75 x 155(H)mm\r\nWeight 635g\r\nQ\'Max 190W\r\nHeat Pipe 4\r\nHeat Dissipation Area 5,974cm3\r\nMaterials Pure Copper, Pure Aluminum\r\nSocket Compatibility\r\nIntel Socket : LGA1851/1700/1200/115X/2066/2011-V3/2011\r\nAMD Socket : AM5/AM4/AM3\r\nFan\r\nDimensions 120 x 120 x 25(H)mm\r\nFan Speed 800~1,500RPM±10%\r\nMax Noise Level 29.5dB(A)±10%\r\nFan Connector 4-Pin\r\nBearing Type Hydraulic Bearing\r\nControl Method PWM Control\r\nARGB Connector 3-Pin\r\nMax Airflow 47.12CFM±10%\r\nRated Current 0.31A\r\nMax. Static Pressure 1.06mmH2O±10%\r\nLife Span 40,000hours\r\nRated Voltage 12V DC(LED 5V)\r\nPower Consumption 3.72W', 22.50, 15, '2026-01-22 14:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `cpu`
--

CREATE TABLE `cpu` (
  `id` int(8) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `socket` varchar(20) NOT NULL,
  `speed_mhz` int(10) NOT NULL,
  `cores` int(50) NOT NULL,
  `threads` int(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `stock` int(5) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cpu`
--

INSERT INTO `cpu` (`id`, `name`, `brand`, `socket`, `speed_mhz`, `cores`, `threads`, `price`, `image`, `description`, `stock`, `created_at`) VALUES
(1, 'AMD Ryzen 5 7500F', 'AMD', 'AM5', 5000, 6, 12, 299.00, 'ryzen7500f.jpeg', 'Amd Ryzen Procesor AM5', 1, '0000-00-00 00:00:00'),
(8, 'Procesor Intel Core i3-12100F (4C/8T, up to 4.3GHz, 12MB, LGA1700), BX8071512100F', 'Intel', 'LGA1700', 4300, 4, 8, 99.00, 'i3.12100f.jpg', '12th Gen Intel Core i3-12100F desktop processor, without processor graphics. Featuring PCIe 5.0 & 4.0 support, DDR5 and DDR4 support, 12th Gen Intel Core i3 desktop processors are optimized for productivity. Discrete graphics required. Intel Laminar RM1 included in the box. Compatible with Intel 600 Series Chipset based motherboards. 58W Processor Base Power.\r\n\r\nCPU Specifications\r\nTotal Cores 4\r\nNumber of Performance-cores 4\r\nNumber of Efficient-cores 0\r\nTotal Threads 8\r\nMax Turbo Frequency 4.30 GHz\r\nPerformance-core Max Turbo Frequency 4.30 GHz\r\nPerformance-core Base Frequency 3.30 GHz\r\nCache 12 MB Intel Smart Cache\r\nTotal L2 Cache 5 MB\r\nProcessor Base Power 58 W\r\nMaximum Turbo Power 89 W\r\nMemory Specifications\r\nMax Memory Size (dependent on memory type) 128 GB\r\nMemory Types Up to DDR5 4800 MT/s, Up to DDR4 3200 MT/s\r\nMax number of Memory Channels 2\r\nMax Memory Bandwidth 76.8 GB/s\r\nExpansion Options\r\nDirect Media Interface (DMI) Revision 4.0\r\nMax number of DMI Lanes 8\r\nScalability 1S Only\r\nPCI Express Revision 5.0 and 4.0\r\nPCI Express Configurations Up to 1x16+4, 2x8+4\r\nMax number of PCI Express Lanes 20\r\nThermal Solution Specification PCG 2020C\r\nTJUNCTION 100C', 4, '2026-01-21 22:48:10'),
(9, 'Procesor Intel Core i9-14900 (24C/32T, 5.8GHz, 36MB, LGA1700), BX8071514900', 'Intel', 'Intel LGA1700', 5800, 24, 32, 749.00, 'i914900.jpg', 'These processors feature a performance hybrid architecture designed for intelligent performance, optimized creating, and enhanced tuning to allow gamers to game with up to 5.8 GHz clock speed.\r\n\r\nSpecifications:\r\nProduct Collection Intel Core i9 Processors (14th gen)\r\nCode Name Products formerly Raptor Lake\r\nVertical Segment Desktop\r\nProcessor Number i9-14900\r\nLithography Intel 7\r\nCPU Specifications:\r\nTotal Cores 24\r\nNumber of Performance-cores 8\r\nNumber of Efficient-cores 16\r\nTotal Threads 32\r\nMax Turbo Frequency 5.8 GHz\r\nIntel Thermal Velocity Boost Frequency 5.8 GHz\r\nIntel Turbo Boost Max Technology 3.0 Frequency 5.6 GHz\r\nPerformance-core Max Turbo Frequency 5.4 GHz\r\nEfficient-core Max Turbo Frequency 4.3 GHz\r\nPerformance-core Base Frequency 2 GHz\r\nEfficient-core Base Frequency 1.5 GHz\r\nCache 36 MB Intel Smart Cache\r\nTotal L2 Cache 32 MB\r\nProcessor Base Power 65 W\r\nMaximum Turbo Power 219 W\r\nMemory Specifications:\r\nMax Memory Size (dependent on memory type) 192 GB\r\nMemory Types Up to DDR5 5600 MT/s, Up to DDR4 3200 MT/s\r\nMax Number of Memory Channels 2\r\nMax Memory Bandwidth 89.6 GB/s\r\nGPU Specifications:\r\nGPU Name Intel UHD Graphics 770\r\nGraphics Base Frequency 300 MHz\r\nGraphics Max Dynamic Frequency 1.65 GHz\r\nGraphics Output eDP 1.4b, DP 1.4a, HDMI 2.1\r\nExecution Units 32\r\nMax Resolution (HDMI) 4096 x 2160 @ 60Hz\r\nMax Resolution (DP) 7680 x 4320 @ 60Hz\r\nMax Resolution (eDP - Integrated Flat Panel) 5120 x 3200 @ 120Hz\r\nDirectX Support 12\r\nOpenGL Support 4.5\r\nOpenCL Support 3.0\r\nMulti-Format Codec Engines 2\r\nIntel Quick Sync Video Yes\r\nIntel Clear Video HD Technology Yes\r\nNumber of Displays Supported 4\r\nExpansion Options:\r\nDirect Media Interface (DMI) Revision 4.0\r\nMax Number of DMI Lanes 8\r\nScalability 1S Only\r\nPCI Express Revision 5.0 and 4.0\r\nPCI Express Configurations Up to 1x16+4, 2x8+4\r\nMax Number of PCI Express Lanes 20\r\nPackage Specifications:\r\nSockets Supported FCLGA1700\r\nThermal Solution Specification PCG 2020C\r\nTJUNCTION 100°C', 4, '2026-01-22 13:46:35'),
(10, 'Procesor AMD Ryzen 5 8500G (6C/12T, up to 5.0GHz, 16MB, AM5), 100-100000931BOX', 'AMD', 'AM5', 5000, 6, 12, 195.00, 'ryzen8500g.jpg', 'With six cores and 12 threads, the AMD Ryzen 5 8500G 3.5 GHz Six-Core AM5 Processor brings your gaming and content-creation experiences to new levels. Designed for socket AM5 motherboards using the powerful Zen 4 architecture with the 4nm process, this Ryzen processor delivers significantly improved performance compared to its predecessor while maintaining high energy efficiency.\r\n\r\nSpecifications:\r\nPlatform Desktop\r\nProduct Family AMD Ryzen Processors\r\nProduct Line AMD Ryzen 5 8000 G-Series Desktop Processors with Radeon Graphics\r\nNumber of CPU Cores 6\r\nNumber of Threads 12\r\nMax. Boost Clock Up to 5.0GHz\r\nBase Clock 3.5GHz\r\nL2 Cache 6MB\r\nL3 Cache 16MB\r\nDefault TDP 65W\r\nProcessor Technology for CPU Cores TSMC 4nm FinFET\r\nCPU Socket AM5\r\nMax. Operating Temperature (Tjmax) 95°C\r\nPCI Express Version PCIe 4.0\r\nSystem Memory Type DDR5\r\nMemory Channels 2\r\nGraphics Model AMD Radeon 740M\r\nGraphics Core Count 4\r\nGraphics Frequency 2800 MHz', 10, '2026-01-22 13:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `gpu`
--

CREATE TABLE `gpu` (
  `id` int(8) NOT NULL,
  `name` varchar(150) NOT NULL,
  `chipset` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `memory_gb` int(8) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `stock` int(8) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gpu`
--

INSERT INTO `gpu` (`id`, `name`, `chipset`, `brand`, `memory_gb`, `price`, `image`, `description`, `stock`, `created_at`) VALUES
(1, 'Grafička Gigabyte GeForce RTX3060 Windforce OC, 12GB GDDR6', 'Nvidia', 'Gigabyte', 12, 399.00, 'rtx3060.jpg', 'ULTRA DURABLE\r\nUltra Durable certified highest-grade metal chokes, lower ESR solid capacitors, 2oz copper PCB, and lower RDS(on) MOSFETs, plus over-temperature design to deliver superior performance and longer system life.\r\n\r\nSpecifications:\r\nGraphics Processing GeForce RTX 3060\r\nCore Clock 1792 MHz (Reference Card: 1777 MHz)\r\nCUDA Cores 3584\r\nMemory Clock 15000 MHz\r\nMemory Size 12 GB\r\nMemory Type GDDR6\r\nMemory Bus 192 bit\r\nMemory Bandwidth (GB/sec) 360 GB/s\r\nCard Bus PCI-E 4.0 x 16\r\nDigital max resolution 7680x4320\r\nMulti-view 4\r\nCard size L=198 W=121 H=39 mm\r\nPCB Form ATX\r\nDirectX 12 Ultimate\r\nOpenGL 4.6\r\nRecommended PSU 550W\r\nPower Connectors 8 pin*1\r\nOutput\r\nDisplayPort 1.4a *2\r\nHDMI 2.1 *2', 5, '2026-01-06 17:09:33'),
(10, 'Grafička XFX AMD Radeon RX7600 Speedster SWFT 210 Core, 8GB GDDR6', 'AMD', 'XFX', 8, 310.00, 'rx7600.speedster.jpg', 'Speedster Series\r\nThe Speedster series exemplifies a modern aerodynamic style though clean and elegant design. It is a thoughtful design with the sole purpose of maximizing airflow to improve cooling and performance.\r\n\r\nAirflow and Cooling\r\nFinding the balance between a good looking card and maximizing it\'s performance is an art. Where we could improve airflow, we did it, we opened it up while keeping the design clean and cool.\r\n\r\nXFX Dual BIOS Ready\r\nWe know enthusiasts like options, so for our SWFT 210 RX 7600 series graphics cards, we are offering dual BIOS. Giving a backup BIOS in the case of a failed BIOS update.\r\n\r\nSpecifications:\r\nBus Type: PCI-E 4.0\r\nPrimary Clock Speeds:\r\nBase clock Up to: 1875 MHz\r\nGame Clock Up To: 2250 MHz\r\nBoost clock Up to: 2655 MHz\r\nStream Processors: 2048\r\nCompute Units: 32\r\nMemory Bus: 128bit\r\nMemory Clock: 18 Gbps\r\nMemory Size: 8 GB\r\nEffective Memory Bandwidth: Up to 476.9 GB/s\r\nMemory Type: GDDR6\r\nCard Profile: 2 slot\r\nThermal Solution: 2 Fan\r\nOutputs\r\nDisplayPort 2.1: 3x\r\nHDMI 2.1: 1x\r\nRequirements\r\nExternal Power: 1x PCI-E 8 pin connections\r\nMinimum Power Supply Requirement: 550 watt\r\nDimensions\r\nCard Dimension (cm) 24.1 x 13.1 x 4.1', 5, '2026-01-15 13:33:29'),
(11, 'Grafička Gigabyte AMD Radeon RX9060XT Gaming OC, 8GB GDDR6', 'AMD', 'Gigabyte', 8, 450.00, 'rtx3060.windforce.jpg', 'WINDFORCE COOLING SYSTEM\r\nThe WINDFORCE cooling system delivers exceptional thermal performance through a combination of cutting-edge technologies. It features server-grade thermal conductive gel, innovative Hawk fans with alternate spinning, composite copper heat pipes, a copper plate, 3D active fans, and screen cooling.\r\n\r\nASTONISHING EXTERIOR DESIGN\r\nThe GAMING series draws the concept from mech warriors, blending the futuristic armor with mechanical aesthetics to deliver exceptional protection and powerful durability. It goes beyond mere appearances and functionality, offering a profound interpretation of futuristic technology.\r\n\r\nRGB LIGHTING\r\nWith 16.7M customizable color options and numerous lighting effects, you can choose any lighting effect or synchronize with other devices in GIGABYTE CONTROL CENTER.\r\n\r\nSpecifications:\r\nGraphics Processing: Radeon RX 9060 XT\r\nMemory Clock: 20 Gbps\r\nMemory Size: 8GB\r\nMemory Type: GDDR6\r\nMemory Bus: 128 bit\r\nCard Bus: PCI-E 5.0\r\nDigital max resolution: 7680 x 4320\r\nMulti-view: 3\r\nCard size: L=281 W=118 H=40 mm\r\nPCB Form: ATX\r\nDirectX: DirectX 12 API\r\nOpenGL: OpenGL 4.6\r\nRecommended PSU: 450W\r\nPower Connectors: 8 pin*1\r\nOutput:\r\nDisplayPort 2.1a x2\r\nHDMI 2.1b x1', 15, '2026-01-15 13:34:36'),
(18, 'Grafička Asus GeForce RTX5050 Prime OC, 8GB GDDR6', 'Nvidia', 'ASUS', 8, 370.00, 'asus5050.jpg', 'Primed for Power\r\nExperience Primal performance with the Prime GeForce RTX 5050, featuring a 2.5-slot design for expansive compatibility, enhanced by a triple-fan setup for supreme airflow design for supreme cooling.\r\n\r\n2.5-slot Design\r\nThe Prime RTX 5050 features a 2.5 slot design with a carefully arranged layout for the shroud, heatsink and heat pipes to let the three Axial-tech fans leverage chassis side-panel ventilation and deliver optimal thermal performance.\r\n\r\nVented Backplate\r\nLarge backplate vents significantly enhance heat dissipation, helping to keep the GPU cooler during intense tasks. This additional airflow helps ensure optimal temperatures, boosting performance, longevity and stability by defending against overheating and thermal throttling.\r\n\r\nSpecifications:\r\nGraphic Engine: NVIDIA GeForce RTX 5050\r\nAI Performance: 421 TOPs\r\nBus Standard: PCI Express 5.0\r\nOpenGL: OpenGL4.6\r\nVideo Memory: 8GB GDDR6\r\nEngine Clock:\r\nOC mode: 2707 MHz\r\nDefault mode: 2677 MHz (Boost Clock)\r\nCUDA Core: 2560\r\nMemory Speed: 20 Gbps\r\nMemory Interface: 128-bit\r\nResolution: Digital Max Resolution 7680 x 4320\r\nInterface:\r\nYes x 1 (Native HDMI 2.1b)\r\nYes x 3 (Native DisplayPort 2.1b)\r\nHDCP Support Yes (2.3)\r\nMaximum Display Support: 4\r\nNVlink/ Crossfire Support: No\r\nDimensions: 268.3 x 120 x 50mm\r\nRecommended PSU: 550W\r\nPower Connectors: 1 x 8-pin\r\nSlot: 2.5 Slot', 7, '2026-01-22 13:39:14'),
(19, 'Grafička Asus AMD Radeon RX9070XT TUF Gaming OC, 16GB GDDR6', 'AMD', 'ASUS', 16, 1200.00, 'asus.rx9070xt.jpg', 'Dual-ball Fan Bearings\r\nDual-ball bearings offer an extensive lifespan of up to 80,000 hours, double the longevity of sleeve bearings and surpassing fluid dynamic bearings. This helps ensure long-lasting, reliable and quiet cooling.\r\n\r\nCooling Mastery\r\nThis advanced cooling design features the ASUS-exclusive MaxContact manufacturing technique, a phase-change GPU thermal pad and efficient Axial-tech fans, helping to ensure premium thermal performance, optimized airflow and quiet operation, all within a robust and vented metal exoskeleton.\r\n\r\nVented Exoskeleton\r\nA high-quality diecast shroud and aluminum backplate help prevent PCB flex and feature large vents to further increase heat dissipation.\r\n\r\nSpecifications:\r\nModel TUF-RX9070XT-O16G-GAMING\r\nGraphic Engine AMD Radeon RX 9070 XT\r\nEngine Clock\r\nOC mode(GPU Tweak III): up to 3080 MHz (Boost Clock)/up to 2540 MHz (Game Clock)\r\nDefault mode: up to 3060 MHz (Boost Clock)/up to 2520 MHz (Game Clock)\r\nOC mode(GPU Tweak III): up to 3080 MHz (Boost Clock)/up to 2540 MHz (Game Clock)\r\nDefault mode: up to 3060 MHz (Boost Clock)/up to 2520 MHz (Game Clock)\r\nMemory Speed 20 Gbps\r\nInterface\r\nYes x 1 (Native HDMI 2.1b)\r\nYes x 3 (Native DisplayPort 2.1a)\r\nHDCP Support Yes (2.3)\r\nBus Standard PCI Express 5.0\r\nOpenGL OpenGL4.6\r\nVideo Memory 16GB GDDR6\r\nStream Processors 4096\r\nMemory Interface 256-bit\r\nResolution Digital Max Resolution 7680 x 4320\r\nMaximum Display Support 4\r\nNVlink/ Crossfire Support No\r\nDimensions 330 x 140 x 62.5 mm\r\nRecommended PSU 850W\r\nPower Connectors 3 x 8-pin\r\nSlot 3.125 Slot\r\nAURA SYNC RGB', 6, '2026-01-22 13:41:07'),
(20, 'Grafička Gigabyte GeForce RTX5090 Windforce OC, 32GB GDDR7', 'Nvidia', 'Gigabyte', 32, 3399.99, 'gigabyte.5090.jpg', 'WINDFORCE COOLING SYSTEM\r\nThe WINDFORCE cooling system delivers exceptional thermal performance through a combination of cutting-edge technologies. It features server-grade thermal conductive gel, innovative Hawk fans with alternate spinning, composite copper heat pipes, a large vapor chamber, 3D active fans, and screen cooling.\r\n\r\nHAWK FAN\r\nThe Hawk Fan features a unique blade design inspired by the aerodynamics of an eagle\'s wing. This design reduces air resistance and noise levels, resulting in up to a 53.6% increase in air pressure and a 12.5% increase in air volume without compromising acoustics.\r\n\r\nVERSATILE VGA HOLDER\r\nOur newly designed VGA holder offers dozens of customizable mounting options, ensuring your graphics card is securely supported and prevents sagging. Its sleek design allows for discreet installation, enhancing the overall aesthetics of your system.\r\n\r\nSpecifications:\r\nGraphics Processing: GeForce RTX 5090\r\nCore Clock: 2467 MHz (Reference card : 2407MHz)\r\nCUDA Cores: 21760\r\nMemory Clock: 28 Gbps\r\nMemory Size: 32 GB\r\nMemory Type: GDDR7\r\nMemory Bus: 512 bit\r\nCard Bus: PCI-E 5.0\r\nDigital max resolution: 7680x4320\r\nMulti-view: 4\r\nCard size: L=342 W=150 H=65 mm\r\nPCB Form: ATX\r\nDirectX: DirectX 12 API\r\nOpenGL: 4.6\r\nRecommended PSU: 1000W\r\nPower Connectors: 16 Pin*1\r\nOutput:\r\nDisplayPort 2.1b *3\r\nHDMI 2.1b *1', 2, '2026-01-22 13:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `motherboards`
--

CREATE TABLE `motherboards` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `socket` varchar(20) NOT NULL,
  `chipset` varchar(30) NOT NULL,
  `form_factor` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motherboards`
--

INSERT INTO `motherboards` (`id`, `name`, `brand`, `socket`, `chipset`, `form_factor`, `image`, `description`, `price`, `stock`, `created_at`) VALUES
(1, 'Matična ploča Gigabyte B650M S2H, AMD AM5, Micro ATX', 'Gigabyte', 'AM5', 'B650', 'ATX', 'gigabyte.b650ms2h.jpg', 'Durable Performance\r\nGIGABYTE Ultra Durable motherboards built with optimal components inside out provide the prime performance and timeless platform.\r\n\r\nFuture Connectivity\r\nThe ultimate connectivity with blazing data-transfer speeds through the next generation network and storage\r\n\r\nSpecifications:\r\nCPU\r\nAMD Socket AM5, support for:\r\nAMD Ryzen 7000 / Ryzen 8000 / Ryzen 9000 Series Processors\r\nChipset\r\nAMD B650\r\nMemory\r\nSupport for DDR5 6400(OC) / 6200(OC) / 6000(OC) / 5600(OC) / 5200 / 4800 / 4400 MT/s memory modules\r\n2 x DDR5 DIMM sockets supporting up to 96 GB (48 GB single DIMM capacity) of system memory\r\nDual channel memory architecture\r\nSupport for non-ECC Un-buffered DIMM 1Rx8/2Rx8/1Rx16 memory modules\r\nSupport for AMD EXtended Profiles for Overclocking (AMD EXPO) and Extreme Memory Profile (XMP) memory modules\r\nOnboard Graphics\r\nIntegrated Graphics Processor:\r\n- 1 x D-Sub port, supporting a maximum resolution of 1920x1200@60 Hz\r\n- 1 x DisplayPort, supporting a maximum resolution of 3840x2160@144 Hz\r\n- 1 x HDMI port, supporting a maximum resolution of 4096x2160@60 Hz\r\nSupport for up to 3 displays at the same time\r\nAudio\r\nRealtek Audio CODEC\r\nHigh Definition Audio\r\n2/4/5.1/7.1-channel\r\nLAN\r\nRealtek GbE LAN chip (1 Gbps/100 Mbps/10 Mbps)\r\nExpansion Slots\r\n1 x PCI Express x16 slot (PCIEX16), integrated in the CPU:\r\n- AMD Ryzen 7000 Series Processors support PCIe 4.0 x16 mode\r\n- AMD Ryzen 8000 Series-Phoenix 1 Processors support PCIe 4.0 x8 mode\r\n- AMD Ryzen 8000 Series-Phoenix 2 Processors support PCIe 4.0 x4 mode\r\nChipset:\r\n- 1 x PCI Express x1 slot, supporting PCIe 3.0 and running at x1(PCIEX1)\r\nStorage Interface\r\n1 x M.2 connector (M2A_CPU), integrated in the CPU, supporting Socket 3, M key, type 2580/2280 SSDs:\r\n- AMD Ryzen 7000 Series Processors support PCIe 4.0 x4/x2 SSDs\r\n- AMD Ryzen 8000 Series-Phoenix 1 Processors support PCIe 4.0 x4/x2 SSDs\r\n- AMD Ryzen 8000 Series-Phoenix 2 Processors support PCIe 4.0 x4/x2 SSDs\r\n4 x SATA 6Gb/s connectors\r\nRAID 0, RAID 1, and RAID 10 support for NVMe SSD storage devices\r\nRAID 0, RAID 1, and RAID 10 support for SATA storage devices\r\nUSB\r\nCPU:\r\n- 2 x USB 3.2 Gen 1 ports on the back panel\r\n- 1 x USB 2.0/1.1 port on the back panel\r\nChipset:\r\n- 2 x USB 3.2 Gen 1 ports available through the internal USB header\r\n- 7 x USB 2.0/1.1 ports (3 ports on the back panel, 4 ports available through the internal USB headers)', 89.00, 5, '2026-01-15 14:20:09'),
(3, 'Matična ploča ASRock H810M-X, Intel LGA1851, Micro ATX', 'ASRock', 'LGA1851', 'Intel H810', 'Micro ATX', 'asrock-h810m-x-lga1851.jpg', 'H810M-X\r\nX Series motherboard offers a compact, high-value solution, balancing performance, versatility, and reliability for both professional and daily tasks.\r\n\r\nIntelligent Cooling Design\r\nThe first thing that catches the eye is the optimized Aluminum Heatsink Design. Heatsinks are crucial for efficient heat dissipation, especially during heavy workloads like gaming or productivity tasks. Motherboard that built with heatsinks can effectively manage thermal performance, hence ensure system stability and durability effortlessly.\r\n\r\nPolychrome RGB\r\nThis motherboard features onboard RGB headers and addressable RGB headers that allow motherboard to be connected to compatible LED devices such as strip, CPU fans, coolers, chassis and so on. Users may also synchronize RGB LED devices across the Polychrome RGB Sync-certified accessories to create their own unique lighting effects.\r\n\r\nSpecifications:\r\nCPU\r\n- Supports Intel Core Ultra Processors (Series 2) (LGA1851)\r\n- Supports Intel Hybrid Technology\r\n- Supports Intel Turbo Boost Max 3.0 Technology\r\n- Supports Intel Thermal Velocity Boost (TVB)\r\n- Supports Intel Adaptive Boost Technology (ABT)\r\n- Integrated NPU for dedicated AI acceleration\r\nChipset\r\n- Intel H810\r\nMemory\r\n- Dual Channel DDR5 Memory Technology\r\n- 2 x DDR5 DIMM Slots\r\n- Supports DDR5 non-ECC, un-buffered memory up to 6400\r\n- Supports Clocked Unbuffered DIMM (CUDIMM)\r\n- Max. capacity of system memory: 128GB\r\n- Supports Intel Extreme Memory Profile (XMP) 3.0x\r\nBIOS\r\n- 256Mb AMI UEFI Legal BIOS with GUI support\r\nGraphics\r\n- Intel Xe LPG Graphics Architecture\r\n- 1 x HDMI 2.1 TMDS/FRL 8G Compatible, supports HDR, HDCP 2.3 and max. resolution up to 4K 120Hz\r\n- 1 x DisplayPort 1.4 with DSC (compressed), supports HDCP 2.3 and max. resolution up to 8K 60Hz / 5K 120Hz\r\n- 1 x D-Sub, supports max. resolution up to Full HD (1920x1080) 60Hz\r\nAudio\r\n- 7.1 CH HD Audio (Realtek ALC897 Audio Codec)\r\nLAN\r\n- 2.5 Gigabit LAN 10/100/1000/2500 Mb/s\r\n- Dragon RTL8125BG\r\n- Supports Dragon 2.5G LAN Software\r\n- Smart Auto Adjust Bandwidth Control\r\n- Visual User Friendly UI\r\n- Visual Network Usage Statistics\r\n- Optimized Default Setting for Game, Browser, and Streaming Modes\r\n- User Customized Priority Control\r\nSlots\r\nCPU:\r\n- 1 x PCIe 4.0 x16 Slot (PCIE1), supports x16 mode\r\nChipset:\r\n- 1 x PCIe 4.0 x1 Slot (PCIE2)\r\n- 1 x M.2 Socket (Key E), supports type 2230 WiFi/BT PCIe WiFi module\r\nStorage\r\nChipset:\r\n- 1 x Hyper M.2 Socket (M2_1, Key M), supports type 2280 PCIe Gen4x4 (64 Gb/s) mode\r\n- 4 x SATA3 6.0 Gb/s Connectors\r\nUSB\r\nChipset:\r\n- 1 x USB 3.2 Gen1 Type-C (Front)\r\n- 4 x USB 3.2 Gen1 Type-A (2 Rear, 2 Front)\r\n- 6 x USB 2.0 (4 Rear, 2 Front)\r\nSoftware and UEFI\r\nSoftware\r\n- ASRock Motherboard Utility (A-Tuning)\r\n- ASRock Dragon 2.5G LAN Software\r\n- ASRock Polychrome SYNC\r\nUEFI\r\n- ASRock EZ Mode\r\n- ASRock Full HD UEFI\r\n- ASRock My Favorites in UEFI\r\n- ASRock Auto Driver Installer\r\n- ASRock Instant Flash\r\nForm Factor\r\n- Micro ATX Form Factor: 22.0 cm x 19.3 cm', 105.00, 10, '2026-01-21 23:18:50'),
(4, 'Matična ploča Asus TUF Gaming B760-Plus WiFi DDR5, Intel LGA1700, WiFi, Bluetooth, ATX', 'ASUS', 'Intel LGA1700', 'B760-Plus', 'ATX', 'b760plus.jpg', 'CPU\r\nIntel Socket LGA1700 for 14th Gen, 13th Gen & 12th Gen Intel Core Processors, Pentium Gold and Celeron Processors\r\nSupports Intel Turbo Boost Technology 2.0 and Intel Turbo Boost Max Technology 3.0\r\nMemory\r\n4 x DIMM, Max. 192GB, DDR5 7200(OC)/7000(OC)/6800(OC)/6600(OC)/6400(OC)/ 6200(OC)/ 6000(OC)/ 5800(OC)/ 5600/ 5400/5200/ 5000/ 4800 Non-ECC, Un-buffered Memory\r\nDual Channel Memory Architecture\r\nSupports Intel Extreme Memory Profile (XMP)\r\nOptiMem II\r\nGraphics\r\n1 x DisplayPort\r\n1 x HDMI port\r\nExpansion Slots\r\nIntel 13th & 12th Gen Processors\r\n1 x PCIe 5.0 x16 slot\r\nIntel B760 Chipset\r\n1 x PCIe 3.0 x16 slot (supports x4 mode)\r\n2 x PCIe 3.0 x1 slots\r\nStorage\r\nTotal supports 3 x M.2 slots and 4 x SATA 6Gb/s ports\r\nIntel 13th & 12th Gen Processors\r\nM.2_1 slot (Key M), type 2242/2260/2280 (supports PCIe 4.0 x4 mode)\r\nIntel B760 Chipset\r\nM.2_2 slot (Key M), type 2242/2260/2280/22110 (supports PCIe 4.0 x4 mode)\r\nM.2_3 slot (Key M), type 2242/2260/2280 (supports PCIe 4.0 x4 mode)\r\n4 x SATA 6Gb/s ports\r\nEthernet\r\n1 x Realtek 2.5Gb Ethernet\r\nTUF LANGuard\r\nWireless & Bluetooth\r\nWi-Fi 6\r\n2x2 Wi-Fi 6 (802.11 a/b/g/n/ac/ax)\r\nSupports 2.4/5GHz frequency band\r\nBluetooth v5.2\r\nUSB\r\nRear USB (Total 6 ports)\r\n1 x USB 3.2 Gen 2x2 port (1 x USB Type-C)\r\n1 x USB 3.2 Gen 2 port (1 x Type-A)\r\n3 x USB 3.2 Gen 1 ports (3 x Type-A)\r\n1 x USB 2.0 port (1 x Type-A)\r\nFront USB (Total 7 ports)\r\n1 x USB 3.2 Gen 2 connector (supports USB Type-C)\r\n1 x USB 3.2 Gen 1 header supports 2 additional USB 3.2 Gen 1 ports\r\n2 x USB 2.0 headers support 4 additional USB 2.0 ports\r\nAudio\r\nRealtek 7.1 Surround Sound High Definition Audio CODEC\r\n- Supports: Jack-detection, Multi-streaming, Front Panel Jack-retasking\r\n- Supports up to 24-Bit/192 kHz playback\r\nForm Factor\r\nATX Form Factor\r\n12 inch x 9.6 inch ( 30.5 cm x 24.4 cm )', 208.10, 4, '2026-01-22 14:01:42'),
(5, 'Matična ploča Gigabyte B850M Gaming X WiFi6E, AMD AM5, WiFi, Bluetooth, Micro ATX', 'Gigabyte', 'AM5', 'B850M', 'Micro ATX', 'maticna-ploca-gigabyte-b850m-gaming.jpg', 'X3D Turbo Mode\r\nX3D Turbo Mode\'s unique optimization parameters allow even Ryzen 9000 X3D gaming Performance enhance & Ryzen 9000 non-X3D processors to achieve similar gaming performance levels as their Ryzen X3D counterparts. Experience smoother gameplay, higher frame rates, and reduced latency with GIGABYTE\'s BIOS innovation- X3D Turbo Mode.\r\n\r\nComprehensive Thermal\r\nAdvanced full-metal thermal design and durable heatsinks to keep your system cool and efficient.\r\n\r\nBorn from Ultra Durable\r\nTechnology embodies our commitment to excellence, providing gamers with a platform that\'s not only powerful but also built for longevity and reliability. GAMING series motherboards are engineered to endure and excel.\r\n\r\nSpecifications:\r\nCPU\r\nAMD Socket AM5, support for:\r\nAMD Ryzen 9000 Series Processors/\r\nAMD Ryzen 8000 Series Processors/\r\nAMD Ryzen 7000 Series Processors\r\nChipset\r\nAMD B850\r\nMemory\r\nSupport for DDR5 8200(O.C) / 8000(O.C) / 7950(O.C) / 7900(O.C) / 7800(O.C) / 7600(O.C.) / 7400(O.C.) / 7200(O.C.) / 7000(O.C.) / 6800(O.C.) / 6600(O.C.) / 6400(O.C) / 6200(O.C) / 6000(O.C) / 5800(O.C) / 5600(O.C) / 5200 / 4800 / 4400 MT/s memory modules.\r\n4 x DDR5 DIMM sockets supporting up to 256 GB (64 GB single DIMM capacity) of system memory\r\nDual channel memory architecture\r\nSupport for non-ECC Un-buffered DIMM 1Rx8/2Rx8/1Rx16 memory modules\r\nSupport for AMD EXtended Profiles for Overclocking (AMD EXPO) and Extreme Memory Profile (XMP) memory modules\r\nOnboard Graphics\r\nIntegrated Graphics Processor with AMD Radeon Graphics support:\r\n- 1 x HDMI port, supporting a maximum resolution of 4096x2160@60 Hz\r\n- 2 x DisplayPorts, supporting a maximum resolution of 3840x2160@144 Hz\r\nSupport for up to triple-display at the same time\r\nAudio\r\nRealtek Audio CODEC\r\nHigh Definition Audio\r\n2/4/5.1/7.1-channel\r\nLAN\r\nRealtek 2.5GbE LAN chip (2.5 Gbps/1 Gbps/100 Mbps)\r\nWireless Communication module\r\nRealtek Wi-Fi 6E RTL8852CE\r\n- WIFI a, b, g, n, ac, ax, supporting 2.4/5/6 GHz carrier frequency bands\r\n- BLUETOOTH 5.3\r\n- Support for 11ax 160MHz wireless standard\r\nExpansion Slots\r\n1 x PCI Express x16 slot (PCIEX16), integrated in the CPU:\r\nAMD Ryzen 9000/7000 Series Processors support PCIe 5.0 x16 mode\r\nAMD Ryzen 8000 Series-Phoenix 1 Processors support PCIe 4.0 x8 mode\r\nAMD Ryzen 8000 Series-Phoenix 2 Processors support PCIe 4.0 x4 mode\r\nChipset:\r\n- 1 x PCI Express x16 slot, supporting PCIe 3.0 and running at x4 (PCIEX4)\r\nStorage Interface\r\n1 x M.2 connector (M2A_CPU), integrated in the CPU, supporting Socket 3, M key, type 25110/22110/2580/2280 SSDs:\r\nAMD Ryzen 9000/7000 Series Processors support PCIe 5.0 x4/x2 SSDs\r\nAMD Ryzen 8000 Series-Phoenix 1 Processors support PCIe 4.0 x4/x2 SSDs\r\nAMD Ryzen 8000 Series-Phoenix 2 Processors support PCIe 4.0 x4/x2 SSDs\r\n1 x M.2 connector (M2B_CPU), integrated in the CPU, supporting Socket 3, M key, type 25110/22110/2580/2280 SSDs:\r\nAMD Ryzen 9000/7000 Series Processors support PCIe 4.0 x4/x2 SSDs\r\nAMD Ryzen 8000 Series-Phoenix 1 Processors support PCIe 4.0 x4/x2 SSDs\r\nAMD Ryzen 8000 Series-Phoenix 2 Processors support PCIe 4.0 x2 SSDs\r\n4 x SATA 6Gb/s connectors\r\nRAID 0, RAID 1, RAID 5, and RAID 10 support for NVMe SSD storage devices\r\nRAID 0, RAID 1, and RAID 10 support for SATA storage devices\r\nUSB\r\nCPU:\r\n- 1 x USB Type-C port on the back panel, with USB 3.2 Gen 2 support\r\n- 1 x USB 3.2 Gen 2 Type-A port (red) on the back panel\r\nCPU+USB 2.0 Hub:\r\n- 4 x USB 2.0/1.1 ports on the back panel\r\nChipset:\r\n- 1 x USB Type-C port with USB 3.2 Gen 2 support, available through the internal USB header\r\n- 4 x USB 3.2 Gen 1 ports (2 ports on the back panel, 2 ports available through the internal USB header)\r\n- 4 x USB 2.0/1.1 ports available through the internal USB headers\r\nForm Factor\r\nMicro ATX Form Factor; 24.4cm x 24.4cm', 215.50, 10, '2026-01-22 14:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Processing',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `full_name`, `address`, `city`, `postal_code`, `country`, `payment_method`, `total_price`, `status`, `created_at`) VALUES
(1, 16, 'Petar Orešković', 'Emilija Laszowskog 33', 'Velika Gorica', '10410', 'Croatia', 'card', 970.00, 'Processing', '2026-01-21 19:01:59'),
(2, 11, 'Antonio Ljevar', 'Vrbik 25', 'Zagreb', '10000', 'Croatia', 'card', 299.00, 'Processing', '2026-01-21 19:09:15'),
(3, 16, 'Petar Orešković', 'Antoloviceva', 'Velika Gorica', '10410', 'Croatia', 'card', 299.00, 'Processing', '2026-01-21 19:11:06'),
(4, 16, 'Petar Orešković', 'Turopoljska 15', 'Velika Gorica', '10410', 'Croatia', 'card', 99.00, 'Processing', '2026-01-22 00:08:08');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `component_type` varchar(50) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `component_type`, `component_id`, `name`, `price`, `quantity`) VALUES
(1, 1, 'cpu', 1, 'AMD Ryzen 5 7500F', 299.00, 1),
(2, 1, 'ram', 1, 'Crucial CT16G48C40U5, 16GB, DDR5 4800MHz, CL40', 272.00, 1),
(3, 1, 'gpu', 1, 'Grafička Gigabyte GeForce RTX3060 Windforce OC, 12GB GDDR6', 399.00, 1),
(4, 2, 'cpu', 1, 'AMD Ryzen 5 7500F', 299.00, 1),
(5, 3, 'cpu', 1, 'AMD Ryzen 5 7500F', 299.00, 1),
(6, 4, 'cpu', 8, 'Procesor Intel Core i3-12100F (4C/8T, up to 4.3GHz, 12MB, LGA1700), BX8071512100F', 99.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pc`
--

CREATE TABLE `pc` (
  `id` int(11) NOT NULL,
  `cpu` varchar(100) NOT NULL,
  `ram` varchar(100) NOT NULL,
  `gpu` varchar(100) NOT NULL,
  `mbo` varchar(100) NOT NULL,
  `storage` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `price` decimal(50,0) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `stock` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pc`
--

INSERT INTO `pc` (`id`, `cpu`, `ram`, `gpu`, `mbo`, `storage`, `name`, `brand`, `price`, `image`, `description`, `stock`) VALUES
(1, 'AMD Ryzen 7 9800X3D', '32GB DDR5', 'AMD Radeon RX 9070 XT 16GB', 'AMD B850', '1TB SSD', 'Računalo EPOCH Gaming PC Dorado / Ryzen 7 9800X3D, 32GB DDR5, 1TB SSD NVMe, AMD Radeon RX 9070 XT 16', 'EPOCH', 3000, 'epoch.pc.jpg', 'EPOCH DORADO - IZVRSNE PERFORMANSE ZA GAMING I KREATIVNI RAD\r\nRačunalo Epoch Dorado pruža vrhunske performanse i napredne tehnologije u elegantnom kućištu, savršeno za gamere, kreatore sadržaja i profesionalce. S procesorom AMD Ryzen 7 9800X3D, 32 GB DDR5 RAM-a, 1 TB NVMe SSD-om te AMD Radeon RX 9070 XT grafičkom karticom s 16 GB GDDR6 memorije, ovo računalo nudi nevjerojatnu snagu i responzivnost za sve zadatke, uz predinstalirani Windows 11 operativni sustav za dodatnu praktičnost.\r\n\r\nAMD RYZEN 7 9800X3D - OPTIMALNA SNAGA I UČINKOVITOST\r\nPogonska snaga ovog sustava je AMD Ryzen 7 9800X3D procesor, koji se odlikuje osam jezgri i šesnaest niti. Ovaj procesor pruža visoke performanse za gaming, multitasking i zahtjevne profesionalne aplikacije, uz izuzetnu energetsku učinkovitost zahvaljujući naprednoj Zen 4 arhitekturi.\r\n\r\n32 GB DDR5 RAM-A - BESPRIJEKORAN MULTITASKING\r\nUz 32 GB DDR5 memorije, Epoch Dorado osigurava glatko i responzivno izvođenje više aplikacija istovremeno. DDR5 tehnologija omogućuje veću brzinu prijenosa podataka, stabilnost i energetsku učinkovitost, pružajući najbolje moguće iskustvo rada i igranja.\r\n\r\n1 TB NVMe SSD - BRZINA I DOVOLJNO PROSTORA\r\nOpremljen 1 TB NVMe SSD-om, ovaj sustav omogućuje iznimno brzo pokretanje sustava, aplikacija i igara. SSD nudi dovoljno prostora za pohranu svih vaših igara, multimedijskih sadržaja i važnih dokumenata, uz dodatnu pouzdanost i tihi rad.\r\n\r\nAMD RADEON RX 9070XT - VRHUNSKA GRAFIKA ZA GAMING I KREACIJU\r\nS AMD Radeon RX 9070XT grafičkom karticom s 16 GB GDDR6 memorije, Epoch Dorado pruža izuzetne grafičke performanse. Ova kartica podržava tehnologije poput ray tracinga i FidelityFX, osiguravajući realistično osvjetljenje, nevjerojatnu kvalitetu slike i glatke performanse za najzahtjevnije igre i grafičke zadatke.\r\n\r\nBEŽIČNA POVEZIVOST I RAZNOVRSNI PRIKLJUČCI\r\nS ugrađenim Wi-Fi modulom, Epoch Dorado nudi stabilnu i brzu mrežnu vezu za online igranje, streaming i produktivnost. Osim toga, raznovrsni priključci, uključujući USB-C, USB 3.2, HDMI i DisplayPort, omogućuju lako povezivanje periferne opreme i višestrukih monitora.\r\n\r\nWINDOWS 11 - INTUITIVNO I FUNKCIONALNO SUČELJE\r\nPredinstalirani Windows 11 operativni sustav pruža intuitivno korisničko iskustvo i napredne sigurnosne značajke. S modernim sučeljem i podrškom za najnovije aplikacije, Windows 11 omogućuje maksimalnu produktivnost i uživanje u igrama i sadržajima.\r\n\r\nMODERAN DIZAJN I OPTIMALNO HLAĐENJE\r\nCrno kućište modernog dizajna savršeno se uklapa u svaki prostor. Pametno osmišljeno hlađenje osigurava optimalne radne temperature, čak i pri maksimalnom opterećenju, čineći sustav tihim i pouzdanim.\r\n\r\nZAKLJUČAK\r\nEpoch Dorado kombinira snažne performanse, naprednu grafiku i intuitivno korisničko iskustvo, čineći ga idealnim za gamere i profesionalce. S AMD Ryzen 7 9800X3D procesorom, 32 GB DDR5 RAM-a, 1 TB NVMe SSD-om i AMD Radeon RX 9070XT grafičkom karticom, ovo računalo pruža nevjerojatnu snagu i fleksibilnost. Predinstalirani Windows 11 i moderni dizajn čine ga savršenim izborom za sve koji traže pouzdan i moćan sustav za rad, igru i zabavu.', 3),
(2, 'R5 7500F', '16GB (1×16GB) 5600 MHz', 'Nvidia GeForce RTX 5060, 8 GB GDDR7', 'AM5', '1TB SSD (M.2 NVMe)', 'Anni Gaming PC, R5 7500F, SSD1TB, 16GB, RTX5060, DOS (ATPII-G8-1279)', 'Anni', 1350, 'annigamingpc.jpg', 'Stolno računalo Gamer Advanced pruža besprijekorne performanse za rad, pokrećući čak i najzahtjevnije programe, poput videoigara. Također će vas impresionirati prekrasnim dizajnom kućišta s RGB osvjetljenjem.\r\n\r\n\r\nPokreće ga 6-jezgreni AMD Ryzen 5 7500F procesor, a zasebna grafička kartica Nvidia RTX 5060 pružit će besprijekorno renderiranje grafike.\r\n\r\n\r\nIzvrsnu responzivnost i multitasking omogućit će DDR5 radna memorija kapaciteta 16 GB, koja će uz pomoć munjevito brzog SSD diska kapaciteta 1 TB osigurati izvrsnu responzivnost instaliranih igara i programa.', 3),
(3, 'Ryzen 7 9800X3D', 'KINGSTON Fury 64 GB (2 × 32 GB) ', 'Radeon RX 9070 XT 16GB GDDR6', 'ASUS TUF GAMING B650-Plus', 'SAMSUNG 990 EVO Plus 2 TB M.2 PCIe 5.0 NVMe', 'UVI Omega AM97X PC, Ryzen 7 9800X3D, RX 9070 XT, 64GB, 2TB, W11H', 'UVI Omega', 2499, 'omegaam93xpc.jpg', 'Dobro dizajnirano PC dodaje drugačiju dinamiku vašem svakodnevnom računalnom iskustvu. S AMD Ryzen 7 9800X3D procesorom i Radeon RX 9070 XT grafikom, pruža vam snagu koja vam je potrebna.\r\n\r\nUVI PC osigurava izniman protok zraka sa svih strana kućišta. Svjež, ohlađen zrak uvijek je dostupan za moderne, energetski intenzivne komponente, omogućujući optimalno hlađenje i stabilnost sustava čak i pod najvećim opterećenjima.Elegantno obojeno kućište daje izgled elegancije koji će vas uvijek istaknuti.\r\n\r\nOpremljen je modernim USB priključkom s podrškom za spajanje na dodatni uređaj i za napajanje uređaja. Osim toga, tu je i HDMI priključak pomoću kojeg možete spojiti dodatni monitor za učinkovitiji rad.Podaci će se pohranjivati na 2 TB SSD disku, koji će, u kombinaciji sa 64 GB RAM-a, osigurati munjevito brz i besprijekoran multitasking. Uređaj koristi Windows 11 Home.\r\n\r\nIzvrstan izbor **za ozbiljne igrače i kreativce kojima su potrebne visoke performanse za rad i igru. Sustav pruža glatke performanse i sirovu snagu potrebnu za najzahtjevnije zadatke.', 2),
(4, 'Intel® Core™ Ultra 5 225F (10 jezgri, 10 niti, Max Turbo do 4,9 GHz)', '32 GB DDR5 (2× 16 GB, 6000 MHz)', 'Nvidia GeForce RTX 5060 Ti, 8 GB GDDR7', 'Intel H810', '2TB SSD (M.2 NVMe)', 'Anni Gaming PC, Ultra 5 225F, SSD2TB, 32GB, RTX5060 Ti, DOS (ATPII-G8-1249)', 'Anni', 2055, 'ammo2pc.jpg', 'Stolno računalo Gamer Advanced pruža besprijekorne performanse za rad i pokreće čak i najzahtjevnije programe, poput videoigara. Također će vas impresionirati svojim prekrasnim dizajnom kućišta s RGB osvjetljenjem.\r\n\r\n\r\nPokreće ga 10-jezgreni Intel® Core™ Ultra 5 225F procesor, a zasebna grafička kartica Nvidia RTX 5060 Ti pružit će besprijekorno renderiranje grafike.\r\n\r\n\r\nIzvrsnu responzivnost i multitasking omogućit će DDR5 radna memorija kapaciteta 32 GB, koja će uz pomoć munjevito brzog SSD diska kapaciteta 2 TB osigurati izvrsnu responzivnost instaliranih igara i programa.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `psu`
--

CREATE TABLE `psu` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `power_w` int(11) NOT NULL,
  `efficiency` varchar(20) NOT NULL,
  `modular` varchar(10) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `psu`
--

INSERT INTO `psu` (`id`, `name`, `brand`, `power_w`, `efficiency`, `modular`, `image`, `description`, `price`, `stock`, `created_at`) VALUES
(2, 'Napajanje White Shark GPSU-W500F Captain 3, 500W, 80+, RGB, ATX', 'White Shark', 500, '80 PLUS standard', 'No', 'whiteshark.psu.500w.jpeg', 'Izlazna snaga (mW): 500 W\r\nDimenzije ventilatora (mm): 120 - RGB\r\nTežina (g): 1244\r\nDimenzije (mm): 140x150x85\r\nKonektori: 24 x 1, 4/8 x 1, SATA x 6, MOLEX x 4, PCI-E 6/8 x 2\r\nTip: ATX / Nije modularno\r\nBoja: Crna\r\nMaterijal: Metal\r\nEfikasnost: 80 PLUS standard\r\nSigurnosne značajke: OVP, SCP, OPP, SIP, UVP\r\nDuljina napajanja (mm): 140\r\nStruja na 12V / 5V / 3.3V: 35A/16A/16A\r\nLežaj ventilatora: Hidraulični\r\nDC - DC : Da', 40.00, 10, '2026-01-15 17:47:10'),
(3, 'Napajanje Zalman ZM500-TXII, 500W, 80+, ATX', 'Zalman', 500, '80PLUS STANDARD', 'No', 'napajanje-zalman-500w-psu-txii-series-re-zal-zm500-txii_1.jpg', 'Model MegaMax [500W] ZM500-TXII\r\n80PLUS STANDARD Power Supply\r\nEfficiency Max 86% @ 220VAC, Typical Load\r\nMTBF 100,000Hours\r\nOperating Temperature 10~45 ?\r\nPFC Active PFC 98%\r\nRegulatory KC, CE, CB, RoHS, EAC\r\nType Intel ATX 12V Ver2.31\r\nProtection OPP/OVP/UVP/SCP\r\nInput Voltage 200-240 VAC\r\nInput Current 4A\r\nInput Frequency 50-60Hz\r\nFan Size 120mm\r\nRated Speed 2,000RPM\r\nFan Bearing Hydro-Dynamic Bearing\r\nCables (Connector) Mainboard Cable\r\nCPU Cable (COnnector 2EA)\r\nPCI Express Cable ( Connector 2EA)\r\nS-ATA Cable 2EA (Connector 3EA)\r\nPeripheral FDD +\r\nPeripheral IDE (Connector 3EA)', 60.00, 3, '2026-01-22 13:57:38'),
(4, 'Napajanje Corsair RM650e, 650W, 80+ Gold, modularno, ATX', 'Corsair', 650, '80+ Gold', 'Yes', 'napajanje-corsair-rm650e-2025-650watx-31-pcie-51-cybenetics--18449-cp-9020302-eu.jpg', 'FULLY MODULAR CABLING\r\nKeep cable clutter down by connecting only the cables your system needs. A native 12V-2x6 GPU connector and multiple 8-pin PCIe connectors mean RMe power supplies more than meet the needs of modern and upcoming GPUs and CPUs.\r\n\r\nATX 3.1 CERTIFIED\r\nThe ATX 3.1 standard demands a high level of reliability and power efficiency. While many CORSAIR PSUs meet these requirements, RMe Series PSUs are formally certified for ATX 3.1 compliance.\r\n\r\nLOW NOISE OPERATION IN A COMPACT SIZE\r\nA compact 140mm-long casing ensures an easy fit in modern enthusiast PC cases. A 120mm rifle bearing fan with a specially calculated fan curve keeps fan noise down, even when operating at full load.\r\n\r\nSpecifications:\r\nCybenetics Efficiency: Platinum\r\nCybenetics Noise: A++\r\nATX Connector: 1\r\nATX12V Version: 3.1.2025. 0:00:00\r\nCable Type: Type 4\r\nContinuous Power W: 650 Watts\r\nEPS Connector: 2\r\nMTBF Hours: 100,000 hours\r\nSATA Connector: 6\r\nPATA Connector: 2\r\nModern Standby: Yes\r\nDimensions: 140x150x86\r\nModular: Fully\r\nPCIe Connector: 3\r\nZero RPM Mode: Yes', 125.20, 7, '2026-01-22 13:59:05'),
(5, 'Napajanje MSI MPG A850GS PCIe5, 850W, 80+ Gold, modularno, ATX', 'MSI', 850, '80+ Gold', 'Yes', 'napajanje-msi-mpg-a850gs-pcie5-850w-80-gold-modularno-atx-89134-mpg_a850gs_pcie5.jpg', 'Dual-Native 12V-2X6 Connector\r\nThis power supply stands as a cornerstone for powering advanced computinng environments. Whether you\'re training machine learning models or image processing, this PCU ensures stability and performance without compromise.\r\n\r\nMidnight Sound Level\r\nThis power supply is designed for quiet operation, delivering low noise levels like in the midnight, ensuring a serene computing experience free from disturbances.\r\n\r\nFluid Dynamic Bearing\r\nThis power supply\'s comes with 135mm fan sports a fluid bearing, chosen to increase the life span of the fan while maintaining low noise level.\r\n\r\nSpecifications:\r\nEfficiency Rating 80 PLUS Gold (up to 90%)\r\nModular Yes (full modular)\r\nFan Size 135 mm\r\nFan Bearing Fluid Dynamic Bearing\r\nDimensions (DxWxH) 150 x 150 x 86 mm\r\nPFC Type Active PFC\r\nInput Voltage Range 100-240V\r\nPower Watt 850W\r\nPower Excursion 1700W (*up to 200% of the PSU\'s rated power for 100µs)\r\nInput Frequency Range 50-60 Hz\r\nProtection OCP/ OTP/ OPP/ SCP/ OVP/ UVP/ SIP/ NLO\r\nATX (24 pin) 1\r\nEPS (4+4 pin) 2\r\nPCI-E 5.1 (16 pin) 1 (600W)\r\nPCI-E (6+2 pin) 3\r\nSATA (15 pin) 8\r\nPERIPHERAL (4 pin) 4', 130.00, 12, '2026-01-22 14:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `ram`
--

CREATE TABLE `ram` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `capacity_gb` int(8) NOT NULL,
  `type` varchar(50) NOT NULL,
  `speed_mhz` int(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `stock` int(5) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ram`
--

INSERT INTO `ram` (`id`, `name`, `brand`, `capacity_gb`, `type`, `speed_mhz`, `price`, `image`, `description`, `stock`, `created_at`) VALUES
(1, 'Crucial CT16G48C40U5, 16GB, DDR5 4800MHz, CL40', 'Crucial', 16, 'DDR5', 4800, 272.00, 'crucial.ct16g4.jpg', 'Extreme innovation for stable performance\r\nCrucial DDR5 takes an extreme step forward in engineering over the previous generation with two independent 32-bit channels per module for optimized performance. Designed with on-die ECC (ODECC) at the component level for long-term stability, Crucial DDR5 is engineered to maintain the same reliability as the previous generation, even with the rigorous demands of next-gen computing\r\n\r\nMicron quality – tested reliability you can trust\r\nAs the vertically integrated consumer brand of Micron, Crucial is trusted by millions for reliability, performance, and compatibility. Unlike module assemblers, our unique relationship with Micron involves a deeper level of engineering collaboration to squeeze every ounce of performance from our products without compromising reliability.\r\n\r\nFaster load times and file transfers\r\nCrucial DDR5 Desktop Memory can empower your computer to transfer up to 50% more data than DDR4 at launch, resulting in faster load times, file transfers, downloads, refresh rates and less lag time5. Due to higher bus efficiency, DDR5 technology is not just faster than the previous generation, it’s better\r\n\r\nSpecifications\r\nTechnology - DDR5\r\nSpeed - DDR5-4800\r\nPC speed - PC5-38400\r\nDensity - 16GB\r\nModule type - UDIMM\r\nDIMM type - Unbuffered\r\nCAS latency - 40\r\nExtended timings - 40-39-39\r\nVoltage - 1.1V', 3, '2026-01-13 18:10:19'),
(4, 'Memorija Kingston Fury Beast Black RGB Expo, 32GB (2x16GB), DDR5 6000MHz, CL36', 'Kingston', 32, '(2x16GB), DDR5', 6000, 699.00, 'memorija-kingston-fury-beast-black-rgb.jpg', 'Kingston FURY KF560C36BBE2AK2-32 is a kit of two 2G x 64-bit (16GB) DDR5-6000 CL36 SDRAM (Synchronous DRAM) 1Rx8, memory module, based on eight 2G x 8-bit FBGA components per module. Each module kit supports AMD EXPO v1.1 and Intel Extreme Memory Profiles (Intel XMP) 3.0. Total kit capacity is 32GB. Each module has been tested to run at DDR5-6000 at a low latency timing of 36-44-44 at 1.35V. The SPDs are programmed to JEDEC standard latency DDR5-4800 timing of 40-39-39 at 1.1V. Each 288-pin DIMM uses gold contact fingers. The JEDEC standard electrical and mechanical specifications are as follows:\r\n\r\nSpecifications:\r\nPower Supply: VDD = 1.1V Typical\r\nVDDQ = 1.1V Typical\r\nVPP = 1.8V Typical\r\nVDDSPD = 1.8V to 2.0V\r\nOn-Die ECC\r\nHeight 1.66” (42.23mm), w/heatsink\r\nDefault (JEDEC): DDR5-4800 CL40-39-39 @1.1V\r\nEXPO Profile #0: DDR5-6000 CL36-44-44 @1.35V\r\nEXPO Profile #1: DDR5-5600 CL40-40-40 @1.25V\r\nXMP Profile #1: DDR5-6000 CL36-44-44 @1.35V\r\nXMP Profile #2: DDR5-5600 CL40-40-40 @1.25V', 6, '2026-01-22 13:51:12'),
(5, 'Memorija G.Skill Aegis, 32GB (2x16GB), DDR4 3000MHz, CL16', 'G.Skill', 32, '(2x16GB), DDR4', 3000, 295.25, 'memorija-gskill-aegis-32gb-2x16gb-ddr4-3-ramgsk021_1.jpg', 'Named after the powerful shield of Greek gods, Aegis symbolizes strength and power. This new addition of DDR4 memory to the AEGIS family of gaming memory is designed for upgraded performance and high stability on the latest PC gaming systems. Give the quality performance boost your gaming rig deserves, no matter the game. Whether it’s FPS, RTS, MOBA, or MMORPG, let AEGIS Gaming DDR4 Memory be the strength of your gaming arsenal!\r\n\r\nThe Ideal Solution for Gaming PCs\r\nNamed after the powerful shield of Greek gods, Aegis symbolizes strength and power. This new addition of DDR4 memory to the AEGIS family of gaming memory is designed for upgraded performance and high stability on the latest PC gaming systems. Give the quality performance boost your gaming rig deserves, no matter the game. Whether it’s FPS, RTS, MOBA, or MMORPG, let AEGIS Gaming DDR4 Memory be the strength of your gaming arsenal!\r\n\r\nBuilt for Quality\r\nBuilt with the highest quality of hand-selected ICs and tested with G.SKILL\'s rigorous validation process on all major performance motherboard brands, the AEGIS Gaming DDR4 Memory is designed for the best compatibility and stability the widest selection of motherboards.\r\n\r\nSpecifications:\r\nMemory Type DDR4\r\nCapacity 32GB (16GBx2)\r\nMulti-Channel Kit Dual Channel Kit\r\nTested Speed (XMP) 3000 MT/s\r\nTested Latency (XMP) 16-18-18-38\r\nTested Voltage (XMP) 1.35V\r\nRegistered/Unbuffered Unbuffered\r\nError Checking Non-ECC\r\nSPD Speed (Default) 2133 MT/s\r\nSPD Voltage (Default) 1.20V\r\nFeatures Intel XMP 2.0 (Extreme Memory Profile) Ready', 6, '2026-01-22 13:52:32'),
(6, 'Memorija G.Skill Ripjaws V Black, 16GB (2x8GB), DDR4 3200MHz, CL16', 'G.Skill', 16, '(2x8GB), DDR4', 3200, 155.00, 'memorija-gskill-ripjaws-v-black-16gb-2x8-ramgsk026_1.jpg', 'Blazing Fast Transfer Speed\r\nAvailable in a wide range of frequency options, Ripjaws V lets you enjoy a computing experience at DDR4 speeds for gaming, video & image editing, rendering, and data processing.\r\n\r\nRigorously Tested for Compatibility and Reliability\r\nEach and every Ripjaws V DDR4 memory kit is tested with G.SKILL\'s rigorous validation process on major performance motherboard brands to ensure the best-in-class reliability and compatibility across a wide selection of motherboards.\r\n\r\nXMP 2.0 Support\r\nJust set and go. Programmed with the latest Intel XMP 2.0 profiles, the only thing between you and overclocked performance is a simple BIOS setting.\r\n\r\nSpecifications:\r\nMemory Type DDR4\r\nCapacity 16GB (8GBx2)\r\nMulti-Channel Kit Dual Channel Kit\r\nTested Speed (XMP) 3200 MT/s\r\nTested Latency (XMP) 16-18-18-38\r\nTested Voltage (XMP) 1.35V\r\nRegistered/Unbuffered Unbuffered\r\nError Checking Non-ECC\r\nSPD Speed (Default) 2133 MT/s\r\nSPD Voltage (Default) 1.20V\r\nFeatures Intel XMP 2.0 (Extreme Memory Profile) Ready', 6, '2026-01-22 13:53:20');

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `capacity_gb` int(11) NOT NULL,
  `interface` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`id`, `name`, `brand`, `type`, `capacity_gb`, `interface`, `image`, `description`, `price`, `stock`, `created_at`) VALUES
(1, 'Hard disk Seagate Barracuda (3.5\", 8TB, SATA3 6Gb/s, 256MB Cache, 5400rpm)', 'Seagate ', 'HDD', 8000, 'SATA', 'seagate.hdd.8tb.jpg', 'Device Type: Hard drive - internal\r\nCapacity: 8 TB\r\nForm Factor: 3.5\"\r\nInterface: SATA 6Gb/s\r\nBuffer Size: 256 MB\r\nBytes per Sector: 4096\r\nFeatures: Native Command Queuing (NCQ), PIO mode 0-4 support, Multi-Word DMA mode 0-2 support, Ultra DMA Mode 0-6 support, Hot-Plug Support, Worldwide Name (WWN), TGMR recording technology, S.M.A.R.T.\r\nPerformance\r\nDrive Transfer Rate: 600 MBps (external)\r\nInternal Data Rate: 190 MBps\r\nAverage Latency: 6 ms\r\nReliability\r\nNon-Recoverable Errors: 1 per 10^15\r\nLoad / Unload Cycles: 600,000\r\nExpansion & Connectivity\r\nInterfaces: 1 x SATA 6 Gb/s\r\nCompatible Bay: 3.5\"', 300.00, 4, '2026-01-21 22:53:51'),
(2, 'SSD Kingston KC3000, 512GB, M.2 NVMe PCIe Gen4, R7000/W3900', 'Kingston', 'SSD', 512, 'M.2 NVMe PCIe Gen4', 'kingston-kc3000-nvme-512gbr7000-w3900-m2-king-kc3000-512g_1.jpg', 'Kingston KC3000 PCIe 4.0 NVMe M.2 SSD delivers next-level performance using the latest Gen 4x4 NVMe controller and 3D TLC NAND. Upgrade the storage and reliability of your system to keep up with demanding workloads and experience better performance with software applications such as 3D rendering and 4K+ content creation. With formidable speeds up to 7,000MB/s read, 3,900MB/s write, it ensures improved workflow in high-performance desktop and laptop PCs making it ideal for power users who require the fastest speeds on the market.\r\n\r\nThe compact M.2 2280 design fits seamlessly into motherboards and gives greater flexibility where high-power users appreciate responsiveness and superior loading times.\r\n\r\nSpecifications:\r\nForm factor M.2 2280\r\nInterface PCIe 4.0 NVMe\r\nCapacities 512GB\r\nController Phison E18\r\nNAND 3D TLC\r\nSequential read/write 1024GB – 7,000/3,900MB/s\r\nMTBF 1,800,000 hours', 179.00, 10, '2026-01-22 14:05:38'),
(3, 'SSD Crucial BX500, 2.5\", 240GB, SATA3 6Gb/s, R540/W500', 'Crucial', 'SSD', 240, 'SATA3', 'bx500.jpg', 'Ever wonder why your phone responds faster than your computer? It\'s because your phone runs on flash memory. Add flash to your laptop or desktop computer with the Crucial BX500 SSD, the easiest way to get all the speed of a new computer without the price. Accelerate everything.\r\n\r\nImprove Performance\r\nBoot up faster. Load files quicker. Improve overall system responsiveness for all your computing needs.\r\n\r\nTools for Easy Installation\r\nOur simple instructions, cloning software, and how-to videos make installation straightforward! Millions of people have upgraded with a Crucial SSD.\r\n\r\nSpecifications:\r\nDevice Location: Internal\r\nForm Factor: 2.5\"\r\nCapacity: 240 GB\r\nSupports Data Channel: SATA III-600\r\nExternal Data Bit Rate: 6 Gbps\r\nMemory Technology: NAND Flash\r\nExternal Color: Black\r\nMaximum Sequential Read Rate: 540 MB/s\r\nMaximum Sequential Write Rate: 500 MB/s\r\nSATA III Interface Quantity: 1\r\nMean Time Between Failures: 15000000 hr\r\nSolid State Drive Features: S.M.A.R.T.TRIM Support\r\nMaximum Operating Ambient Temperature: 70 °C\r\nMinimum Operating Ambient Temperature: 0 °C\r\nMaximum Non-Operating Ambient Temperature: 85 °C\r\nMinimum Non-Operating Ambient Temperature: -40 °C', 68.99, 14, '2026-01-22 14:06:46'),
(4, 'Hard disk WD Black (3.5\", 10TB, SATA3 6Gb/s, 512MB Cache, 7200rpm)', 'WD', 'HDD', 10000, 'SATA3', 'wd35.jpg', 'Drive Your Game\r\nThe WD_BLACK HDD is the perfect storage solution for your gaming rig, offering large cache sizes plus large capacities to store your favorite titles and their downloadable content (DLC). Paired with an SSD, the powerful drive delivers exceptional system performance and capacity.\r\n\r\nStore More, Play More\r\nWith capacities up to 10TB, WD_BLACK Gaming Hard Drives let you download the latest AAA titles while also keeping your ever-growing catalog of classics and favorites ready to play. Don\'t compromise on your game collection. Store more and game more with WD_BLACK.\r\n\r\nBattle-Tested Dual Processor\r\nWhen it comes to processing power, more is better for loading today\'s larger games. The WD_BLACK Gaming Hard Drive features a dual-core processor that offers twice the processing capability as a single-core processor to maximize drive performance for geting into the game faster.\r\n\r\nSpecifications:\r\nCapacity 10TB\r\nForm Factor 3.5-Inch\r\nConnector SATA\r\nInterface SATA\r\nTransfer Rate up to 267MB/s\r\nDisk Speed (RPM) 7200 RPM\r\nRecording Technology CMR\r\nCache Size 512MB\r\nDimensions (L x W x H) 147mm x 101.6mm x 26.1mm', 516.30, 12, '2026-01-22 14:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `username`, `email`, `password`, `country`, `city`, `address`, `zip`, `admin`) VALUES
(11, 'Antonio', 'Ljevar', 'toni1', 'aljevar@gmail.com', '$2y$10$9O4qKOpo8azAAtA38rSEOu6F8/OgieZBYBIXmrnUbzTvosUwQktkq', 'Croatia', 'Zagreb', 'Vrbik 25', '10000', 0),
(16, 'Petar', 'Orešković', 'admin', 'poreskovi@tvz.hr', '$2y$10$Pp3KNKoAZyNKyn44gWOHz.MTeMPlF64jUpkCf/lpMvCIz6P0wxD42', 'Croatia', 'Velika Gorica', 'Turopoljska 15', '10410', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cart_item` (`cart_id`,`component_type`,`component_id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cooling`
--
ALTER TABLE `cooling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cpu`
--
ALTER TABLE `cpu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gpu`
--
ALTER TABLE `gpu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `motherboards`
--
ALTER TABLE `motherboards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `psu`
--
ALTER TABLE `psu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cooling`
--
ALTER TABLE `cooling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cpu`
--
ALTER TABLE `cpu`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gpu`
--
ALTER TABLE `gpu`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `motherboards`
--
ALTER TABLE `motherboards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pc`
--
ALTER TABLE `pc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `psu`
--
ALTER TABLE `psu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ram`
--
ALTER TABLE `ram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `userID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cartID` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
