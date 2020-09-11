package core;


import models.HibernateUtil;
import models.money.Revenue;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import spring_repos.SprRevenueRepository;

import java.util.List;


@RestController
public class RevenueController {

    @Autowired
    SprRevenueRepository revenueRepo;

    @RequestMapping(value = "/api/revenue/charts", method = RequestMethod.GET)
    public Iterable<Revenue> getLineChartData()
    {
        return revenueRepo.findAll(Sort.by(Sort.Direction.ASC, "createdAt"));
    }

    @RequestMapping(value = "/api/revenue/pie", method = RequestMethod.GET)
    public List<Revenue> getPieChartData()
    {
        String q = "SELECT id,SUM(profit) AS profit," +
                " SUM(gross_income) AS grossIncome ,SUM(net_income) AS netIncome " +
                ",SUM(student_payments) AS studentPayments," +
                " SUM(total_expenses) AS totalExpenses," +
                " SUM(taxes) AS taxes ," +
                " SUM(staff_payments) AS  staffPayments ," +
                "  SUM(staff_insurances) AS staffInsurances," +
                " SUM(staff_net_payments) AS  staffNetPayments, " +
                "  SUM(student_debts) AS studentDebts ," +
                " SUM(staff_in_debt) AS staffInDebt FROM `revenue` ";
        return HibernateUtil.getEM().createNativeQuery(q)
                .unwrap(org.hibernate.query.NativeQuery.class)
                .addScalar("id", StandardBasicTypes.LONG)
                .addScalar("profit")
                .addScalar("grossIncome")
                .addScalar("netIncome")
                .addScalar("studentPayments")
                .addScalar("totalExpenses")
                .addScalar("taxes")
                .addScalar("staffPayments")
                .addScalar("staffInsurances")
                .addScalar("staffNetPayments")
                .addScalar("studentDebts")
                .addScalar("staffInDebt")
                .setResultTransformer(Transformers.aliasToBean(Revenue.class))
                .getResultList();
    }

}
