<?php require_once('database.php');?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<script>

    function showCities(str) {
        if(str.length == 0){
            document.getElementById("cityHint").innerText = "";
            return;
        } else {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200){
                    document.getElementById("cityHint").innerHTML = this.responseText;
                }

            };
            xmlhttp.open("GET", "getcity.php?q=" + str, true);
            xmlhttp.send();
        }

    }


    function showClubs(str) {
        if(str.length == 0){
            document.getElementById("clubHint").innerText = "";
            return;
        } else {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200){
                    document.getElementById("clubHint").innerHTML = this.responseText;
                }

            };
            xmlhttp.open("GET", "getclub.php?q=" + str, true);
            xmlhttp.send();
        }

    }



</script>

<?php

$stmt = $database->conn->prepare('SELECT * FROM country');
$stmt->execute();

$result = $stmt->setFetchMode(PDO::FETCH_OBJ);

$row = $stmt->fetchAll();



?>

<div style="width: 400px;">
    <form action="">
        <fieldset>
            <legend>Search</legend>

            <select name="country" id="country" onchange="showCities(this.value)">
                <option value="">Select a country</option>
                <?php foreach ($row as $country) {
                    ?>
                    <option value="<?php echo $country->country_name?>"><?php echo $country->country_name?></option>
                    <?php
                }
                ?>

            </select>

            <br>
            <br>

            <div id="cityHint"></div>

            <br>
            <br>

            <div id="clubHint"></div>



        </fieldset>
    </form>
</div>
</body>
</html>