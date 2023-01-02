<?php
$connection = mysqli_connect('localhost', 'root', '', 'rpg');

if ($connection) {
  echo "We are connected!";
  echo "<br>";
} else {
  die('No luck :(');
}

if (isset($_POST['submit'])) {
  $heroClass = (int)$_POST['hero-class']; // Converting to number
  $firstName = $_POST['hero-first-name'];
  $lastName = $_POST['hero-last-name'];
  $age = $_POST['hero-age'];
  $health = $_POST['hero-health'];
  $damage = $_POST['hero-damage'];
  $weapon = $_POST['hero-weapon'];

  echo $heroClass;
  // $query = 'INSERT INTO fighters(
  //             class_id,
  //             first_name,
  //             last_name,
              
  // )'

} else {
  echo 'no';
};

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
          <label for="hero-first-name">First name</label>
          <input id="hero-first-name" name="hero-first-name" type="text" required>
        </div>
        <div class="form-group">
          <label for="hero-last-name">Last name</label>
          <input id="hero-last-name" name="hero-last-name" type="text" required>
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
