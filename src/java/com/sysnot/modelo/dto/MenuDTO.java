/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sysnot.modelo.dto;

import com.google.gson.annotations.Expose;

/**
 *
 * @author zderan
 */
public class MenuDTO {
    @Expose private Integer idMenu;
    @Expose private String titulo;
    @Expose private Integer nivel;
    @Expose private Integer idPadre;
    @Expose private String rutaIcono;
    @Expose private String url;
    @Expose private Integer orden;
            private Integer idAccion;
    @Expose private String habilitado; 
    
    public MenuDTO(Integer idMenu,
            String titulo,
            Integer nivel,
            Integer idPadre,
            String rutaIcono,
            String url,
            Integer orden,
            Integer idAccion,
            String habilitado){
        this.idMenu = idMenu;
        this.titulo = titulo;
        this.nivel = nivel;
        this.idPadre = idPadre;
        this.rutaIcono = rutaIcono;
        this.url = url;
        this.orden = orden;
        this.idAccion = idAccion;
        this.habilitado = habilitado;
    }
    
    public MenuDTO(){
    }
    
    public Integer getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(Integer idMenu) {
        this.idMenu = idMenu;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Integer getNivel() {
        return nivel;
    }

    public void setNivel(Integer nivel) {
        this.nivel = nivel;
    }

    public Integer getIdPadre() {
        return idPadre;
    }

    public void setIdPadre(Integer idPadre) {
        this.idPadre = idPadre;
    }

    public String getRutaIcono() {
        return rutaIcono;
    }

    public void setRutaIcono(String rutaIcono) {
        this.rutaIcono = rutaIcono;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getOrden() {
        return orden;
    }

    public void setOrden(Integer orden) {
        this.orden = orden;
    }

    public Integer getIdAccion() {
        return idAccion;
    }

    public void setIdAccion(Integer idAccion) {
        this.idAccion = idAccion;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }    
}
