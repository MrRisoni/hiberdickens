package repositories;

import models.*;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.List;

public class GeneralRepository extends Repository {

    public GeneralRepository()  {
        this.setEntityManager(HibernateUtil.getEM());
    }

    public List<SchoolClass> getClasses(){
        return this.getEntityManager().createQuery("FROM SchoolClass ORDER BY shownOrder ASC",SchoolClass.class).getResultList();
    }

    public List<HourModel> getHours(){
        return this.getEntityManager().createQuery("FROM HourModel ORDER BY id ASC", HourModel.class).getResultList();
    }

    public List<Building> getBuildings()
    {
        CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
        CriteriaQuery<Building> query = builder.createQuery(Building.class);
        Root<Building> grp = query.from(Building.class);
        return this.getEntityManager().createQuery(query).getResultList();
    }

    public List<Language> getLanguages()
    {
      /*  CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
        CriteriaQuery<Language> query = builder.createQuery(Language.class);
        Root<Language> grp = query.from(Language.class);
        return this.getEntityManager().createQuery(query).getResultList(); */

         CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
        CriteriaQuery<Language> query = builder.createQuery(Language.class);
        Root<Language> root = query.from(Language.class);
        Join<Language, Diploma> personJoin = root.join("diplomas");
     //   criteria.where( builder.equal( root.get( Person_.nickName ), nickNameParameter ) );
        query.where(builder.equal(personJoin.get("active"),1));

        return this.getEntityManager().createQuery(query).getResultList();
    }
}
