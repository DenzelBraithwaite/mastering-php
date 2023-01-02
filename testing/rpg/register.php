<?php
$connection = mysqli_connect('localhost', 'root', '', 'rpg');

if ($connection) {
  // echo "We are connected!" . "<br>";
} else {
  die('No luck :(');
}

if (isset($_POST['submit'])) {
  $heroClass = (int)$_POST['hero-class']; // Converting to number
  $name = $_POST['hero-name'];
  $age = $_POST['hero-age'];
  $health = $_POST['hero-health'];
  $damage = $_POST['hero-damage'];
  $weapon = $_POST['hero-weapon'];

  // Creates db entry from form
  $queryInsert = "INSERT INTO heroes(
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

  $duplicates = mysqli_fetch_assoc(mysqli_query($connection, $queryDuplicate));
  if ($duplicates['COUNT(1)']) {
    echo "That name already exists!";
  } else {
    echo 'The name does not exist';
    mysqli_query($connection, $queryInsert);
  }

  $querySelectAll = "SELECT * FROM heroes";

  $result = mysqli_query($connection, $querySelectAll);
  // Making sure $result and db connection exists.
  if (!$result) {
    die("Something went terribly wrong..." . mysqli_error());
  };

} else {
  echo 'no';
};

?>
  <?php
    echo $heroClass . '<br>';
    echo $name . '<br>';
    echo $age . '<br>';
    echo $health . '<br>';
    echo $damage . '<br>';
    echo $weapon . '<br>';
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
  <?php
  
  if (isset($_POST['submit'])) {

    while ($row = mysqli_fetch_assoc($result)) {
      // print_r($row);
      // echo "<br>";
    };
  };
  
  ?>
  <div class="container-login">
    <div>
      <h2 class="login-title">Create Hero</h2>
      <form action="register.php" method="POST">
        <div class="form-group">
          <label for="hero-class">Class</label>
          <select name="hero-class" id="hero-class" size="1">
            <option value="1">Archer</option>
            <option value="2">Mage</option>
            <option value="3">Priest</option>
            <option value="4">Warrior</option>
          </select>
        </div>
      <div class="form-group">
          <label for="hero-name">Name</label>
          <input id="hero-name" name="hero-name" type="text" required>
        </div>
        <div class="form-group">
          <label for="hero-age">Age</label>
          <input id="hero-age" name="hero-age" type="number" required>
        </div>
        <div class="form-group">
          <label for="hero-health">Health</label>
          <input id="hero-health" name="hero-health" type="number" required>
        </div>
        <div class="form-group">
          <label for="hero-damage">Damage</label>
          <input id="hero-damage" name="hero-damage" type="number" required>
        </div>
        <div class="form-group">
          <label for="hero-weapon">Weapon</label>
          <input id="hero-weapon" name="hero-weapon" type="text" required>
        </div>
        <input class="btn btn-submit" type="submit" name="submit" value="Create">
        <a class="btn btn-signup" href="search.php">Search</a>
        <!-- <button name="submit" type="submit">Submit</button> -->
      </form>
    </div>
    <img class="banner-img" src="banner.png" alt="image of ...">
  </div>
</body>
</html>
