<?php
require_once ("database.php");
$city_id = $_GET['q'];

$stmt = $database->conn->prepare("SELECT * FROM clubs WHERE id_city= ?");
$stmt->execute(array($city_id));
$result = $stmt->setFetchMode(PDO::FETCH_OBJ);
$row_clubs = $stmt->fetchAll();


if($stmt->rowCount()!== 0) {
?>
 <table border="solid">
     <thead>
       <tr>
         <th>Club</th>
         <th>Stadium</th>
         <th>Found Year</th>
         <th>Nick</th>
       </tr>
     </thead>

     <?php
     foreach ($row_clubs as $club){
         ?>
         <tbody>
         <tr>
             <td><?php echo $club->club_name ?></td>
             <td><?php echo $club->stadium ?></td>
             <td><?php echo $club->year_of_foundation ?></td>
             <td><?php echo $club->nick ?></td>
         </tr>
         </tbody>
     <?php
     }

     ?>
   </table>

    <?php
} else echo "No results";
?>


