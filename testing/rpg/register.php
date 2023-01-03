<?php include "db.php";

function returnQuery($query) {
  global $connection;
  return mysqli_query($connection, $query);
};

if (isset($_POST['create'])) {
  $heroClass = (int)$_POST['create-class']; // Converting to number
  $name = $_POST['create-name'];
  $age = $_POST['create-age'];
  $health = $_POST['create-health'];
  $damage = $_POST['create-damage'];
  $weapon = $_POST['create-weapon'];

  // Creates db entry from form
  $insertQuery = "INSERT INTO heroes(
              class_id,
              name,
              age,
              health,
              damage,
              weapon
              )
              VALUES(
                ('$heroClass'),
                ('$name'),
                ('$age'),
                ('$health'),
                ('$damage'),
                ('$weapon')
              )";

  // Looks / counts for any duplicates
  $queryDuplicate = "SELECT COUNT(1)
                      FROM heroes
                      WHERE name = ('$name')";

  $duplicates = mysqli_fetch_assoc(returnQuery($queryDuplicate));
  if ($duplicates['COUNT(1)']) {
    echo "Duplicate entry blocked!";
  } else {
    echo 'New entry added!';
    returnQuery($insertQuery);
  }
  
} else {
  echo 'no submit detected';
};

// Reading row
if (isset($_POST['find'])) {
  $findName = $_POST['find-name'];
  $findHeroQuery = returnQuery(
    "SELECT
	    name,
      classes.class_type AS class,
      age,
      health,
      damage,
      weapon
    FROM heroes
    INNER JOIN classes
    ON heroes.class_id = classes.class_id
    WHERE name = ('$findName')"
  );
} else {
  echo "<br> No Search detected.";
};

// Updating form
if (isset($_POST['update'])) {
  $heroClass = (int)$_POST['update-class']; // Converting to number
  $oldName = $_POST['update-name'];
  $newName = $_POST['update-new-name'];
  $age = $_POST['update-age'];
  $health = $_POST['update-health'];
  $damage = $_POST['update-damage'];
  $weapon = $_POST['update-weapon'];

  $updateQuery = "UPDATE
                    heroes
                  SET
                    class_id = ('$heroClass'),
                    name = ('$newName'),
                    age = ('$age'),
                    health = ('$health'),
                    damage = ('$damage'),
                    weapon = ('$weapon')
                  WHERE
                    name = ('$oldName')";
  returnQuery($updateQuery);
  echo "<br> Update Successful!";

} else {
  echo "<br> No Update detected";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="style.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,400;0,700;0,900;1,400&display=swap" rel="stylesheet">
  <title>Stats Checker | Character Creator and Stats Checker</title>
</head>
<body>
  <div class="container-lg">

    <!-- Create Hero Form -->
    <h2 class="section-title">Create a Hero</h2>
    <div class="banner-group">
      <form action="register.php" method="POST">
        <div class="form-group">
          <label for="create-class">Class</label>
          <select name="create-class" id="create-class" size="1">
            <option value="1">Archer</option>
            <option value="2">Mage</option>
            <option value="3">Priest</option>
            <option value="4">Warrior</option>
          </select>
        </div>
        <div class="form-group">
          <label for="create-name">Name</label>
          <input id="create-name" name="create-name" type="text" required>
        </div>
        <div class="form-group">
          <label for="create-age">Age</label>
          <input id="create-age" name="create-age" type="number" required>
        </div>
        <div class="form-group">
          <label for="create-health">Health</label>
          <input id="create-health" name="create-health" type="number" required>
        </div>
        <div class="form-group">
          <label for="create-damage">Damage</label>
          <input id="create-damage" name="create-damage" type="number" required>
        </div>
        <div class="form-group">
          <label for="create-weapon">Weapon</label>
          <input id="create-weapon" name="create-weapon" type="text" required>
        </div>
        <input class="btn btn-submit" type="submit" name="create" value="Create">
        <!-- <button name="submit" type="submit">Submit</button> -->
      </form>
      <img class="banner-img" src="banner.png" alt="image of ...">
    </div>

    <!-- Search Hero Form -->
    <h2 class="section-title">Search for Heroes</h2>
    <div class="banner-group">
      <img class="banner-img" src="wizard.png" alt="image of wizard.">
      <div class="form-table-group">
        <form action="register.php" method="POST">
          <div class="form-group">
            <label for="find-name">Select a Hero</label>
            <select name="find-name" id="find-name">
              <?php
              $result = returnQuery("SELECT * FROM heroes");
              while ($row = mysqli_fetch_assoc($result)){
                $heroName = $row['name'];
                echo "<option value=$heroName>$heroName</option>";
              };
              ?>
            </select>
          </div>
          <input class="btn btn-blue" type="submit" name="find" value="Search">
        </form>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Class</th>
              <th>Age</th>
              <th>Health</th>
              <th>hamage</th>
              <th>Weapon</th>
            </tr>
          </thead>
          <tr>
            <?php
              $row = mysqli_fetch_assoc($findHeroQuery);
              $findClass = $row['class'];
              $findAge = $row['age'];
              $findHealth = $row['health'];
              $findDamage = $row['damage'];
              $findWeapon = $row['weapon'];
              echo "
              <td>$findName</td>
              <td>$findClass</td>
              <td>$findAge</td>
              <td>$findHealth</td>
              <td>$findDamage</td>
              <td>$findWeapon</td>
              ";
            ?>
            
          </tr>
        </table>
      </div>
    </div>
    
    <!-- Update Hero Form -->
    <h2 class="section-title">Update Hero</h2>
    <div class="banner-group">
      <form action="register.php" method="POST">
        <div class="form-group">
          <label for="update-name">Select a Hero</label>
          <select name="update-name" id="update-name">
            <?php
              $result = returnQuery("SELECT * FROM heroes");
              while ($row = mysqli_fetch_assoc($result)){
                // print_r($row);
                $heroName = $row['name'];
                echo "<option value=$heroName>$heroName</option>";
              };
            ?>
          </select>
        </div>
        <div class="form-group">
          <label for="update-new-name">Name</label>
          <input id="update-new-name" name="update-new-name" type="text" required>
        </div>
        <div class="form-group">
          <label for="update-class">Class</label>
          <select name="update-class" id="update-class" size="1">
            <option value="1">Archer</option>
            <option value="2">Mage</option>
            <option value="3">Priest</option>
            <option value="4">Warrior</option>
          </select>
        </div>
        <div class="form-group">
          <label for="update-age">Age</label>
          <input id="update-age" name="update-age" type="number" required>
        </div>
        <div class="form-group">
          <label for="update-health">Health</label>
          <input id="update-health" name="update-health" type="number" required>
        </div>
        <div class="form-group">
          <label for="update-damage">Damage</label>
          <input id="update-damage" name="update-damage" type="number" required>
        </div>
        <div class="form-group">
          <label for="update-weapon">Weapon</label>
          <input id="update-weapon" name="update-weapon" type="text" required>
        </div>
        <input class="btn btn-blue" type="submit" name="update" value="Update">
      </form>
      <img class="banner-img" src="adventurer.png" alt="image of wizard.">
    </div>
  </div>
  <footer>
    <p>Copyright &copy; 2023 Denzel Braithwaite</p>
  </footer>
</body>
</html>
