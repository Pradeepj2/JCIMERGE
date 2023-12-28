package com.jci.dao_phase2;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.jci.model.Contractgeneration;

public interface ContractGenerationDao2 {
	void create(Contractgeneration contract);
	 List<Contractgeneration> getAllContract();
	int highestDerivativePrice(String cropYear, String deliveryType);
	boolean isValidContractIdn(String contractIdn);
//	ModelAndView pcso_details(List<String> pcsoDates,String gradeComp , String deliveryType);
	ModelAndView pcso_details(List<String> pcsoDates,String gradeComp);
	List<Object[]> getListOfGradesPrice(String cropYear);
	List<Object[]> getListOfGradeComposition(String gradeComp);
	int updateContractedValue(String deliveryType, String totalQtyOfMill);
	List<Contractgeneration> getContractFullDetails(String contractidn);

}
