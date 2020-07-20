package com.covid9.stats.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Delta {

	private int confirmed;
	private int deceased;
	private int recovered;
}
