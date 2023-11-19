package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionMySQL;
import modelos.Voluntarios;

public class VoluntariosDAO {

	//CREATE
	
	public void create (Voluntarios voluntario) {
		
		String sql= "insert into Voluntarios (disponibilidade, interesses, id_voluntario,nome,email) values (?, ?, ?)";
		
		Connection conn= null;
		PreparedStatement pstm = null;
		
		try {
			conn = ConnectionMySQL.createConnectionMySQL();
			
			pstm = conn.prepareStatement(sql);
			
			
			pstm.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm !=null) {
					pstm.close();
				}
				if (pstm !=null) {
					conn.close();
				}
				}
				catch (Exception e) {
				e.printStackTrace();	
				}
			}
		
		
		}
	//READ
	
	public List<Voluntarios> read() {
		List<Voluntarios> voluntarios= new ArrayList<Voluntarios>();
		String sql = "SELECT * FROM Voluntarios";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			
			conn= ConnectionMySQL.createConnectionMySQL();
			
			pstm= conn.prepareStatement(sql);
			
			rset = pstm.executeQuery();
						
			while(rset.next()) {
				Voluntarios voluntario = new Voluntarios();
				
				
				voluntario.setDisponibilidade(rset.getString("disponibilidade"));
				voluntario.setInteresses(rset.getString("interesses"));
				voluntario.setId_voluntario(rset.getString("id_voluntario"));
				voluntario.setNome(rset.getString("nome"));
				voluntario.setEmail(rset.getString("email"));
				
				
				
				
			
				
				voluntarios.add(voluntario);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return voluntarios;
	}
	
	//UPDATE
	
	public void update(Voluntarios voluntarios) {
		String sql = "UPDATE Voluntarios SET disponibilidade = ?, interesses = ?, id_voluntario,nome,email = ? WHERE id_usuario = ?;";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = ConnectionMySQL.createConnectionMySQL();
			
			pstm = conn.prepareStatement(sql);
			
			Voluntarios voluntario = null;
			pstm.setString(1, voluntario.getDisponibilidade());
			pstm.setString(2, voluntario.getInteresses());
			pstm.setString(3, voluntario.getId_voluntario());
			pstm.setString(4, voluntario.getNome());
			pstm.setString(5, voluntario.getEmail());
			
			
			pstm.execute();
	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstm != null) {
				pstm.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	  }
	}
	
	//DELETE
	
	public void delete(int Id) {
	String sql = "DELETE FROM Voluntarios WHERE id_usuario = ?";
	
	Connection conn = null;
	PreparedStatement pstm = null;
	
	try {
		conn = ConnectionMySQL.createConnectionMySQL();
		
		pstm = conn.prepareStatement(sql);
		
		pstm.setInt(1, Id);
		
		pstm.execute();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		  }
	}
	
	//READbyID
	
	@SuppressWarnings("finally")
	public Voluntarios readByID (int Id) {
		Voluntarios voluntario = new Voluntarios ();
		String sql = "select * from Voluntarios WHERE id_voluntarios = ?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			conn = ConnectionMySQL.createConnectionMySQL();
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setInt(1, Id);
			
			rset = pstm.executeQuery();
			
			rset.next();
				
			voluntario.setDisponibilidade(rset.getString("disponibilidade"));
			voluntario.setInteresses(rset.getString("interesses"));
			voluntario.setId_voluntario(rset.getString("id_voluntario"));
			voluntario.setNome(rset.getString("nome"));
			voluntario.setEmail(rset.getString("email"));

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstm != null) {
						pstm.close();
					}
					if (conn != null) {
						conn.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			  
				return voluntario;
			}	
	}
}


