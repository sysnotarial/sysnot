/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sysnot.control;

import com.sysnot.jqgrid.JQGrid;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionMapping;

import com.sysnot.modelo.ClientesManager;
import com.sysnot.modelo.common.Listado;
import com.sysnot.modelo.dto.ClienteDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtilsBean;
import org.apache.commons.beanutils.PropertyUtilsBean;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

/**
 *
 * @author sderan
 */
public class ClientesDispatchAction extends DispatchAction {

    public ActionForward registrar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        try {
            ClienteDTO dto = new ClienteDTO();
            DateTimeConverter dtConverter = new DateConverter();
            dtConverter.setPattern("dd/MM/yyyy");
            ConvertUtilsBean convertUtilsBean = new ConvertUtilsBean();
            convertUtilsBean.register(dtConverter, Date.class);

            BeanUtilsBean beanUtilsBean = new BeanUtilsBean(convertUtilsBean, new PropertyUtilsBean());
            beanUtilsBean.copyProperties(dto, form);

            ClientesManager clienteManager = new ClientesManager();
            clienteManager.registrar(dto);


        } catch (IllegalAccessException ex) {
            Logger.getLogger(ClientesDispatchAction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ClientesDispatchAction.class.getName()).log(Level.SEVERE, null, ex);
        }

        return mapping.findForward(null);
    }

    public ActionForward editar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        try {
            ClienteDTO dto = new ClienteDTO();
            DateTimeConverter dtConverter = new DateConverter();
            dtConverter.setPattern("dd/MM/yyyy");
            ConvertUtilsBean convertUtilsBean = new ConvertUtilsBean();
            convertUtilsBean.register(dtConverter, Date.class);

            BeanUtilsBean beanUtilsBean = new BeanUtilsBean(convertUtilsBean, new PropertyUtilsBean());
            beanUtilsBean.copyProperties(dto, form);

            ClientesManager clienteManager = new ClientesManager();
            clienteManager.registrar(dto);


        } catch (IllegalAccessException ex) {
            Logger.getLogger(ClientesDispatchAction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ClientesDispatchAction.class.getName()).log(Level.SEVERE, null, ex);
        }

        return mapping.findForward(null);
    }

    public ActionForward getClientes(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter writer;
        JQGrid grid;
        List<ClienteDTO> lst;
        Iterator<ClienteDTO> iterator;
        ClienteDTO cliente;
        ClienteDTO dto = new ClienteDTO();
        dto.setNombres(request.getParameter("nombres"));
        int page, limit;
        String sord, json, sidx;
        int totalPages=0;
        int count=0;
        ClientesManager clienteManager = new ClientesManager();
        Listado listado = null;

        if (request.getParameter("page") == null || request.getParameter("page").length() == 0) {
            page = 1;
        } else {
            page = Integer.valueOf(request.getParameter("page")).intValue();
        }

        if (request.getParameter("rows") == null || request.getParameter("rows").length() == 0) {
            limit = 0;
        } else {
            limit = Integer.valueOf(request.getParameter("rows")).intValue();
        }

        if (request.getParameter("sidx") == null || request.getParameter("sidx").length() == 0) {
            sidx = "nombres";
        } else {
            sidx = request.getParameter("sidx");
        }

        if (request.getParameter("sord") == null || request.getParameter("sord").length() == 0) {
            sord = "asc";
        } else {
            sord = request.getParameter("sord");
        }
        sidx = sidx.substring(0, 1).toUpperCase() + sidx.substring(1);
        try {
            writer = response.getWriter();
            listado = clienteManager.getClientes(dto,page,limit,sidx,sord);
            lst = (List<ClienteDTO>) listado.getLista();
            count = listado.getTotal();
            totalPages=listado.getTotalPages();

            grid = new JQGrid(page, count, totalPages);

            if (lst != null && !lst.isEmpty()) {
                iterator = lst.iterator();
                while (iterator.hasNext()) {
                    cliente = iterator.next();
                    grid.getRows().add(cliente);
                }
            }
            json = grid.toJSON();
            writer.write(json);

        } catch (IOException ex) {
            Logger.getLogger(ClientesDispatchAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mapping.findForward(null);
    }

    public ActionForward eliminar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        try {
            ClienteDTO dto = new ClienteDTO();
            DateTimeConverter dtConverter = new DateConverter();
            dtConverter.setPattern("dd/MM/yyyy");
            ConvertUtilsBean convertUtilsBean = new ConvertUtilsBean();
            convertUtilsBean
                    .register(dtConverter, Date.class);

            BeanUtilsBean beanUtilsBean = new BeanUtilsBean(convertUtilsBean, new PropertyUtilsBean());

            beanUtilsBean.copyProperties(dto, form);
            ClientesManager clienteManager = new ClientesManager();

            clienteManager.registrar(dto);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(ClientesDispatchAction.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ClientesDispatchAction.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        return mapping.findForward(null);
    }
}
