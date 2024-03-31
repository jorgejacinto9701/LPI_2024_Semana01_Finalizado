<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Registra Alumno</title>
</head>
<body>
<div class="container">
	<h3>Registra Alumno</h3>
	
	<form id="id_form">
	<div class="row" style="margin-top: 5%">
		<div class="form-group col-sm-8">
			<div class="col-sm-4">
				<label for="id_nombre" class="control-label">Nombre</label>					
			</div>
			<div class="col-sm-8">
				<input class="form-control" type="text" 
					id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">
			</div>
		</div>	
		<div class="form-group col-sm-4">
			<div class="col-sm-4">
				<label for="id_dni" class="control-label">DNI</label>	
			</div>
			<div class="col-sm-8">
				<input class="form-control" type="text" 
					id="id_dni" name="dni" placeholder="Ingrese el DNI" maxlength="8">
			</div>
		</div>
	
	</div>
	
	<div class="row" style="margin-top: 2%">
		<div class="form-group col-sm-8">
			<div class="col-sm-4">
				<label for="id_correo" class="control-label">Correo</label>					
			</div>
			<div class="col-sm-8">
				<input class="form-control" type="text" 
					id="id_correo" name="correo" placeholder="Ingrese el correo" maxlength="40">
			</div>
		</div>	
		<div class="form-group col-sm-4">
			<div class="col-sm-4">
				<label for="id_fecha" class="control-label">Fec.Nac</label>	
			</div>
			<div class="col-sm-8">
				<input class="form-control" type="date" id="id_fecha" name="fecha">
			</div>
		</div>
		
	</div>
	<div class="row" style="margin-top: 2%" align="center">
		<button id="id_registrar" type="button" 
						class="btn btn-primary" >Crea Alumno</button>
	</div>
	
</form>
</div>


<script type="text/javascript">

$("#id_registrar").click(function (){ 

	//Lanza la validacion
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraAlumno", 
          data: $('#id_form').serialize(),
          success: function(data){
        	  mostrarMensaje(data.mensaje);
        	  limpiarFormulario();
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
    
});  

function limpiarFormulario(){	
	$('#id_nombre').val('');
	$('#id_dni').val('');
	$('#id_correo').val(' ');
}

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                    }
                },
                dni:{
                    selector: "#id_dni",
                    validators:{
                        notEmpty: {
                             message: 'El dni es obligatorio'
                        },
                        regexp: {
                            regexp: /^[0-9]{8}$/,
                            message: 'el dni es 8 dígitos'
                        }
                    }
                },
                correo:{
                    selector: "#id_correo",
                    validators:{
                        notEmpty: {
                             message: 'El correo es obligatorio'
                        },
                        emailAddress: {
                            message: 'El correo no es valido'
                        }
                    }
                },
                fechaNacimiento:{
                    selector: "#id_fecha",
                    validators:{
                        notEmpty: {
                             message: 'La fecha es obligatorio'
                        }
                    }
                },
        }   
    });

    
});
</script>


</body>
</html>