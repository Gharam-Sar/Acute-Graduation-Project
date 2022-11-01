<?php
session_start();
$user=$_SESSION['islogged'];
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <title>
    Admin Page
  </title>

 
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">

  <link id="pagestyle" href="./assets/css/styles.css" rel="stylesheet" />
</head>

<body class="g-sidenav-show  bg-gray-100">
   <aside style="background-color: #0b1a34;" class="sidenav  navbar-vertical navbar-expand-xs  border-radius-xl fixed-start ms-2 " id="sidenav-main">

    <div class="" >
      <img width="150px" class="ms-5" src="./assets/img/logolightblue.png" >
    </div>
    <hr class="horizontal light mt-0 mb-1">
    <div class="collapse navbar-collapse    max-height-vh-100" id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a style="background-color: #b6d9f0; " class="nav-link text-white  " href="./index.php">
            <div class="  me-2 d-flex align-items-center justify-content-center"style="background-color:#0b1a34;" >
              <i class="material-icons opacity-10" style="background-color:#0b1a34; ">dashboard</i>
            </div>
            <span class="nav-link-text ms-1" style="color:#0b1a34;">Main Page</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white " href="./user-table.php">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">table_view</i>
            </div>
            <span class="nav-link-text ms-1">Users Table</span>
          </a>
        </li>
    
        <li class="nav-item">
          <a class="nav-link text-white "   href="./food-table.php" >
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">table_view</i>
            </div>
            <span class="nav-link-text ms-1">Foods Table</span>
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
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
  
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-2 px-1">
     
      </div>
    </nav>
 
          <div class="row ms-0 mb-4 " align="center"; >
             <div class="col-lg-4 col-md-6" >
                <div class="card h-200 " >
                    <div class="card-header pb-0" align="center"; style="background-color: #b7d996 ;">
                      <h6>Change User Level</h6>
                    </div>
                    <div class="card-body p-4" align="center"; style="background-color:  #b7d996 ;">
                   

                    <form align="center"; method="post" class="text-start">
                  <label  align="center"; class="form-label">User ID</label  >
                  <div class="input-group input-group-outline mb-4">
                    <input style="background-color: white;" type="id" placeholder="Enter User ID to change user Level" class="form-control" name="id" required>
                  </div>
                  <div class="text-center">
                    <button method="POST" action="localhost/myAdmin/index.php" type="submit" style="background-color: #0b1a34; color: white;"
                      class="btn  w-100 my-4 mb-2">Change User Level</button>
                  </div>
                  </form>

                       <?php 
                       if($user==2){
                          if (isset($_POST['id']) && $_POST['id']!="")
                          {   @$dp=new mysqli('localhost', 'root','','acutedb');
                              if(mysqli_connect_errno())
                              {  echo 'Can not connect to database';
                                  die(); }
                              $strQry = "SELECT * FROM `acute_users` WHERE `user_id`='" . $_POST['id'] . "'";
                              $res = $dp ->query($strQry);
                                $row = $res -> fetch_assoc();
                                  if ($row['user_level']==1)
                                  {   $strQry2="UPDATE `acute_users` SET `user_level`= 0 WHERE `user_id`='" . $_POST['id'] . "'" ;
                                        $res2 = $dp ->query($strQry2); }
                                  if ($row['user_level']==0)
                                  { $strQry2="UPDATE `acute_users` SET `user_level`= 1 WHERE `user_id`='" . $_POST['id'] . "'" ;
                                        $res2 = $dp ->query($strQry2); }  }
                       } ?> 





                    </div>
                  </div>
                </div>



                <div class="col-lg-4 col-md-6">
                 <div class="card h-200">
                 <div class="card-header pb-0" align="center"; style="background-color: #ECA6A6;">
                      <h6>Delete User</h6>
                    </div>
                    <div class="card-body p-4" align="center"; style="background-color: #ECA6A6;">
                   

                    <form align="center"; method="post" class="text-start">
                  <label  align="center"; class="form-label">User ID</label  >
                  <div class="input-group input-group-outline mb-4">
                    <input style="background-color: white;" type="id_delete" placeholder="Enter User ID to Delete user" class="form-control" name="id_delete" required>
                  </div>
                  <div class="text-center">
                    <button method="POST" action="localhost/myAdmin/index.php" type="submit" style="background-color: #0b1a34; color: white;"
                      class="btn  w-100 my-4 mb-2">Delete User </button>
                  </div>
                  </form>
                  <?php 
                  if($user==2){
                          if (isset($_POST['id_delete']) && $_POST['id_delete']!="")
                          {   @$dp=new mysqli('localhost', 'root','','acutedb');
                              if(mysqli_connect_errno())
                              {  echo 'Can not connect to database';
                                  die(); }
                                  $strQry = "DELETE FROM `water_timer` WHERE `user_id`='" . $_POST['id_delete'] . "'";
                                  $res = $dp ->query($strQry);
                                  $strQry = "DELETE  FROM `water` WHERE `user_id`='" . $_POST['id_delete'] . "'";
                                  $res = $dp ->query($strQry);
                                  $strQry = "DELETE FROM `users_diseases` WHERE `user_id`='" . $_POST['id_delete'] . "'";
                                  $res = $dp ->query($strQry);
                                  $strQry = "DELETE FROM `meals` WHERE `user_id`='" . $_POST['id_delete'] . "'";
                                  $res = $dp ->query($strQry);
                                  $strQry = "DELETE  FROM `eaten_meals` WHERE `user_id`='" . $_POST['id_delete'] . "'";
                                  $res = $dp ->query($strQry);
                                            
                              $strQry = "DELETE FROM `acute_users` WHERE `user_id`='" . $_POST['id_delete'] . "'";
                              $res = $dp ->query($strQry);
                                
                                  }}
                        ?> 
                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                 <div class="card h-200">
                 <div class="card-header pb-0" align="center"; style="background-color: #e69c7c;">
                      <h6>Delete Food</h6>
                    </div>
                    <div class="card-body p-4" align="center"; style="background-color: #e69c7c;">
                   

                    <form align="center"; method="post" class="text-start">
                  <label  align="center"; class="form-label">Food ID</label  >
                  <div class="input-group input-group-outline mb-4">
                    <input style="background-color: white;" type="food_delete" placeholder="Enter User ID to change user Level" class="form-control" name="food_delete" required>
                  </div>
                  <div class="text-center">
                    <button method="POST" action="localhost/myAdmin/index.php" type="submit" style="background-color: #0b1a34; color: white;"
                      class="btn  w-100 my-4 mb-2">Delete Food</button>
                  </div>
                  </form>
                  <?php 
                          if (isset($_POST['food_delete']) && $_POST['food_delete']!="")
                          {   @$dp=new mysqli('localhost', 'root','','acutedb');
                              if(mysqli_connect_errno())
                              {  echo 'Can not connect to database';
                                  die(); }
                              $strQry = "DELETE FROM `foods` WHERE `food_id`='" . $_POST['food_delete'] . "'";
                              $res = $dp ->query($strQry);
                                
                                  }
                        ?> 
                    </div>
                  </div>
                </div>
              </div>
              </div>
            </div>
    <div class="row ms-0 mb-4">
        <div class="col-lg-12 col-md-6 mb-md-0 mb-4" >
          <div class="card"  style="background-color: #f2c8a2;">
            <table>
            <tr>
              <div class="mb-4">
              </div>
            <div  align="center"; ">
                      <h6>Add Food</h6>
                    </div>
            </tr>
             <form align="center"; method="post" class="text-start">
            <tr>
            <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">Food Name</label  >
                  <div class="input-group input-group-outline mb-2">
                    <input style="background-color: white;" type="Food_Name" placeholder="" class="form-control" name="Food_Name" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">CALORIES</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number" step=".01" placeholder="" class="form-control" name="CALORIES" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">CARBOHYDRATES</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number" step=".01" placeholder="" class="form-control" name="CARBOHYDRATES" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">DIETARY FIBER</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number" step=".01" placeholder="" class="form-control" name="DIETARY_FIBER" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">FATS</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number"  step=".01" placeholder="" class="form-control" name="FATS" required>
                  </div> </td>
                   <td><div class="ms-2"> </div> </td>
            </tr>
            <tr>
            <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">VITAMINS</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number" step=".01"  placeholder="" class="form-control" name="VITAMINS" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">SODIUM</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number" step=".01"  placeholder="" class="form-control" name="SODIUM" required>
                  </div>

           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">PROTEINS</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number"  step=".01" placeholder="" class="form-control" name="PROTEINS" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">SUGER</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number"  step=".01" placeholder="" class="form-control" name="SUGER" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">CHOLESTEROL</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number"  step=".01" placeholder="" class="form-control" name="CHOLESTEROL" required>
                  </div>
           </td>
                   <td><div class="ms-2"> </div> </td>
            </tr>
            <tr>
            <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">CALCIUM</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="number" step=".01"  placeholder="" class="form-control" name="CALCIUM" required>
                  </div> </td>
            <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">IRON</label  >
                  <div class="input-group input-group-outline mb-1">
                  <input style="background-color: white;" type="number"  step=".01" placeholder="" class="form-control" name="IRON" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">POTASSIUM</label  >
                  <div class="input-group input-group-outline mb-1">
                  <input style="background-color: white;" type="number"  step=".01" placeholder="" class="form-control" name="POTASSIUM" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">MAGNESIUM</label  >
                  <div class="input-group input-group-outline mb-1">
                  <input style="background-color: white;" type="number" step=".01"  placeholder="" class="form-control" name="MAGNESIUM" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">ZINC</label  >
                  <div class="input-group input-group-outline mb-1">
                  <input style="background-color: white;" type="number"  step=".01" placeholder="" class="form-control" name="ZINC" required>
                  </div>

           </td>
           <td><div class="ms-2"> </div> </td>
            </tr>
           
            <tr>
            <td><div class="ms-2 mb-1"> </div> </td>
           <td>           </td>
           <td><div class="ms-2 mb-1"> </div> </td>
           <td> </td>
           <td><div class="ms-2 mb-1"> </div> </td>
           <td class="mb-1">
           <div class="text-center ">
                    <button method="POST" action="localhost/myAdmin/index.php" type="submit" style="background-color: #0b1a34; color: white;"
                      class="btn  w-100 my-4 mb-2">Add Food</button>
                  </div>
           </td>
           <td><div class="ms-2 mb-1"> </div> </td>
           <td> </td>
           <td><div class="ms-2 mb-1"> </div> </td>
           <td></td>
            <td><div class="ms-2 mb-1"> </div> </td>
            </tr>

 </form>
 <?php 
  if (isset($_POST['Food_Name'])&&$_POST['Food_Name']!=""&&isset($_POST['CALORIES'])&&$_POST['CALORIES']!=""
  &&isset($_POST['CARBOHYDRATES'])&&$_POST['CARBOHYDRATES']!=""&&isset($_POST['DIETARY_FIBER'])&&$_POST['DIETARY_FIBER']!=""
  &&isset($_POST['FATS'])&&$_POST['FATS']!=""&&isset($_POST['VITAMINS'])&&$_POST['VITAMINS']!=""
  &&isset($_POST['SODIUM'])&&$_POST['SODIUM']!=""&&isset($_POST['PROTEINS'])&&$_POST['PROTEINS']!=""
  &&isset($_POST['SUGER'])&&$_POST['SUGER']!=""&&isset($_POST['CHOLESTEROL'])&&$_POST['CHOLESTEROL']!=""
  &&isset($_POST['CALCIUM'])&&$_POST['CALCIUM']!=""&&isset($_POST['IRON'])&&$_POST['IRON']!=""
  &&isset($_POST['POTASSIUM'])&&$_POST['POTASSIUM']!=""&&isset($_POST['MAGNESIUM'])&&$_POST['MAGNESIUM']!=""
  &&isset($_POST['ZINC'])&&$_POST['ZINC']!="")
  {
                    @$dp=new mysqli('localhost', 'root','','acutedb');
                    if(mysqli_connect_errno())
                    { echo 'Can not connect to database';
                        die(); }
                   $strQry="INSERT INTO `foods`( `food_name`, `calories`, `carbohydrates`, `dietary fiber`, `fats`, `vitamins`, `sodium`, `proteins`, `suger`, `cholesterol`, `calcium`, `iron`, `potassium`, `magnesium`, `zinc`) VALUES ('" . $_POST['Food_Name'] . "','" . $_POST['CALORIES'] . "','" . $_POST['CARBOHYDRATES'] . "','" . $_POST['DIETARY_FIBER'] . "','" . $_POST['FATS'] . "','" . $_POST['VITAMINS'] . "','" . $_POST['SODIUM'] . "','" . $_POST['PROTEINS'] . "','" . $_POST['SUGER'] . "','" . $_POST['CHOLESTEROL'] . "','" . $_POST['CALCIUM'] . "','" . $_POST['IRON'] . "','" . $_POST['POTASSIUM'] . "','" . $_POST['MAGNESIUM'] . "','" . $_POST['ZINC'] . "')";
                    $res = $dp ->query($strQry);
                                    }
            
            ?>

            </table>
          </div>
        </div>
      
      </div>


    






  </main>
 
</body>

</html>