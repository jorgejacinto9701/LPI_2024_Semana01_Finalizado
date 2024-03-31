<!DOCTYPE html>
<html lang="esS" >
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
<title>Registra Jugador</title>
</head>
<body>

<div class="container">
<h1>Registra Jugador</h1>

	<form action="registraJugador" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_alias">Alias</label>
				<input class="form-control" type="text" id="id_alias" name="alias" placeholder="Ingrese el alias">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_pais">País</label>
				<select class="form-control" id="id_pais" name="pais" >
						<option value=""></option>
						<option value="Perú">Perú</option>
						<option value="Brasil">Brasil</option>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_juego">Juego</label>
				<select class="form-control" id="id_juego" name="juego" >
						<option value=""></option>
						<option value="Dota I">Dota I</option>
						<option value="WoW">WoW</option>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_experiencia">Experiencia</label>
				<input class="form-control" type="text" id="id_experiencia" name="experiencia" placeholder="Ingrese la experiencia">
			</div>
			<div class="form-group">
				<button id="id_registrar" type="button" 
						class="btn btn-primary" >Crea Jugador</button>
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
          url: "registraJugador", 
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
        	alias : {  
        		selector: "#id_alias",
        		validators : {
        			notEmpty: {
                        message: 'El alias es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El alias tiene de 3 a 30 caracteres'
                    },
        		}
        	},   
        	pais : {  
        		selector: "#id_pais",
        		validators : {
        			notEmpty: {
                        message: 'El país es requerido'
                    },
        		}
        	},   
        	juego : {  
        		selector: "#id_juego",
        		validators : {
        			notEmpty: {
                        message: 'El juego es requerido'
                    },
        		}
        	},  
        	experiencia : {  
        		selector: "#id_experiencia",
        		validators : {
        			notEmpty: {
                        message: 'La experiencia es requerido'
                    },
                    lessThan: {
                        value: 10,
                        inclusive: true,
                        message: 'La experiencia es menor o igual a 10'
                    },
                    greaterThan: {
                        value: 0,
                        inclusive: true,
                        message: 'La experiencia es mayor o igual a 0'
                    }
        		}
        	},  
        }   
    });


});
</script>

</body>
</html>




