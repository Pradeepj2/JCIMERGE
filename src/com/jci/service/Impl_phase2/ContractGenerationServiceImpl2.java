package com.jci.service.Impl_phase2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jci.dao_phase2.ContractGenerationDao2;
import com.jci.model.Contractgeneration;
import com.jci.service_phase2.ContractGenerationService2;

@Service
public class ContractGenerationServiceImpl2 implements ContractGenerationService2 {

	@Autowired
	ContractGenerationDao2 contractGenerationDao2;
	
	@Override
	public void create(Contractgeneration contract) {

		contractGenerationDao2.create(contract);
	}

	@Override
	public boolean isValidContractIdn(String contractIdn) {
	return contractGenerationDao2.isValidContractIdn(contractIdn);
	}

	@Override
	public ModelAndView pcso_details(List<String> pcso,String gradeComp) {
		return this.contractGenerationDao2.pcso_details(pcso,gradeComp);
	}

	@Override
	public List<Object[]> getListOfGradesPrice(String cropYear) {
		return contractGenerationDao2.getListOfGradesPrice(cropYear);
	}

	@Override
	public List<Object[]> getListOfGradeComposition(String gradeComp) {
		return contractGenerationDao2.getListOfGradeComposition(gradeComp);
	}

	@Override
	public List<Contractgeneration> getAllContract() {
	return contractGenerationDao2.getAllContract();
	}

	@Override
	public int updateContractedValue(String deliveryType ,String totalQtyOfMill) {
		return contractGenerationDao2.updateContractedValue(deliveryType,totalQtyOfMill);
	}

	@Override
	public List<Contractgeneration> getContractFullDetails(String contractidn) {
		return contractGenerationDao2.getContractFullDetails(contractidn);
	}

 

}
