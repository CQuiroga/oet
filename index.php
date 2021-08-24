<?php

/* ***********************************
    Camilo Quiroga                   * 
    Prueba técnica desarrollador PHP *
    08 - 2021                        * 
   ********************************* *
*/

// ********* Conexión con bdd ****************

require_once("bdd/conexion.php");
$db_handle = new DBController();

?>

<!-- ****** Diseño de la página ********** -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:: Búsqueda de Vehículos ::</title>
    <link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<div class="container">
    <div class="row px-2">
        <div class="col-6 col-lg-2 col-md-3 aside align-items-sm-center mt-3"></div>
            <div class="text">
                <h2 class="text-primary mt-3">Búsqueda de Vehículos</h2>
                <hr>
                <p class="text-secondary text-justify">
                    Digita la <strong>Placa del Vehículo</strong> para encontrar su propietario y conductor.
                </p>  
            </div>
            <div class="logo">
                <img src="assets/images/logo.jpg" alt="logo"/>
            </div>
            
                       
            <div class="container">
            <form class="row justify-content-md-center" method="POST">

                <div class="block_input p-2 input">    
                    <label for="placa" class="d-block"><strong>Placa del vehículo:</strong></label>
                    <input type="text" oninput="activButton();" onBlur="activButton();" class="d-block bg-light col-12 border border-primay rounded" name="placa" id="placa" maxlength="6">

                    <input type="submit" class="btn btn-success send mt-3" id="btnSend" disabled value="Buscar">

                </div>  
                
            </form>
            
            </div>
        </div>
        <div id="resultado">
            <?php

            /* ********* Valida consulta dentro del mismo formulario ******** */

            if (isset($_POST['placa'])) {


                if ($_POST['placa'] == null || $_POST['placa'] == '') {
                    print("<script>Swal.fire(
                        '¡Error!',
                        'Verifica la placa ingresada',
                        'error'
                      );</script>");
                }

                $placa = $_POST['placa'];

                /* ********* Realiza consulta del vehículo, propietario y conductor ******** */

                $queryVehiculos = $dbh->prepare("SELECT id_conductor, placa, marca, tipo, cedulaConductor, prNomConductor, segNombreConductor, apellidosConductor, direccionConductor, telefonoConductor, ciudadConductor,
                cedulaPropietario, primerNombrePropietario, segNombrePropietario, apellidosPropietario, direccionPropietario, telefonoPropietario, ciudadPropietario
                FROM vehiculos
                INNER JOIN conductores ON vehiculos.id_conductor = conductores.id
                INNER JOIN propietarios ON vehiculos.id_propietario = propietarios.id
                WHERE placa = :placa");

                        $queryVehiculos->bindParam(':placa', $placa);
                        $queryVehiculos->execute();
                        $resultTodo = $queryVehiculos->fetchAll(PDO::FETCH_ASSOC);

                        $count = $queryVehiculos->rowCount();
                        
                        if ($count > 0) {
            ?>

            <!-- ******* Encabezados de la tabla ********* -->

            <div class="table-responsive">
            <table class="table table-striped table-hover table-responsive"> 
            <thead class="thead-dark"> 
                <tr class="Head_Tablas"> 
                    <th class="text-center">Placa</th> 
                    <th class="text-center">Marca</th> 
                    <th class="text-center">Tipo</th> 
                    <th class="text-center">Conductor</th> 
                    <th class="text-center">Propietario</th> 
            </thead> 
            <body> 
            <!-- ******* Muestra resultado en cada fila ********* -->
            <?php
                foreach ($resultTodo as $valor) { 

            ?>
                <tr>
                <!-- ******* Separar por colores los conductores ********* -->

                    <?php 

                    switch ($valor['id_conductor']) {
                        case 1:
                            print('<td class="text-center bg-secondary">'.$valor['placa'].'</td>
                            <td class="text-center bg-secondary">'.$valor['marca'].'</td>
                            <td class="text-center bg-secondary">'.$valor['tipo'].'</td>
                            <td class="text-center bg-secondary">'.$valor['prNomConductor'].' '.$valor['segNombreConductor'].' '.$valor['apellidosConductor'].'</td>
                            <td class="text-center bg-secondary">'.$valor['primerNombrePropietario'].' '.$valor['segNombrePropietario'].' '.$valor['apellidosPropietario'].'</td>');
                            break;
                        case 2:
                            print('<td class="text-center bg-success">'.$valor['placa'].'</td>
                            <td class="text-center bg-success">'.$valor['marca'].'</td>
                            <td class="text-center bg-success">'.$valor['tipo'].'</td>
                            <td class="text-center bg-success">'.$valor['prNomConductor'].' '.$valor['segNombreConductor'].' '.$valor['apellidosConductor'].'</td>
                            <td class="text-center bg-success">'.$valor['primerNombrePropietario'].' '.$valor['segNombrePropietario'].' '.$valor['apellidosPropietario'].'</td>');
                            break;
                        case 3:
                            print('<td class="text-center text-light bg-dark">'.$valor['placa'].'</td>
                            <td class="text-center text-light bg-dark">'.$valor['marca'].'</td>
                            <td class="text-center text-light bg-dark">'.$valor['tipo'].'</td>
                            <td class="text-center text-light bg-dark">'.$valor['prNomConductor'].' '.$valor['segNombreConductor'].' '.$valor['apellidosConductor'].'</td>
                            <td class="text-center text-light bg-dark">'.$valor['primerNombrePropietario'].' '.$valor['segNombrePropietario'].' '.$valor['apellidosPropietario'].'</td>');
                            break;
                        case 4:
                            print('<td class="text-center bg-primary">'.$valor['placa'].'</td>
                            <td class="text-center bg-primary">'.$valor['marca'].'</td>
                            <td class="text-center bg-primary">'.$valor['tipo'].'</td>
                            <td class="text-center bg-primary">'.$valor['prNomConductor'].' '.$valor['segNombreConductor'].' '.$valor['apellidosConductor'].'</td>
                            <td class="text-center bg-primary">'.$valor['primerNombrePropietario'].' '.$valor['segNombrePropietario'].' '.$valor['apellidosPropietario'].'</td>');
                            break;
                    }

                    ?>
                
            <?php } ?>
            </div> 
            </body> 
            </table>
            <?php
             /* ********* Si no coinciden los datos de búsqueda o no existen resultados ********* */

            } else {
                print("<script>Swal.fire(
                    '¡Error!',
                    'No se encontraron resultados',
                    'error'
                  );</script>");
            }
            }
            ?>
        </div>
        <div class="col-6 col-lg-2 col-md-3 aside"></div>
    </div>
</div>

<!-- ***** Función que activa el botón de búsqueda si se ha ingresado un texto ***** --> 

<script>
    function activButton() {
        document.getElementById('btnSend').disabled = false;
    }
</script>
</body>
</html>