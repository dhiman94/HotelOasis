// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.hoteloasis.domain;

import es.uca.iw.hoteloasis.domain.Bebida;
import es.uca.iw.hoteloasis.domain.Categoria;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Bebida_Roo_Finder {
    
    public static Long Bebida.countFindBebidasByCategoria(Categoria categoria) {
        if (categoria == null) throw new IllegalArgumentException("The categoria argument is required");
        EntityManager em = Bebida.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Bebida AS o WHERE o.categoria = :categoria", Long.class);
        q.setParameter("categoria", categoria);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Bebida> Bebida.findBebidasByCategoria(Categoria categoria) {
        if (categoria == null) throw new IllegalArgumentException("The categoria argument is required");
        EntityManager em = Bebida.entityManager();
        TypedQuery<Bebida> q = em.createQuery("SELECT o FROM Bebida AS o WHERE o.categoria = :categoria", Bebida.class);
        q.setParameter("categoria", categoria);
        return q;
    }
    
    public static TypedQuery<Bebida> Bebida.findBebidasByCategoria(Categoria categoria, String sortFieldName, String sortOrder) {
        if (categoria == null) throw new IllegalArgumentException("The categoria argument is required");
        EntityManager em = Bebida.entityManager();
        String jpaQuery = "SELECT o FROM Bebida AS o WHERE o.categoria = :categoria";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        TypedQuery<Bebida> q = em.createQuery(jpaQuery, Bebida.class);
        q.setParameter("categoria", categoria);
        return q;
    }
    
}
