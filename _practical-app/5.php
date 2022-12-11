<?php include "functions.php" ?>
<?php include "includes/header.php" ?>
	<section class="content">

		<aside class="col-xs-4">
		<?php Navigation();?>
			
			
		</aside><!--SIDEBAR-->


<article class="main-content col-xs-8">

	
	<?php 


	//  Step1: Use a pre-built math function here and echo it
	echo max([1, 100, 50]);
	echo "<br>";

	// Step 2:  Use a pre-built string function here and echo it
	echo strtolower("ThIs Is GoInG tO bE lOwEr CaSe...");
	echo "<br>";

	//Step 3:  Use a pre-built Array function here and echo it
	$array = [1, 5, 3, 2, 4];
	sort($array);
	print_r($array);
 
?>





</article><!--MAIN CONTENT-->
<?php include "includes/footer.php" ?>