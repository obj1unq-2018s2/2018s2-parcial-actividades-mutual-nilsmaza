import viajes.*

class Socio{
	
	var property leAgradaElSol // bool
	var property actividadesRealizadas = #{}
	var property maximoDeActividades // numero
	const property edad // numero
	var property idiomasQueHabla = #{}
	
	method leAgradaElSol() = leAgradaElSol
	
	method numerosDeActividadesHechas() = actividadesRealizadas.size()

	
	method actividadesEsforzadas() = actividadesRealizadas.filter{elem => elem.esfueszo()}
	
	method registraActividad(actividad) {if(self.numerosDeActividadesHechas() >= maximoDeActividades){
		self.error("ya llego a su maximo de actividades")}
			else
			{ actividadesRealizadas.add(actividad) }
	}
	
	method socioTranquilo(viaje) = viaje.diasDeActividad() >= 4
	
	method socioCoherente(viaje) = if(self.leAgradaElSol()) viaje.produceBronceado()
				else viaje.esfueszo()
	
	method socioRelajado(viaje) = idiomasQueHabla.equals(viaje.idioma())
	
	method leAtraeLaActividad(viaje) = self.socioTranquilo(viaje) or self.socioRelajado(viaje) or self.socioCoherente(viaje)

}


