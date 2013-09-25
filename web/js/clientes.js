/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
   $("#listado").jqGrid({
        url: "/SysNot/ServiceDispatch",
        datatype: "json",
        mtype: "GET",
        colNames: ["Id Cliente", "Razón Social", "Tratamiento", "Nombres", "APaterno"],
        colModel: [
            { name: "idcliente", width: 55 },
            { name: "razonsocial", width: 90 },
            { name: "tratamiento", width: 80, align: "right" },
            { name: "nombres", width: 80, align: "right" },
            { name: "apaterno", width: 80, align: "right" }
        ],
        pager: "#pager",
        rowNum: 10,
        rowList: [10, 20, 30],
        sortname: "idcliente",
        sortorder: "desc",
        viewrecords: true,
        gridview: true,
        autoencode: true,
        caption: "Clientes",
        postData:{serviceName:'sp_clientes_listar'},
        prmNames:{page:"p_page", rows:"p_limit",sort:"p_sidx",order:"p_sord"},
        jsonReader: {
        repeatitems: false,
        id: "idmenu",
        root: function (data) { return data[1]; },
        page: function (data) { return data[0][0].page; },
        total: function (data) { return data[0][0].total; },
        records: function (data) { return data[1].length; }
        },
        loadComplete: function() {
            var grid = $("#listado");
            var ids = grid.getDataIDs();
            for (var i = 0; i < ids.length; i++) {
                grid.setRowData ( ids[i], false, {height: 30} );
            }
        }
    });    
});
