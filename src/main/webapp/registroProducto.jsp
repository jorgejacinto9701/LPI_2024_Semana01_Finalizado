<!DOCTYPE html>
<html lang="esS">
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
<title>Registra Producto</title>
</head>
<body>
	<div class="container" style="margin-top: 5%">
		<h4>Registro Producto</h4>
	</div>

	<div class="container" style="margin-top: 1%">
		<form id="id_form" method="post">
			<div class="col-md-12" style="margin-top: 2%">
				<div class="row">

					<div class="form-group">
						<label class="control-label" for="id_nombre">Nombre</label> <input
							class="form-control" type="text" id="id_nombre" name="nombre"
							placeholder="Ingrese el nombre del producto" maxlength="40">

					</div>

					<div class="form-group">
						<label class="control-label" for="id_serie">serie</label> <input
							class="form-control" type="text" id="id_serie" name="serie"
							placeholder="Ingrese la serie del producto" maxlength="40">

					</div>

					<div class="form-group">
						<label class="control-label" for="id_precio">precio</label> <input
							class="form-control" type="text" id="id_precio" name="precio"
							placeholder="Ingrese el precio" maxlength="40">
					</div>

					<div class="form-group">
						<label class="control-label" for="id_stock">stock</label> <input
							class="form-control" type="text" id="id_stock" name="stock"
							placeholder="Ingrese el stock actual" maxlength="40">
					</div>

					<div class="form-group">
						<label class="control-label" for="id_marca">Marca</label> <select
							class="form-control" id="id_marca" name="marca.idMarca">
							<option value=" ">[Seleccione]</option>
							<option value="Mac">Mac</option>
							<option value="Toshiba">"Toshiba"</option>
						</select>
					</div>

					<div class="form-group">
						<label class="control-label" for="id_pais">País</label> <select
							class="form-control" id="id_pais" name="pais.idPais">
							<option value=" ">[Seleccione]</option>
							<option value="Perú">Perú</option>
							<option value="Colombia">Colombia</option>
						</select>
					</div>

				</div>
				<div class="row">
					<div class="form-group col-md-12" align="center">
										<button id="id_registrar" type="button" 
						class="btn btn-primary" >Crea Producto</button>
					</div>
				</div>
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
          url: "registraProducto", 
          data: $('#id_form').serialize(),
          success: function(data){
        	  mostrarMensaje(data.mensaje);
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
    
}); 

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	nombre : {  
        		selector: "#id_nombre",
        		validators : {
        			notEmpty: {
                        message: 'El nombre es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El nombre tiene de 3 a 30 caracteres'
                    },
        		}
        	},
        }   
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>
</body>
</html>