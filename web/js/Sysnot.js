/* Autor: zder@n
 * Librería de soporte para el front-end del sistema Sysnot
 * Basada en Jquery
 */

var Sysnot = new Object()
Sysnot.webHome = '/SysNot/';

Sysnot.serviceRequest = function (params) {
	if (!params || typeof (params) != 'object') params = {}
	if (typeof (params.onsuccess) != 'function') throw 'Se debe especificar el objeto [params.onsuccess]'
	if (typeof (params.onerror) != 'function') params.onerror = null

	if (!params.services) throw 'Se debe especificar el objeto [params.services]'
	else if ($.isArray(params.services));
	else if (typeof (params.services) == 'object') params.services = [params.services]
	else throw '[params.services] debe ser un Array o un Servicio'
	if (params.services.length == 0) throw '[params.services] debe tener al menos un elemento'
	for (var i in params.services) {
		if (!params.services[i] || typeof (params.services[i]) != 'object') throw '[params.services[i]] debe ser un Servicio'
		if (typeof (params.services[i].SERVICE) != 'string') throw 'Se debe especificar [params.services[i].SERVICE]'
		if (!params.services[i].idsesion) params.services[i].idsesion = '0';//parent.S5.idsesion
	}
	var request = {
		onsuccess: params.onsuccess,
		onerror: params.onerror,
		error: function (jqXHR, textStatus, errorThrown) {
			if (this.onerror == null) {
				var modal = $('<div/>');
				modal.append(document.createTextNode(errorThrown));
				   modal.sDialog({ modal: true });
				return
			}
			this.onerror(errorThrown)
		},
		success: function (data, textStatus, jqXHR) {
			if (this.onsuccess == null) return
                        // Manejar mensaje de excepcion
//			if (data.length >= 23)
//				if (data.substr(data.length - 12, 12) == '</EXCEPTION>') {
//					var i = data.indexOf('<EXCEPTION>')
//					this.error(null, null, eval(data.substr(i + 11, data.length - i - 23)))
//					return
//				}
			this.onsuccess(eval(data))
		},
		data: { SERVICES: params.services.length }
	}
	for (var i = 0; i < params.services.length; i++)
		for (var j in params.services[i])
			if (typeof (params.services[i][j]) != 'undefined' && params.services[i][j] != null)
				request.data[/*"S" + i + "_" +*/ j] = params.services[i][j];//SITRAC5.serializeParam(params.services[i][j])
	$.ajax(Sysnot.webHome + 'ServiceDispatch', request)
}

Sysnot.plugins = function () {
	(function ($) {
            $.fn.sDialog = function (params) {
			if (!params || typeof (params) != 'object') params = {}
			if (!params.show) params.show = 1000
			if (!params.closeOnEscape) params.closeOnEscape = false
			this.dialog(params)
		}
        })(jQuery)
}