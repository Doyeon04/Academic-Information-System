package kr.ac.hansung.cse.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import kr.ac.hansung.cse.model.Offer;

@Component("offerDao")
public class OfferDao {

	private JdbcTemplate jdbcTemplate; 

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource); 
	}

	public List<Offer> getScoreBySemester(String userName) {
		String sqlStatement = "SELECT year, semester, sum(score) as score FROM offers where username = ? group by year, semester order by year, semester";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Offer>() {

			@Override
			public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return Offer.builder().year(rs.getInt("year")).semester(rs.getInt("semester")).score(rs.getInt("score"))
						.build();
			}
		}, userName);
	}

	public List<Offer> getSemesterDetail(Offer offer) {
		String sqlStatement = "SELECT * " + "FROM offers " + "where year = ? and semester = ? and username = ? "
				+ "order by semester";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Offer>() {

			@Override
			public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return Offer.builder().year(rs.getInt("year")).semester(rs.getInt("semester"))
						.name(rs.getString("name")).sort(rs.getString("sort")).professor(rs.getString("professor"))
						.score(rs.getInt("score")).build();
			}
		}, offer.getYear(), offer.getSemester(), offer.getUsername());
	}

	public boolean create(Offer o) {
		String sqlStatement = "INSERT INTO class_registration (year, semester, name, sort, professor, score, username) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		return (jdbcTemplate.update(sqlStatement, o.getYear(), o.getSemester(), o.getName(), o.getSort(),
				o.getProfessor(), o.getScore(), o.getUsername())) == 1;
	}

	public List<Offer> showAddedOffers(String userName) {
		String sqlStatement = "SELECT * FROM  class_registration WHERE username = ?";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Offer>() {

			@Override
			public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return Offer.builder().year(rs.getInt("year")).semester(rs.getInt("semester"))
						.name(rs.getString("name")).sort(rs.getString("sort")).professor(rs.getString("professor"))
						.score(rs.getInt("score")).build();
			}
		}, userName);
	}

}
