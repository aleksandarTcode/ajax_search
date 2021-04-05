<?php
require_once ("database.php");
$country_name = $_GET['q'];

$stmt = $database->conn->prepare("SELECT city_name,id FROM city WHERE country_name = ?");
$stmt->execute(array($country_name));
$result = $stmt->setFetchMode(PDO::FETCH_OBJ);
$row_cities = $stmt->fetchAll();

?>


    <select name="" id="" onchange="showClubs(this.value)">
        <option value="">Select a city</option>
<?php
foreach ($row_cities as $city){
    ?>
    <option value="<?php echo $city->id; ?>">
        <?php
    echo $city->city_name;
    ?>
        </option>
        <?php
}
?>
    </select>
