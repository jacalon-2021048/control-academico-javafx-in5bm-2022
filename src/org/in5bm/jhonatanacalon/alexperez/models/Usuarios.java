package org.in5bm.jhonatanacalon.alexperez.models;

/**
 *
 * @author Jhonatan Jose Acalón Ajanel <jacalon-2021048@kinal.edu.gt>
 * @date 19/07/2022
 * @time 08:20:48
 * @codigo IN5BM
 * @jornada Matutina
 * @grupo 1
 */
public class Usuarios{
    private String user;
    private String pass;
    private String nombre;
    private int rolId;
    
    public Usuarios(){
        
    }

    public String getUser(){
        return user;
    }

    public void setUser(String user){
        this.user=user;
    }

    public String getPass(){
        return pass;
    }

    public void setPass(String pass){
        this.pass=pass;
    }

    public String getNombre(){
        return nombre;
    }

    public void setNombre(String nombre){
        this.nombre=nombre;
    }

    public int getRolId(){
        return rolId;
    }

    public void setRolId(int rolId){
        this.rolId = rolId;
    }
}