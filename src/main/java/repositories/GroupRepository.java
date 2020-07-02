package repositories;


import models.GroupStudent;

import javax.persistence.TypedQuery;
import java.util.List;

public class GroupRepository extends Repository {

    public GroupRepository() {
    }

    public List<GroupMember> getGroupStudents(int groupId) {
     /*   return  this.getEntityManager().createQuery("SELECT gs.joined, gs.dropped, mb.name,mb.surname " +
                "  FROM GroupStudent gs " +
                "JOIN gs.studentObj s" +
                " JOIN s.member mb WHERE gs.groupId = :gid").setParameter("gid",groupId).getResultList(); ?

      */

        return  this.getEntityManager().createQuery("SELECT new repositories.GroupMember(gs.joined, gs.dropped, mb.name) " +
                "  FROM GroupStudent gs " +
                "JOIN gs.studentObj s" +
                " JOIN s.member mb WHERE gs.groupId = :gid").setParameter("gid",groupId).getResultList();
    }



}
