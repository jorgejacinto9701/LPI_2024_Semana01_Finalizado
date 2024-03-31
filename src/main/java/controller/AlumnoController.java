package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import com.google.gson.Gson;

import entity.Alumno;
import entity.Respuesta;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AlumnoModel;

@WebServlet("/registraAlumno")
public class AlumnoController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom = request.getParameter("nombre");
		String dni = request.getParameter("dni");
		String cor = request.getParameter("correo");
		String fec = request.getParameter("fecha");
		
		Alumno objAlumno = new Alumno();
		objAlumno.setNombre(nom);
		objAlumno.setDni(dni);
		objAlumno.setCorreo(cor);
		objAlumno.setFechaNacimiento(Date.valueOf(fec));
		
		AlumnoModel model  = new AlumnoModel();
		int insertados = model.insertaAlumno(objAlumno);
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		}else {
			objRespuesta.setMensaje("Error en el registro");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println(json);
		
	}
	
	
}




