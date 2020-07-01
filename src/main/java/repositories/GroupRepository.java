package repositories;


import java.util.List;

public class GroupRepository extends Repository {

    public GroupRepository() {
    }

    public List<Object> getGroupStudents(int groupId) {

        return this.getEntityManager().createQuery("SELECT gs.joined, gs.dropped, mb.name,mb.surname " +
                "  FROM GroupStudent gs " +
                "JOIN gs.studentObj s" +
                " JOIN s.member mb ").getResultList();
    }
}
