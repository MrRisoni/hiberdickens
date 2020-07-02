package repositories;

import models.*;

import java.util.List;

public class GeneralRepository extends Repository {

    public GeneralRepository() {
    }

    public List<SchoolClass> getClasses(){
        return this.getEntityManager().createQuery("FROM SchoolClass",SchoolClass.class).getResultList();
    }

    public List<CourseType> getCourseTypes(){
        return this.getEntityManager().createQuery("FROM CourseType",CourseType.class).getResultList();
    }

    public List<Discipline> getDisciplines(){
        return this.getEntityManager().createQuery("FROM Discipline",Discipline.class).getResultList();
    }

    public List<Age> getAges(){
        return this.getEntityManager().createQuery("FROM Age",Age.class).getResultList();
    }

    public List<Speed> getSpeeds(){
        return this.getEntityManager().createQuery("FROM Speed", Speed.class).getResultList();
    }
}
