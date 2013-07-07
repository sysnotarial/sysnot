/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sysnot.modelo.common;

import java.util.List;

/**
 *
 * @author mtrejo
 */
final public class Listado{
    private final List<?> lista;
    private final int total;
    private final int totalPages;

    public List<?> getLista() {
        return lista;
    }

    public int getTotal() {
        return total;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public Listado(List<?> lista, int total, int totalPages) {
        this.lista = lista;
        this.total = total;
        this.totalPages = totalPages;
    }


}
