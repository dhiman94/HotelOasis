// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.hoteloasis.domain;

import es.uca.iw.hoteloasis.domain.Estancia;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Estancia_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Estancia.entityManager;
    
    public static final List<String> Estancia.fieldNames4OrderClauseFilter = java.util.Arrays.asList("fecha_check_in", "fecha_check_out", "reserva", "habitacion", "usuario");
    
    public static final EntityManager Estancia.entityManager() {
        EntityManager em = new Estancia().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Estancia.countEstancias() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Estancia o", Long.class).getSingleResult();
    }
    
    public static List<Estancia> Estancia.findAllEstancias() {
        return entityManager().createQuery("SELECT o FROM Estancia o", Estancia.class).getResultList();
    }
    
    public static List<Estancia> Estancia.findAllEstancias(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Estancia o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Estancia.class).getResultList();
    }
    
    public static Estancia Estancia.findEstancia(Long id) {
        if (id == null) return null;
        return entityManager().find(Estancia.class, id);
    }
    
    public static List<Estancia> Estancia.findEstanciaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Estancia o", Estancia.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Estancia> Estancia.findEstanciaEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Estancia o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Estancia.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Estancia.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Estancia.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Estancia attached = Estancia.findEstancia(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Estancia.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Estancia.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Estancia Estancia.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Estancia merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
