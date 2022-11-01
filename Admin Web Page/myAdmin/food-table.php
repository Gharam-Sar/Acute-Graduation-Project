
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    Foods Table
  </title>
 
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
 
  <link id="pagestyle" href="./assets/css/styles.css" rel="stylesheet" />
</head>

<body class="g-sidenav-show  bg-gray-100">
<aside style="background-color: #0b1a34;" class="sidenav  navbar-vertical navbar-expand-xs  border-radius-xl fixed-start ms-2 " id="sidenav-main">

<div class="" >
  <img width="150px" class="ms-5" src="./assets/img/logolightblue.png" >
</div>
<hr class="horizontal light mt-0 mb-2">
<div class="collapse navbar-collapse  w-auto  max-height-vh-100" id="sidenav-collapse-main">
  <ul class="navbar-nav">
  <li class="nav-item">
          <a class="nav-link text-white " href="./index.php">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">dashboard</i>
            </div>
            <span class="nav-link-text ms-1">Main page</span>
          </a>
        </li> 
        <li class="nav-item">
      <a class="nav-link text-white "   href="./user-table.php"  >
        <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
          <i class="material-icons opacity-10">table_view</i>
        </div>
        <span class="nav-link-text ms-1">Users Table</span>
      </a>
    </li>
    <li class="nav-item">
      <a style="background-color: #b6d9f0; "class="nav-link text-white " href="./food-table.php">
        <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
          <i class="material-icons opacity-10"style="background-color:#0b1a34; ">table_view</i>
        </div>
        <span class="nav-link-text ms-1"style="color:#0b1a34;">Foods Table</span>
      </a>
    </li>
    <li class="nav-item">
          <a class="nav-link text-white "   href="./feed-back.php" >
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">assignment</i>
            </div>
            <span class="nav-link-text ms-1">Feed Back</span>
          </a>
        </li>
  
    <li class="nav-item">
    <a class="nav-link text-white " href="./ads.php">
        <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
          <i class="material-icons opacity-10">receipt_long</i>
        </div>
        <span class="nav-link-text ms-1">Advertisement</span>
      </a>
    </li>
  
    <li class="nav-item">
      <a class="nav-link text-white " href="./sign-in.php">
        <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
          <i class="material-icons opacity-10">login</i>
        </div>
        <span class="nav-link-text ms-1">Sign Out</span>
      </a>
    </li>
       </ul>



</aside><main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">

    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">
        
      </div>
    </nav>
    <div class="container-fluid py-4"  align = "center";>
      <div class="row" align = "center";>
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class=" border-radius-lg pt-4 pb-3"style="background-color: #0b1a34; color: white;">
                <h6 class="text-white text-capitalize ps-3">Foods Table</h6>
              </div>
            </div>
            <div class="card-body px-0 pb-2"  align = "center";>
              <div class="table-responsive p-0"  align = "center";>
                <table class="table align-items-center mb-0" align = "center";>
                  <thead  align = "center";>
                    <tr>
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">ID</th>              
  
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Name</th>              
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2" >Calories</th>
                        <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Carbohydrates</th>
                  <th class=" text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Dietary Fiber</th>
                  <th class=" text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Fats</th>
                  <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Vitamins</th>              
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2" >Sodium</th>
                        <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Proteins</th>
                        <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Suger</th>

                  <th class=" text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Cholesterol</th>
                  <th class=" text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Calcium</th>
                  <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2" >Iron</th>
                        <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Potassium</th>
                  <th class=" text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Magnesium</th>
                  <th class=" text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Zinc</th>
                                      </tr>
                  </thead>
                  <tbody  align = "center";>
                  <?php 
                    @$dp=new mysqli('localhost', 'root','','acutedb');
                    if(mysqli_connect_errno())
                    {
                        echo 'Can not connect to database';
                        die();
                    }
                   $strQry='select * from foods';
                    $res = $dp ->query($strQry);
                    for($i=0;$i<$res -> num_rows;$i++)
                    {
                        $row = $res -> fetch_assoc();

                        
                        $food_id	=$row['food_id'];
                            $food_name	=$row['food_name'];
                            $calories	=$row['calories'];
                            $carbohydrates	=$row['carbohydrates'];
                            $dietary 	=$row['dietary fiber'];
                            $fats	=$row['fats'];
                            $vitamins	=$row['vitamins'];
                            $sodium	=$row['sodium'];
                            $proteins=	$row['proteins'];
                            $suger	=$row['suger'];
                            $cholesterol=	$row['cholesterol'];
                            $calcium	=$row['calcium'];
                            $iron	=$row['iron'];
                            $potassium=	$row['potassium'];
                            $magnesium=	$row['magnesium'];
                            $zinc=$row['zinc'];
                   
          echo"<tr ><th >$food_id</th><th >$food_name</th><th>$calories</th><th> $carbohydrates</th><th>$dietary</th><th>$fats</th><th> $vitamins</th><th>$sodium</th><th>$proteins</th><th>$suger</th><th> $cholesterol</th><th>$calcium</th><th>$iron</th><th> $potassium</th><th>$magnesium</th><th>$zinc</th></tr>";

                        
                
                    }
          
            
            ?>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </main>
 
</body>

</html>