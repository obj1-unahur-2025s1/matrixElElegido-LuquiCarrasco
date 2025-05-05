object neo {
    var energia = 100
    method saltar() = energia * 0.5 
    method vitalidad() = energia * 0.1 
    method elegido() = true 
}

object morfeo {
    var vitalidad = 8
    var estaDescansado= true
    
    method elegido() = false

    method vitalidad() = vitalidad

    method saltar(){
        estaDescansado = not estaDescansado
        vitalidad = (vitalidad - 1).max(0)
    } 
}

object trinity {
    method vitalidad() = 0
    method elegido() = false
}

object nave {
    const pasajeros = [neo , morfeo, trinity]

    method cantPasajero() = pasajeros.size()
    method pasajeroMasVitalidad() = pasajeros.max({p => p.vitalidad()})
    method pasajeroMenosVitalidad() = pasajeros.min({p =>p.vitalidad()})
    method estaEquilibrada(){
        return self.pasajeroMasVitalidad().vitalidad() < self.pasajeroMenosVitalidad().vitalidad() * 2
    }
    method estaElegido() = pasajeros.any({p => p.elegido()})
    
    method chocar(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }

    method acelerar(){
        pasajeros.filter({p => not p.elegido()}).forEach({p => p.saltar()})
        pasajeros.remove(neo)
    }        

}