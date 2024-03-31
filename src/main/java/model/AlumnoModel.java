package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import entity.Alumno;
import util.MySqlDBConexion;

public class AlumnoModel {

	public int insertaAlumno(Alumno obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			//1 Crear la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "insert into alumno values(null,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getDni());
			pstm.setString(3, obj.getCorreo());
			pstm.setDate(4, obj.getFechaNacimiento());
			
			System.out.println("SQL >>" + pstm);
			
			//3 Se envía el SQL a la base de datos y se obtiene 
			//la cantidad de insertados
			salida = pstm.executeUpdate();
			
			System.out.println("SQL Insertados >>" + salida);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //Se ejecuta exista o no caidas
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		return salida;
	}
}
