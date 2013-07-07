/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sysnot.jqgrid;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonParseException;
import com.google.gson.annotations.Expose;
import java.util.ArrayList;

/**
 *
 * @author mtrejo
 */
public class JQGrid {

    @Expose
    private int page, total, records;
    @Expose
    private ArrayList<Object> rows;

    public JQGrid() {
        super();
        this.setRows(new ArrayList<Object>());
    }

    public JQGrid(int page, int records, int total) {
        this();
        this.page = page;
        this.records = records;
        this.total = total;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getRecords() {
        return records;
    }

    public void setRecords(int records) {
        this.records = records;
    }

    public ArrayList<Object> getRows() {
        return rows;
    }

    public void setRows(ArrayList<Object> rows) {
        this.rows = rows;
    }

    public String toJSON() throws JsonParseException {
        Gson gson;
        gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").excludeFieldsWithoutExposeAnnotation().create();
        return gson.toJson(this);
    }

    public static JQGrid fromJSON(String value) throws JsonParseException {
        JQGrid obj;
        Gson gson;
        gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
        obj = gson.fromJson(value, JQGrid.class);
        return obj;
    }
}
