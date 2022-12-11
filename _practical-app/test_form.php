<?php
			if (isset($_POST['submit'])); {

				$username = $_POST['username'];
				$password = $_POST['password'];
				echo "Your username is: " . $username . "<br>";
                echo "Your super secret password is " . $password;
			}
?>