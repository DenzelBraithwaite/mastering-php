<?php include "db.php";

if (isset($_POST['submit'])) {
  $heroClass = (int)$_POST['create-class']; // Converting to number
  $name = $_POST['create-name'];
  $age = $_POST['create-age'];
  $health = $_POST['create-health'];
  $damage = $_POST['create-damage'];
  $weapon = $_POST['create-weapon'];

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
    // echo $heroClass . '<br>';
    // echo $name . '<br>';
    // echo $age . '<br>';
    // echo $health . '<br>';
    // echo $damage . '<br>';
    // echo $weapon . '<br>';
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
        <input class="btn btn-submit" type="submit" name="submit" value="Create">
        <!-- <button name="submit" type="submit">Submit</button> -->
      </form>
      <img class="banner-img" src="banner.png" alt="image of ...">
    </div>

    <!-- Search Hero Form -->
    <h2 class="section-title">Search for Heroes</h2>
    <div class="banner-group">
      <img class="banner-img" src="wizard.png" alt="image of wizard.">
      <form action="register.php" method="POST">
        <div class="form-group">
          <label for="search-name">Select a Hero</label>
          <select name="search-name" id="search-name">
          <?php
            
            ?>
          </select>
        </div>
        <input class="btn btn-blue" type="submit" name="submit" value="Search">
      </form>
    </div>

    <!-- Update Hero Form -->
    <h2 class="section-title">Update Hero</h2>
    <div class="banner-group">
      <form action="register.php" method="POST">
        <div class="form-group">
          <label for="update-name">Select a Hero</label>
          <select name="update-name" id="update-name">
            <option value="test">test</option>
          </select>
        </div>
        <div class="form-group">
          <label for="update-new-name">Name</label>
          <input id="update-new-name" name="update-new-name" type="text" required>
        </div>
        <div class="form-group">
          <label for="update-class">Class</label>
          <select name="update-class" id="update-class" size="1">
            <?php
            
            ?>
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
        <input class="btn btn-blue" type="submit" name="submit" value="Update">
      </form>
      <img class="banner-img" src="adventurer.png" alt="image of wizard.">
    </div>
  </div>
  <footer>
    <p>Copyright &copy; 2023 Denzel Braithwaite</p>
  </footer>
</body>
</html>
