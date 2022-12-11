<?php include "functions.php" ?>
<?php include "includes/header.php" ?>

	<section class="content">

		<aside class="col-xs-4">

	<?php Navigation();?>
			
			
		</aside><!--SIDEBAR-->


		<article class="main-content col-xs-8">
		


		<?php

			// Step 1: Make 2 variables called number1 and number2 and set 1 to value 10 and the other 20:
			$number1 = 10;
			$number2 = 20;

			// Step 2: Add the two variables and display the sum with echo:
			echo $number1 + $number2 . "<br>";

			// Step 3: Make 2 Arrays with the same values, one regular and the other associative
			$array = [1, 2, 3];
			$associative = array(0 => 1, 1 => 2, 2 => 3);
			echo $associative[2];

			// Step 4: Make a constant and set it to the value of PHP. and use an echo to print it out
			define("CONS", "PHP");
			echo CONS;

		?>

	

		</article><!--MAIN CONTENT-->

<?php include "includes/footer.php" ?>