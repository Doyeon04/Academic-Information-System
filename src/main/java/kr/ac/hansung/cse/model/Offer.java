package kr.ac.hansung.cse.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@Builder
@AllArgsConstructor
public class Offer {

	private Integer id;

	@NotNull(message="year 필수")
	private Integer year;

	@NotNull(message = "semester 필수")
	@Min(value = 1, message = "1이상 입력")
	@Max(value = 2, message = "2이하 입력")
	private Integer semester;

	private String code;

	@NotNull(message = "name 필수")
	@NotBlank(message = "name 필수")
	private String name;

	@NotNull(message = "sort 필수")
	@NotBlank(message = "sort 필수")
	private String sort;

	@NotNull(message = "professor 필수")
	@NotBlank(message = "professor 필수")
	private String professor;

	@NotNull(message = "score 필수")
	private Integer score;

	private String username;
}
