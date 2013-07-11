/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sysnot.control;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sysnot.modelo.MenuManager;
import com.sysnot.modelo.common.Listado;
import com.sysnot.modelo.dto.MenuDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author zderan
 */
public class MenuDispatchAction extends DispatchAction{
    
    public ActionForward  getMenuUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter writer;
        List<MenuDTO> lst;
        int idUsuario = 0;
        Listado listado = null;
        Gson gson;
         
        if (request.getParameter("idUsuario") != null || request.getParameter("idUsuario").length() > 0) {
            idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        }
        try {
            writer = response.getWriter();
            MenuManager menuManager = new MenuManager();
            listado = menuManager.getMenuUsuario(idUsuario);
            lst = (List<MenuDTO>) listado.getLista();
            
            gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();            
            writer.write(gson.toJson(lst));
            writer.flush();
            writer.close();
        } catch (IOException ex) {
            Logger.getLogger(MenuDispatchAction.class.getName()).log(Level.SEVERE, null, ex);
        }        
        return mapping.findForward(null);
    }
}
