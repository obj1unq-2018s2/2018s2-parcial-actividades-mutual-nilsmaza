

class Viajes{
	
	const property idioma = #{}
	
	method diasDeActividad() 
	
	method esfueszo() 
	
	method produceBronceado() 
	
	method numeroDeIdiomas() = idioma.size()
	
	method esViajeInteresnte() = self.numeroDeIdiomas() > 1
	
	method esReconmendablePara(socio) = 
		self.esViajeInteresnte() and socio.leAtraeLaActividad(self) and not socio.actividadesRealizadas(self)
}

class ViajesPlaya inherits Viajes{
	
	var property largoMts
	
	
	override method diasDeActividad() = largoMts/500  
	
	override method esfueszo() = largoMts >= 1200 
	
	override method produceBronceado() = true
	
	override method esViajeInteresnte() = self.numeroDeIdiomas() > 1
	
}


class ExcurcionACiudad inherits Viajes{
	
	var property atracionesAVisitar
	
	override method diasDeActividad() =  atracionesAVisitar / 2  
	
	override method esfueszo() = self.diasDeActividad() >= 5
	
	override method produceBronceado() = false
	
	override method esViajeInteresnte() =  self.numeroDeIdiomas() > 1 and atracionesAVisitar == 5
	
}

class ExcurcionACiudadTropical inherits ExcurcionACiudad {
	
	override method diasDeActividad() =  atracionesAVisitar / 2  + 1
	
	override method esfueszo() = self.diasDeActividad() > 5
	
	override method produceBronceado() = true
	
}

class SalidaDeTrekking inherits Viajes{
	
	var property kmSendero
	var property salidaDelSolXAnio
	
	override method diasDeActividad() = kmSendero / 50
	
	override method esfueszo() = kmSendero > 80
	
	override method produceBronceado() = salidaDelSolXAnio > 200 or (salidaDelSolXAnio > 100 and kmSendero > 120)
	
	override method esViajeInteresnte() =   self.numeroDeIdiomas() > 1 and salidaDelSolXAnio > 140
	
}

class ClaseDeGimnasia inherits Viajes {
	
	override method diasDeActividad() = 1
	
	override method esfueszo() = true
	
	override method produceBronceado() = false
	
	override method esViajeInteresnte() =   self.numeroDeIdiomas() > 1
	
	override method esReconmendablePara(socio) = socio.edad() > 20 and socio.edad() < 30
	
}

class TallerLiterario inherits Viajes {
	
	var property libros = #{}
	
	override method idioma() = libros.map{libro => libro.idioma()}.asSet()
	
	override method diasDeActividad() = libros.size() + 1
	
	method autores() = libros.map{elem => elem.autor()}
	
	override method esfueszo() =  (self.autores().all{elem => elem.autor()} and libros.size() > 1) or libros.max{libro => libro.paginas()} > 500
	
	override method produceBronceado() = false
	
	override method esReconmendablePara(socio) = socio.idiomasQueHabla().size() > 1
	
}

class Libro{
	
	var property idioma
	var property paginas
	const property autor
	
}

