package org.in5bm.jhonatanacalon.alexperez.controllers;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextInputDialog;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import org.in5bm.jhonatanacalon.alexperez.reports.GenerarReporte;
import org.in5bm.jhonatanacalon.alexperez.system.Principal;

/**
 *
 * @author Jhonatan Jose Acalón Ajanel <jacalon-2021048@kinal.edu.gt>
 * @author Alex Gabriel Pérez Dubon <aperez-2021095@kinal.edu.gt>
 * @date 27/04/2022
 * @time 21:23:17
 * @codigo IN5BM
 * @jornada Matutina
 * @grupo 1
 */
public class MenuPrincipalController implements Initializable{
    private Principal escenarioPrincipal;
    
    private final String PAQUETE_IMAGES="org/in5bm/jhonatanacalon/alexperez/resources/images/";

    @FXML
    private Button btnAlumnos;

    @FXML
    private Button btnInstructores;

    @FXML
    private Button btnSalones;

    @FXML
    private Button btnCarreras;

    @FXML
    private Button btnHorarios;

    @FXML
    private Button btnCursos;

    @FXML
    private Button btnAsignacion;

    @FXML
    private Button btnAcercaDe;
    
    private static int rol;
    
    @Override
    public void initialize(URL arg0, ResourceBundle arg1){
        
    }
    
    @FXML
    void clicPrincipal(ActionEvent ae){
        if (validacionRol()) {
            if (ae.getSource().equals(btnAlumnos)) {
                escenarioPrincipal.mostrarEscenaAlumnos();
            } else if (ae.getSource().equals(btnInstructores)) {
                escenarioPrincipal.mostrarEscenaInstructores();
            } else if (ae.getSource().equals(btnSalones)) {
                escenarioPrincipal.mostrarEscenaSalones();
            } else if (ae.getSource().equals(btnCarreras)) {
                escenarioPrincipal.mostrarEscenaCarreras();
            } else if (ae.getSource().equals(btnHorarios)) {
                escenarioPrincipal.mostrarEscenaHorarios();
            } else if (ae.getSource().equals(btnCursos)) {
                escenarioPrincipal.mostrarEscenaCursos();
            } else if (ae.getSource().equals(btnAsignacion)) {
                escenarioPrincipal.mostrarEscenaAsignaciones();
            } else if (ae.getSource().equals(btnAcercaDe)) {
                escenarioPrincipal.mostrarEscenaInfo();
            }
        } else {
            if (ae.getSource().equals(btnAlumnos)) {
                alertaAcceso("NO puede ingresar a esta pantalla");
            } else if (ae.getSource().equals(btnInstructores)) {
                alertaAcceso("NO puede ingresar a esta pantalla");
            } else if (ae.getSource().equals(btnSalones)) {
                alertaAcceso("NO puede ingresar a esta pantalla");
            } else if (ae.getSource().equals(btnCarreras)) {
                alertaAcceso("NO puede ingresar a esta pantalla");
            } else if (ae.getSource().equals(btnHorarios)) {
                alertaAcceso("NO puede ingresar a esta pantalla");
            } else if (ae.getSource().equals(btnCursos)) {
                escenarioPrincipal.mostrarEscenaCursos();
            } else if (ae.getSource().equals(btnAsignacion)) {
                escenarioPrincipal.mostrarEscenaAsignaciones();
            } else if (ae.getSource().equals(btnAcercaDe)) {
                escenarioPrincipal.mostrarEscenaInfo();
            }
        } 
    }
    
    private boolean validacionRol(){
        return rol==1;
    }
    
    public Principal getEscenarioPrincipal(){
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Principal escenarioPrincipal){
        this.escenarioPrincipal=escenarioPrincipal;
    }
    
    public void setRol(int rol){
        MenuPrincipalController.rol=rol;
    }

    @FXML
    void clicReporteAlumnos(ActionEvent ae){
        Map<String,Object> parametros=new HashMap<>();
        parametros.put("IMAGE_ENTIDAD",PAQUETE_IMAGES+"alumno.png");        
        GenerarReporte.getInstance().mostrarReporte("ReporteAlumnos.jasper",parametros,"Reporte de Alumnos");
    }

    @FXML
    void clicReporteInstructores(ActionEvent ae){
        Map<String,Object> parametros=new HashMap<>();
        parametros.put("IMAGE_ENTIDAD",PAQUETE_IMAGES+"maestro.png");
        GenerarReporte.getInstance().mostrarReporte("ReporteInstructores.jasper",parametros,"Reporte de Instructores");
    }

    @FXML
    void clicReporteSalones(ActionEvent ae){
        Map<String,Object> parametros=new HashMap<>();
        parametros.put("IMAGE_ENTIDAD",PAQUETE_IMAGES+"salon.png");
        GenerarReporte.getInstance().mostrarReporte("ReporteSalones.jasper",parametros,"Reporte de Salones");
    }

    @FXML
    void clicReporteCarreras(ActionEvent ae){
        Map<String,Object> parametros=new HashMap<>();
        parametros.put("IMAGE_ENTIDAD",PAQUETE_IMAGES+"carrera-profesional.png");
        GenerarReporte.getInstance().mostrarReporte("ReporteCarreras.jasper",parametros,"Reporte de Carreras");
    }

    @FXML
    void clicReporteHorarios(ActionEvent ae){
        Map<String,Object> parametros=new HashMap<>();
        parametros.put("IMAGE_ENTIDAD",PAQUETE_IMAGES+"horario.png");
        GenerarReporte.getInstance().mostrarReporte("ReporteHorarios.jasper",parametros,"Reporte de Horarios");
    }

    @FXML
    void clicReporteCursos(ActionEvent ae){
        Map<String,Object> parametros=new HashMap<>();
        parametros.put("IMAGE_ENTIDAD",PAQUETE_IMAGES+"cursos.png");
        GenerarReporte.getInstance().mostrarReporte("ReporteCursos.jasper",parametros,"Reporte de Cursos");
    }

    @FXML
    void clicReporteCursosId(ActionEvent ae){
        Map<String,Object> parametros=new HashMap<>();
        TextInputDialog tDialog=new TextInputDialog();
        tDialog.setTitle("Control Académico - AVISO!!!");
        tDialog.setHeaderText(null);
        tDialog.setContentText("Ingrese el ID que desea ver en el reporte");
        Stage stage=(Stage) tDialog.getDialogPane().getScene().getWindow();
        Image ico=new Image(PAQUETE_IMAGES+"icono.png");
        stage.getIcons().add(ico);
        Optional<String> resultado=tDialog.showAndWait();
        resultado.ifPresent(numero -> {
            try{
               Integer num= Integer.parseInt(numero);                              
               parametros.put("idReporte",num);
               parametros.put("IMAGE_ENTIDAD",PAQUETE_IMAGES+"cursos.png");
               GenerarReporte.getInstance().mostrarReporte("ReporteCursosPorId.jasper",parametros,"Reporte de Cursos");
            }catch(NumberFormatException e){
                alertaId();
            }
        });                
    }

    @FXML
    void clicReporteAsignaciones(ActionEvent ae){
        Map<String,Object> parametros=new HashMap<>();
        parametros.put("IMAGE_ENTIDAD",PAQUETE_IMAGES+"asignacion.png");
        GenerarReporte.getInstance().mostrarReporte("ReporteAsignaciones.jasper",parametros,"Reporte de Asignaciones");
    }

    @FXML
    void clicReporteAsignacionesId(ActionEvent ae){
        Map<String,Object> parametros=new HashMap<>();
        TextInputDialog tDialog=new TextInputDialog();
        tDialog.setTitle("Control Académico - AVISO!!!");
        tDialog.setHeaderText(null);
        tDialog.setContentText("Ingrese el ID que desea ver en el reporte");
        Stage stage=(Stage) tDialog.getDialogPane().getScene().getWindow();
        Image ico=new Image(PAQUETE_IMAGES+"icono.png");
        stage.getIcons().add(ico);
        Optional<String> resultado=tDialog.showAndWait();
        resultado.ifPresent(numero -> {
            try{
               Integer num= Integer.parseInt(numero);
               parametros.put("idReporte",num);
               parametros.put("IMAGE_ENTIDAD",PAQUETE_IMAGES+"asignacion.png");        
               GenerarReporte.getInstance().mostrarReporte("ReporteAsignacionesPorId.jasper",parametros,"Reporte de Asignaciones");
            }catch(NumberFormatException e){
                alertaId();
            }
        });
    }
    
    private void alertaAcceso(String mensaje){
        Alert alerta=new Alert(Alert.AlertType.ERROR);
        alerta.setTitle("Control Académico - AVISO!!!");
        alerta.setHeaderText(null);
        alerta.setContentText(mensaje);
        alerta.show();
        Stage stage=(Stage) alerta.getDialogPane().getScene().getWindow();
        Image ico=new Image(PAQUETE_IMAGES + "icono.png");
        stage.getIcons().add(ico);
    }    
    
    private void alertaId(){
        Alert alerta=new Alert(Alert.AlertType.WARNING);
        alerta.setTitle("Control Académico - AVISO!!!");
        alerta.setHeaderText(null);
        alerta.setContentText("Ingrese un valor númerico");
        alerta.show();
        Stage stage=(Stage) alerta.getDialogPane().getScene().getWindow();
        Image ico=new Image(PAQUETE_IMAGES + "icono.png");
        stage.getIcons().add(ico);
    }

    @FXML
    void clicLogin(ActionEvent ae){
        escenarioPrincipal.mostrarEscenaLogin();
    }
}