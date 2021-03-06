package repositories;

import models.general.Building;
import models.groups.HourModel;
import models.school.SchoolClass;
import models.languages.Diploma;
import models.languages.Language;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.List;

public class GeneralRepository extends Repository {

    public GeneralRepository()  {
    }

    public List<SchoolClass> getClasses(){
        return this.getEntityManager()
                .createQuery("FROM SchoolClass ORDER BY shownOrder ASC", SchoolClass.class)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }

    public List<HourModel> getHours(){
        return this.getEntityManager()
                .createQuery("FROM HourModel ORDER BY id ASC", HourModel.class)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }

    public List<Building> getBuildings()
    {
        CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
        CriteriaQuery<Building> query = builder.createQuery(Building.class);
        Root<Building> grp = query.from(Building.class);
        return this.getEntityManager().createQuery(query)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
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
