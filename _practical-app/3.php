<?php include "functions.php" ?>
<?php include "includes/header.php" ?>

	<section class="content">

	<aside class="col-xs-4">

	<?php Navigation();?>
			
	</aside><!--SIDEBAR-->


<article class="main-content col-xs-8">

<?php  

// Step1: Make an if Statement with elseif and else to finally display string saying, I love PHP

if (5 < 4) {
	echo "t";
} elseif (5 < 3) {
	echo "nun";
} else {
	echo "I love PHP";
}
echo "<br>";
// Step 2: Make a forloop  that displays 10 numbers
for ($i = 10; $i <= 100; $i += 10) {
	echo "{$i}<br>";
}

// Step 3 : Make a switch Statement that test againts one condition with 5 cases
switch (10) {
	case 2:
		echo "2";
		break;
	case 4:
		echo "4";
		break;
	case 6:
		echo "6";
		break;
	case 8:
		echo "8";
		break;
	case 10:
		echo "10";
}
	
?>






</article><!--MAIN CONTENT-->
	
<?php include "includes/footer.php" ?>