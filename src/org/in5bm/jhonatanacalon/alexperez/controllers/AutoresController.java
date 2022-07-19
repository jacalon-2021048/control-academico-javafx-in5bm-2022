package org.in5bm.jhonatanacalon.alexperez.controllers;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import org.in5bm.jhonatanacalon.alexperez.system.Principal;

/**
 *
 * @author Jhonatan Jose Acalón Ajanel <jacalon-2021048@kinal.edu.gt>
 * @date 27/06/2022
 * @time 16:50:46
 * @codigo IN5BM
 * @jornada Matutina
 * @grupo 1
 */
public class AutoresController implements Initializable{
    private Principal escenarioPrincipal;
    @FXML
    private ImageView imgRegresar;
    @FXML
    private Button botonCerrar;
    
    @FXML
    void clicRegresar(MouseEvent me){
        escenarioPrincipal.mostrarEscenaPrincipal();
    }
    
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
    void clicCerrar(ActionEvent ae){
        System.exit(0);
    }
}