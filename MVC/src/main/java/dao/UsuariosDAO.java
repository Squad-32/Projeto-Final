package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionMySQL;
import modelos.Usuarios;

public class UsuariosDAO {

	//CREATE
	
	public void create (Usuarios usuario) {
		
		String sql= "insert into Usuarios (nome, email, senha) values (?, ?, ?)";
		
		Connection conn= null;
		PreparedStatement pstm = null;
		
		try {
			conn = ConnectionMySQL.createConnectionMySQL();
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1,usuario.getNome());
			pstm.setString(2,usuario.getEmail());
			pstm.setString(3,usuario.getSenha());

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
	
	public List<Usuarios> read() {
		List<Usuarios> usuarios= new ArrayList<Usuarios>();
		String sql = "SELECT * FROM Usuarios";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			
			conn= ConnectionMySQL.createConnectionMySQL();
			
			pstm= conn.prepareStatement(sql);
			
			rset = pstm.executeQuery();
						
			while(rset.next()) {
				Usuarios usuario  = new Usuarios();
				
				usuario.setId(rset.getInt("id_usuario"));
				usuario.setNome(rset.getString("nome"));
				usuario.setEmail(rset.getString("email"));
				usuario.setSenha(rset.getString("senha"));
				
				usuarios.add(usuario);
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
		return usuarios;
	}
	
	//UPDATE
	
	public void update(Usuarios usuario) {
		String sql = "UPDATE Usuarios SET nome = ?, email = ?, senha = ? WHERE id_usuario = ?;";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = ConnectionMySQL.createConnectionMySQL();
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, usuario.getNome());
			pstm.setString(2, usuario.getEmail());
			pstm.setString(3, usuario.getSenha());
			pstm.setInt(4, usuario.getId());
			
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
	String sql = "DELETE FROM Usuarios WHERE id_usuario = ?";
	
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
	public Usuarios readByID (int Id) {
		Usuarios usuario = new Usuarios ();
		String sql = "select * from Usuarios WHERE id_usuario = ?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			conn = ConnectionMySQL.createConnectionMySQL();
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setInt(1, Id);
			
			rset = pstm.executeQuery();
			
			rset.next();
			
			usuario.setId(rset.getInt("id_usuario"));
			usuario.setNome(rset.getString("nome"));
			usuario.setEmail(rset.getString("email"));
			usuario.setSenha(rset.getString("senha"));

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
			  
				return usuario;
			}	
	}
}

