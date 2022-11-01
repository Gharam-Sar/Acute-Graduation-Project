
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    Users Table
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
      <a style="background-color: #b6d9f0; "class="nav-link text-white " href="./index.php">
        <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
          <i class="material-icons opacity-10"style="background-color:#0b1a34; ">table_view</i>
        </div>
        <span class="nav-link-text ms-1"style="color:#0b1a34;">Users Table</span>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white "   href="./food-table.php"  header="location:user-table.php;">
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



</aside><main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
  
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">
        
      </div>
    </nav>
    <div class="container-fluid py-4" align = "center";>
      <div class="row"  align = "center";>
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class=" border-radius-lg pt-4 pb-3"style="background-color: #0b1a34; color: white;">
                <h6 class="text-white text-capitalize ps-3">Acute Users Table</h6>
              </div>
            </div>
            <div class="card-body px-0 pb-2"  align = "center";>
              <div class="table-responsive p-0"  align = "center";>
                <table class="table align-items-center mb-0" align = "center";>
                  <thead  align = "center";>
                    <tr>
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">User ID</th>              

                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">First Name</th>              
                      <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2" >Last Name</th>
                      <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Email</th>
                      <th class=" text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Gender</th>
                      <th class=" text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Date of Birth</th>
                      <th class=" text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Access Level</th>

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
                   $strQry='select * from acute_users';
                    $res = $dp ->query($strQry);
                    for($i=0;$i<$res -> num_rows;$i++)
                    {
                        $row = $res -> fetch_assoc();
                        $id=$row['user_id'];
                        $name=$row['first_name'];
                        $name2=$row['last_name'];
                        $email=$row['email'];
                 
if($row['gender']==1){ $gender="Female";}
if($row['gender']==0){ $gender="Male";}   
if($row['user_level']==1){   $acc_level="Admin";}
if($row['user_level']==0){    $acc_level="User";}   
if($row['user_level']==2){    $acc_level="Super User";}                    
                        $date=$row['date_of_birth'];
          echo"<tr ><th >$id</th><th >$name</th><th>$name2</th><th> $email</th><th>$gender</th><th>$date</th><th>$acc_level</th></tr>";

                        
                
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