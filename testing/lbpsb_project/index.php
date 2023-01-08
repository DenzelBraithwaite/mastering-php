<?php
// include "db.php";





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
  <title>Teacher Viewer | Filter School Staff and Student</title>
</head>
<body>
  <div class="container-lg">

    
    <!-- Search Hero Form -->
    <h2 class="section-title">Teacher Search</h2>
    <div class="banner-group">
      <img class="banner-img" src="img/classroom.png" alt="elementary students in class">
        <form action="index.php" method="POST">
          <div class="form-group">
            <label for="first-name">First Name</label>
            <input id="first-name" name="first-name" type="text" placeholder="Ex: John">  
          </div>

          <div class="form-group">
            <label for="last-name">Family Name</label>
            <input id="last-name" name="last-name" type="text" placeholder="Ex: Smith">  
          </div>

          <div class="form-group">
            <label for="subject">Subject</label>
            <select name="subject" id="subject">
              <option value=""></option>
              <option value="tes2t">Tes2t</option>
            </select>
          </div>

          <div class="form-group">
            <label for="school">School</label>
            <select name="school" id="school">
              <option value=""></option>
              <option value="test">Test</option>
            </select>
          </div>

          <div class="form-group">
            <label for="grade">Grade</label>
            <select name="grade" id="grade">
              <option value=""></option>
              <option value="0">Pre-K or Kindergarden</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
            </select>
          </div>
          <input class="btn btn-submit" type="submit" name="search" value="Search">
        </form>
    </div>
  </div>
  <footer>
    <p>Copyright &copy; 2023 Denzel Braithwaite</p>
  </footer>
  <script type="text/javascript" scr="script.js"></script>
</body>
</html>
