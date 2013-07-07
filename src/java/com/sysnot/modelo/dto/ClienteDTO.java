/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sysnot.modelo.dto;

import com.google.gson.annotations.Expose;
import java.util.Date;

/**
 *
 * @author sderan
 */
public class ClienteDTO {
  @Expose private Integer idcliente;
  @Expose private String regimenfiscal;
  @Expose private String razonsocial;
  @Expose private String siglas;
  @Expose private String trtamiento;
  @Expose private String nombres;
  @Expose private String apaterno;
  @Expose private String amaterno;
  @Expose private String otronombre;
  @Expose private String nombreactmat;
  @Expose private String nombreotrosdocs;
  @Expose private String sexo;
  @Expose private String rfc;
  @Expose private String curp;
  @Expose private String nss;
  @Expose private String edocivil;
  @Expose private String regimenmat;
  @Expose private String folioactmat;
  @Expose private String actamat;
  @Expose private Integer libroactamat;
  @Expose private Date fechaactamat;
  @Expose private String lugaractamat;
  @Expose private String ciudadnac;
  @Expose private String estadonac;
  @Expose private String paisnac;
  @Expose private Date fechanac;
  public ClienteDTO(Integer idcliente, String regimenfiscal, String razonsocial, String siglas, String trtamiento, String nombres, String apaterno, String amaterno, String otronombre, String nombreactmat, String nombreotrosdocs, String sexo, String rfc, String curp, String nss, String edocivil, String regimenmat, String folioactmat, String actamat, Integer libroactamat, Date fechaactamat, String lugaractamat, String ciudadnac, String estadonac, String paisnac, Date fechanac) {
        this.idcliente = idcliente;
        this.regimenfiscal = regimenfiscal;
        this.razonsocial = razonsocial;
        this.siglas = siglas;
        this.trtamiento = trtamiento;
        this.nombres = nombres;
        this.apaterno = apaterno;
        this.amaterno = amaterno;
        this.otronombre = otronombre;
        this.nombreactmat = nombreactmat;
        this.nombreotrosdocs = nombreotrosdocs;
        this.sexo = sexo;
        this.rfc = rfc;
        this.curp = curp;
        this.nss = nss;
        this.edocivil = edocivil;
        this.regimenmat = regimenmat;
        this.folioactmat = folioactmat;
        this.actamat = actamat;
        this.libroactamat = libroactamat;
        this.fechaactamat = fechaactamat;
        this.lugaractamat = lugaractamat;
        this.ciudadnac = ciudadnac;
        this.estadonac = estadonac;
        this.paisnac = paisnac;
        this.fechanac = fechanac;
    }

    public ClienteDTO() {
    }

    public Integer getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public String getRegimenfiscal() {
        return regimenfiscal;
    }

    public void setRegimenfiscal(String regimenfiscal) {
        this.regimenfiscal = regimenfiscal;
    }

    public String getRazonsocial() {
        return razonsocial;
    }

    public void setRazonsocial(String razonsocial) {
        this.razonsocial = razonsocial;
    }

    public String getSiglas() {
        return siglas;
    }

    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    public String getTrtamiento() {
        return trtamiento;
    }

    public void setTrtamiento(String trtamiento) {
        this.trtamiento = trtamiento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApaterno() {
        return apaterno;
    }

    public void setApaterno(String apaterno) {
        this.apaterno = apaterno;
    }

    public String getAmaterno() {
        return amaterno;
    }

    public void setAmaterno(String amaterno) {
        this.amaterno = amaterno;
    }

    public String getOtronombre() {
        return otronombre;
    }

    public void setOtronombre(String otronombre) {
        this.otronombre = otronombre;
    }

    public String getNombreactmat() {
        return nombreactmat;
    }

    public void setNombreactmat(String nombreactmat) {
        this.nombreactmat = nombreactmat;
    }

    public String getNombreotrosdocs() {
        return nombreotrosdocs;
    }

    public void setNombreotrosdocs(String nombreotrosdocs) {
        this.nombreotrosdocs = nombreotrosdocs;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getNss() {
        return nss;
    }

    public void setNss(String nss) {
        this.nss = nss;
    }

    public String getEdocivil() {
        return edocivil;
    }

    public void setEdocivil(String edocivil) {
        this.edocivil = edocivil;
    }

    public String getRegimenmat() {
        return regimenmat;
    }

    public void setRegimenmat(String regimenmat) {
        this.regimenmat = regimenmat;
    }

    public String getFolioactmat() {
        return folioactmat;
    }

    public void setFolioactmat(String folioactmat) {
        this.folioactmat = folioactmat;
    }

    public String getActamat() {
        return actamat;
    }

    public void setActamat(String actamat) {
        this.actamat = actamat;
    }

    public Integer getLibroactamat() {
        return libroactamat;
    }

    public void setLibroactamat(Integer libroactamat) {
        this.libroactamat = libroactamat;
    }

    public Date getFechaactamat() {
        return fechaactamat;
    }

    public void setFechaactamat(Date fechaactamat) {
        this.fechaactamat = fechaactamat;
    }

    public String getLugaractamat() {
        return lugaractamat;
    }

    public void setLugaractamat(String lugaractamat) {
        this.lugaractamat = lugaractamat;
    }

    public String getCiudadnac() {
        return ciudadnac;
    }

    public void setCiudadnac(String ciudadnac) {
        this.ciudadnac = ciudadnac;
    }

    public String getEstadonac() {
        return estadonac;
    }

    public void setEstadonac(String estadonac) {
        this.estadonac = estadonac;
    }

    public String getPaisnac() {
        return paisnac;
    }

    public void setPaisnac(String paisnac) {
        this.paisnac = paisnac;
    }

    public Date getFechanac() {
        return fechanac;
    }

    public void setFechanac(Date fechanac) {
        this.fechanac = fechanac;
    } 
}
