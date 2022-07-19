package org.in5bm.jhonatanacalon.alexperez.controllers;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.in5bm.jhonatanacalon.alexperez.db.Conexion;
import org.in5bm.jhonatanacalon.alexperez.models.Usuarios;
import org.in5bm.jhonatanacalon.alexperez.system.Principal;

/**
 * FXML Controller class
 *
 * @author Jhonatan Jose Acalón Ajanel <jacalon-2021048@kinal.edu.gt>
 * @date 19/07/2022
 * @time 07:51:29
 * @codigo IN5BM
 * @jornada Matutina
 * @grupo 1
 */
public class LoginController implements Initializable{
    private Principal escenarioPrincipal;
    private final String PAQUETE_IMAGES="org/in5bm/jhonatanacalon/alexperez/resources/images/";
    
    @FXML
    private PasswordField pfPassword;
    
    @FXML
    private TextField txtUsuario;
    
    @FXML
    private Button btnSesion;
    
    private Usuarios usuarios=new Usuarios();
        
    @Override
    public void initialize(URL url, ResourceBundle rb){
        
    }
    
    public Principal getEscenarioPrincipal(){
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Principal escenarioPrincipal){
        this.escenarioPrincipal=escenarioPrincipal;
    }

    @FXML
    void clicInicio(ActionEvent ae){        
        if((txtUsuario.getText().isEmpty()) || (pfPassword.getText().isEmpty())){
            if(txtUsuario.getText().isEmpty()){
                alertasWarning("Ingrese un usuario");
            }else if(pfPassword.getText().isEmpty()){
                alertasWarning("Ingrese una clave");
            }
        }else{
            if(getUsuarios()){
                if(usuarios.getPass().equals(pfPassword.getText())){
                    if(usuarios.getRolId()==1){
                        alertasWarning("Bienvenido al sistema Administrador");
                        escenarioPrincipal.mostrarEscenaPrincipalLogin(1);
                    }else if(usuarios.getRolId()==2){
                        alertasWarning("Bienvenido al sistema Trabajador");
                        escenarioPrincipal.mostrarEscenaPrincipalLogin(2);
                    }
                }else{
                    alertasWarning("La contraseña es incorrecta");
                }
            }else{
                alertasWarning("El usuario ingresado no existe");
            }
        }
    }
    
    private boolean getUsuarios(){
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        try{
            pstmt=Conexion.getInstance().getConexion()
                    .prepareCall("{CALL sp_usuarios_read(?)}");
            pstmt.setString(1, txtUsuario.getText().toLowerCase());
            System.out.println(pstmt.toString());
            rs=pstmt.executeQuery();
            while(rs.next()){
                usuarios.setUser(rs.getString(1));
                usuarios.setPass(rs.getString(2));
                usuarios.setNombre(rs.getString(3));
                usuarios.setRolId(rs.getInt(4));
                return true;
            }
        }catch(SQLException e){
            System.err.println("\nSe produjo un error al consultar la tabla de Usuarios\n");
            System.out.println("Message: " + e.getMessage());
            System.out.println("Error code: " + e.getErrorCode());
            System.out.println("SQLState: " + e.getSQLState());
            e.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if((rs != null) && (pstmt!=null)){
                    rs.close();
                    pstmt.close();
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return false;
    }

    private void alertasWarning(String mensaje){
        Alert alerta=new Alert(Alert.AlertType.WARNING);
        alerta.setTitle("Control Académico - AVISO!!!");
        alerta.setHeaderText(null);
        alerta.setContentText(mensaje);
        alerta.show();
        Stage stage=(Stage) alerta.getDialogPane().getScene().getWindow();
        Image ico=new Image(PAQUETE_IMAGES+"icono.png");
        stage.getIcons().add(ico);
    }
}