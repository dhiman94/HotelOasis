// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.hoteloasis.domain;

import es.uca.iw.hoteloasis.domain.Hotel;
import es.uca.iw.hoteloasis.domain.HotelDataOnDemand;
import es.uca.iw.hoteloasis.domain.TarifaDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect HotelDataOnDemand_Roo_DataOnDemand {
    
    declare @type: HotelDataOnDemand: @Component;
    
    private Random HotelDataOnDemand.rnd = new SecureRandom();
    
    private List<Hotel> HotelDataOnDemand.data;
    
    @Autowired
    TarifaDataOnDemand HotelDataOnDemand.tarifaDataOnDemand;
    
    public Hotel HotelDataOnDemand.getNewTransientHotel(int index) {
        Hotel obj = new Hotel();
        setDias_antelacion(obj, index);
        setDias_maximos(obj, index);
        setDireccion(obj, index);
        setEstrellas(obj, index);
        setNombre(obj, index);
        setPoblacion(obj, index);
        setPrecio_cama_sup(obj, index);
        setPrecio_hab_doble(obj, index);
        setPrecio_hab_simple(obj, index);
        setProvincia(obj, index);
        setTelefono(obj, index);
        return obj;
    }
    
    public void HotelDataOnDemand.setDias_antelacion(Hotel obj, int index) {
        int dias_antelacion = index;
        obj.setDias_antelacion(dias_antelacion);
    }
    
    public void HotelDataOnDemand.setDias_maximos(Hotel obj, int index) {
        int dias_maximos = index;
        obj.setDias_maximos(dias_maximos);
    }
    
    public void HotelDataOnDemand.setDireccion(Hotel obj, int index) {
        String direccion = "direccion_" + index;
        if (direccion.length() > 30) {
            direccion = direccion.substring(0, 30);
        }
        obj.setDireccion(direccion);
    }
    
    public void HotelDataOnDemand.setEstrellas(Hotel obj, int index) {
        int estrellas = index;
        obj.setEstrellas(estrellas);
    }
    
    public void HotelDataOnDemand.setNombre(Hotel obj, int index) {
        String nombre = "nombre_" + index;
        if (nombre.length() > 30) {
            nombre = nombre.substring(0, 30);
        }
        obj.setNombre(nombre);
    }
    
    public void HotelDataOnDemand.setPoblacion(Hotel obj, int index) {
        String poblacion = "poblacion_" + index;
        if (poblacion.length() > 30) {
            poblacion = poblacion.substring(0, 30);
        }
        obj.setPoblacion(poblacion);
    }
    
    public void HotelDataOnDemand.setPrecio_cama_sup(Hotel obj, int index) {
        double precio_cama_sup = new Integer(index).doubleValue();
        obj.setPrecio_cama_sup(precio_cama_sup);
    }
    
    public void HotelDataOnDemand.setPrecio_hab_doble(Hotel obj, int index) {
        double precio_hab_doble = new Integer(index).doubleValue();
        obj.setPrecio_hab_doble(precio_hab_doble);
    }
    
    public void HotelDataOnDemand.setPrecio_hab_simple(Hotel obj, int index) {
        double precio_hab_simple = new Integer(index).doubleValue();
        obj.setPrecio_hab_simple(precio_hab_simple);
    }
    
    public void HotelDataOnDemand.setProvincia(Hotel obj, int index) {
        String provincia = "provincia_" + index;
        if (provincia.length() > 30) {
            provincia = provincia.substring(0, 30);
        }
        obj.setProvincia(provincia);
    }
    
    public void HotelDataOnDemand.setTelefono(Hotel obj, int index) {
        String telefono = "telefono_" + index;
        if (telefono.length() > 20) {
            telefono = telefono.substring(0, 20);
        }
        obj.setTelefono(telefono);
    }
    
    public Hotel HotelDataOnDemand.getSpecificHotel(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Hotel obj = data.get(index);
        Long id = obj.getId();
        return Hotel.findHotel(id);
    }
    
    public Hotel HotelDataOnDemand.getRandomHotel() {
        init();
        Hotel obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Hotel.findHotel(id);
    }
    
    public boolean HotelDataOnDemand.modifyHotel(Hotel obj) {
        return false;
    }
    
    public void HotelDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Hotel.findHotelEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Hotel' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Hotel>();
        for (int i = 0; i < 10; i++) {
            Hotel obj = getNewTransientHotel(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
