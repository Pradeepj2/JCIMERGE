package com.jci.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.jci.model.PaymentInstrumentModel;
import com.jci.model.UploadingReceiptModel;
import com.jci.model.UserActionModel;
import com.jci.model.UserPriviligeModel;
import com.jci.model.UserRoleModel;
import com.jci.service.EntryofsaleService;
import com.jci.service.HoDispatchService;
import com.jci.service.PaymentInstrumentService;
import com.jci.service.PcsoentryService;
import com.jci.service.UploadRecieptService;
import com.jci.service.UserActionService;
import com.jci.service.UserPriviligeService;
import com.jci.service.UserRoleService;
import com.google.gson.Gson;
import com.jci.model.EntryofSaleModel;
import com.jci.model.FarmerRegistrationModel;
import com.jci.model.HODispatchInstructionModel;
import com.jci.model.EntryofpcsoModel;

@Controller
public class InsertDataController_2 {
	
	@Autowired
	private PaymentInstrumentService paymentinstrumentservice;
	
	@Autowired
	private HoDispatchService hodispatchservice;
	
	@Autowired
	EntryofsaleService entryofsaleservice;

	@Autowired
	UploadRecieptService uploadrecieptservice;
	
	@Autowired
	UserRoleService userroleService;
	
	@Autowired
	UserActionService useractionservice;
	
	@Autowired
	UserPriviligeService userpriviligeservice;
	
	@Autowired
	PcsoentryService pcsoentryservice;
	
	
	
	  @RequestMapping("entryofpcso")

	    public ModelAndView EntryofpcsoModel(HttpServletRequest request) {

	          ModelAndView mv = new ModelAndView("entryofpcso");

	          final List<EntryofpcsoModel> allentryofpcsolist = (List<EntryofpcsoModel>)this.pcsoentryservice.getAlldata();

	          mv.addObject("entryofpcsolist", (Object)allentryofpcsolist);

	          return mv;

	    }
    
	  @RequestMapping("entryofpcsosave")

	    public ModelAndView saveUserMid(HttpServletRequest request, RedirectAttributes redirectAttributes) {

	         ModelAndView mv= new ModelAndView("entryofpcsosave");

	          try {

	            

	                List<EntryofpcsoModel> ll = new ArrayList<>();

	                int c = 0;

	                int count = Integer.valueOf(request.getParameter("count"));

	                

	               String referenceno = request.getParameter("referenceno");

	               String referencedate = request.getParameter("referencedate");

	               String pcsodate = request.getParameter("pcsodate");

	               System.out.println("referencedate=================="+referencedate);

	              

	               for(int i = 0; i<count; i++)

	                {

	               EntryofpcsoModel entryofpcso = new EntryofpcsoModel();

	                       String millcode = request.getParameter("millcode"+c);

	                       String millname = request.getParameter("millname"+c);

	                       String tallocation = request.getParameter("totalallocation"+c);

	                       entryofpcso.setReference_no(referenceno);

	                   SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");

	                   Date refdate = formatter1.parse(referencedate);

	                   entryofpcso.setReference_date(refdate);

	                   Date pcsodt = formatter1.parse(pcsodate);

	                   entryofpcso.setPcso_date(pcsodt);

	                       if(tallocation != "" && tallocation != null )

	                       {

	                              entryofpcso.setMill_code(millcode);

	                              entryofpcso.setMill_name(millname);

	                              entryofpcso.setTotal_allocation(tallocation);

	                              System.out.println("mill code ----"+millcode+"mill name----"+millname+"allocation-----"+tallocation);

	                            

	                              ll.add(entryofpcso);

	                       }

	                       

	                       c++;

	                }

	               mv.addObject("entryofpcso", (Object)ll);

	               mv.addObject("referencedate", (Object)referencedate);

	               mv.addObject("pcsodate", (Object)pcsodate);

	             

	                //System.out.println(" ll========="+ ll);

	             //   System.out.println(" entryofpcso========="+ entryofpcso);

	               //pcsoentryservice.create(entryofpcso);

	              // redirectAttributes.addFlashAttribute("msg", "<div class=\"alert alert-success\"><b>Success !</b> Record saved successfully.</div>\r\n" + "");

	          } catch (Exception e) {

	               System.out.println(e);

	          }

	          return mv;

	    }

	 

	 

	 
    
	/*
	 * @RequestMapping("savepcsoentry") public ModelAndView
	 * saveUserMid(HttpServletRequest request, RedirectAttributes
	 * redirectAttributes) { try {
	 * 
	 * String referenceno = request.getParameter("referenceno"); String
	 * referencedate = request.getParameter("referencedate"); String pcsodate =
	 * request.getParameter("pcsodate"); String millcode =
	 * request.getParameter("millcode"); String totalallocation =
	 * request.getParameter("totalallocation");
	 * 
	 * //EntryofpcsoModel entryofpcso = new EntryofpcsoModel(); EntryofpcsoModel
	 * entryofpcso = new EntryofpcsoModel();
	 * entryofpcso.setReference_no(referenceno); SimpleDateFormat formatter1 = new
	 * SimpleDateFormat("yyyy-MM-dd"); Date refdate =
	 * formatter1.parse(referencedate); entryofpcso.setReference_date(refdate); Date
	 * pcsodt = formatter1.parse(pcsodate); entryofpcso.setPcso_date(pcsodt);
	 * entryofpcso.setMill_code(millcode);
	 * entryofpcso.setTotal_allocation(totalallocation);
	 * 
	 * pcsoentryservice.create(entryofpcso);
	 * redirectAttributes.addFlashAttribute("msg",
	 * "<div class=\"alert alert-success\"><b>Success !</b> Record saved successfully.</div>\r\n"
	 * + ""); } catch (Exception e) { System.out.println(e); } return new
	 * ModelAndView(new RedirectView("entryofpcso.obj")); }
	 */

	  @RequestMapping("saveentryofpcsodata")
	    public ModelAndView entryofpcsosave(HttpServletRequest request, RedirectAttributes redirectAttributes) {
	          try {
	        	
	        	   int c = 0;
	        	   int count = Integer.valueOf(request.getParameter("count"));
	        	   Date date = new Date();
	               String referenceno = request.getParameter("refno");
	               String referencedate = request.getParameter("refdate");
	               String pcsodate = request.getParameter("pcsodate");
	               double sumoftotalallocation = Double.parseDouble(request.getParameter("sumoftotalallocation"));
	               
	               for(int i = 0; i<count; i++)
	        	   {
	            	   EntryofpcsoModel entryofpcso = new EntryofpcsoModel();
	        		   String millcode = request.getParameter("millcode"+c);
	        		   String millname = request.getParameter("millname"+c);
	        		   String tallocation = request.getParameter("totalallocation"+c);
	        		   entryofpcso.setReference_no(referenceno);
	                   SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	                   Date refdate = formatter1.parse(referencedate);
	                   entryofpcso.setReference_date(refdate);
	                   Date pcsodt = formatter1.parse(pcsodate);
	                   entryofpcso.setPcso_date(pcsodt);
	                   String createddate = formatter1.format(date);
	                   entryofpcso.setCreated_date(createddate);
	        		   entryofpcso.setMill_code(millcode);
	        		   entryofpcso.setMill_name(millname);
	        		   entryofpcso.setTotal_allocation(tallocation);
	        		   entryofpcso.setMillwise_contract(0);
	        		   entryofpcso.setPcsowise_contract(0);
	        		   entryofpcso.setSumof_totalallocation(sumoftotalallocation);
	        		   pcsoentryservice.create(entryofpcso);
	        		   c++;
	        		   
	        	   }
	              
					
					  redirectAttributes.addFlashAttribute("msg",
					  "<div class=\"alert alert-success\"><b>Success !</b> Record created successfully.</div>\r\n"
					  + "");
					 
	               }
	          catch (Exception e)
	          {
	               System.out.println(e);
	               e.printStackTrace();
	          }
	          return new ModelAndView(new RedirectView("entryofpcso.obj"));
	    }

	  @RequestMapping("pcsolist") public ModelAndView pcsolist(HttpServletRequest
	  request) { 
		  ModelAndView mv = new ModelAndView("PCSO_List");
	  List<Date> pcso = pcsoentryservice.getAll(); 
	  mv.addObject("pcsolist",pcso); return mv; }
	 
	@RequestMapping("userprivilige")
	public ModelAndView userpriviligeModel(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("userprivilige");
		 final List<UserRoleModel> alluserroleList = (List<UserRoleModel>)this.userroleService.getAll();
		 mv.addObject("userroleList", (Object)alluserroleList);
		 final List<UserActionModel> alluseractionlist = (List<UserActionModel>)this.useractionservice.getAll();
		 mv.addObject("useractionlist", (Object)alluseractionlist);
		 return mv;
	}
	
	@RequestMapping("saveuserprivilige")  
	
	public ModelAndView saveuserprivilige(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		try {
		
			String userrole = request.getParameter("userrole");
			String useraction = request.getParameter("action");
			
			
			UserPriviligeModel userprivilige = new UserPriviligeModel();
			
			userprivilige.setRole_Id(userrole);
			userprivilige.setAction_permissions(useraction);
			Date d2 = new Date();
			SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
			String formattedDate1 = dd.format(d2);
			userprivilige.setCreated_date(formattedDate1);

			
			
			this.userpriviligeservice.create(userprivilige);
			
			redirectAttributes.addFlashAttribute("msg",
						"<div class=\"alert alert-success\"><b>Success !</b> Record created successfully.</div>\r\n"
								+ "");
	
		} catch (Exception e)
		{
			//System.out.println("++++++++++++++"+e);
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("userprivilige.obj"));
	}
	
	
	
	@RequestMapping("userrole")
	public ModelAndView userroleModel(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("userrole");
		 
		return mv;
	}
	
	
	@RequestMapping("viewuserrole")
	public ModelAndView viewuserroleModel(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("viewuserrole");
		 final List<UserRoleModel> alluserroleList = (List<UserRoleModel>)this.userroleService.getAll();
		 mv.addObject("userroleList", (Object)alluserroleList);
	
		return mv;
	}
	
	 
	@RequestMapping("saveuserrole")  
	public ModelAndView saveuserrole(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		try {
		
			String rolename = request.getParameter("rolename");
			//String usertype = request.getParameter("usertype");
			
			
			UserRoleModel userrole = new UserRoleModel();
			
			userrole.setRole_name(rolename);
			userrole.setUser_type("1");
			Date d2 = new Date();
			SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate1 = dd.format(d2);
			userrole.setCreated_date(formattedDate1);

			
			
			this.userroleService.create(userrole);
			
			redirectAttributes.addFlashAttribute("msg",
						"<div class=\"alert alert-success\"><b>Success !</b> Record created successfully.</div>\r\n"
								+ "");
	
		} catch (Exception e)
		{
			System.out.println("++++++++++++++"+e);
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("viewuserrole.obj"));
	}
	
	@RequestMapping("useraction")
	public ModelAndView useractionModel(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("useraction");
		return mv;
	}
	
	@RequestMapping("saveuseraction")  
	public ModelAndView saveuseraction(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		try {
		
			String actionname = request.getParameter("actionname");
			String actionstatus = request.getParameter("actionstatus");
			
			UserActionModel useraction = new UserActionModel();
			
			useraction.setAction_name(actionname);
			useraction.setAction_status(actionstatus);
			Date d2 = new Date();
			SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate1 = dd.format(d2);
			useraction.setCreated_date(formattedDate1);

			
			
			this.useractionservice.create(useraction);
			
			redirectAttributes.addFlashAttribute("msg",
						"<div class=\"alert alert-success\"><b>Success !</b> Record created successfully.</div>\r\n"
								+ "");
	
		} catch (Exception e)
		{
			System.out.println("++++++++++++++"+e);
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("useraction.obj"));
	}
	
	
	@RequestMapping("entryofpayment")
	public ModelAndView EntryofpiModel(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("entryofpaymentinstrument");
		return mv;
	}
	
	
	@RequestMapping("saveentryofpaymentinstrument")  
	public ModelAndView saveentryofPI(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		try {
		
			String fullcontractno = request.getParameter("fullcontractno");
			String contractdate = request.getParameter("contractdate");
			String cropyear = request.getParameter("cropyear");
			String contractquantity = request.getParameter("contractquantity");
			String gradewiseqty = request.getParameter("gradewiseqty");
			String millofficeaddress = request.getParameter("millofficeaddress");
			String millsideaddress = request.getParameter("millsideaddress");
			String paymenttype = request.getParameter("paymenttype");
			String millaccountcode = request.getParameter("millaccountcode");
			String instrumentno = request.getParameter("instrumentno");
			String instdate = request.getParameter("instdate");
			String bankname1 = request.getParameter("bankname1");
			String bankbranch = request.getParameter("bankbranch");
			String tamount = request.getParameter("tamount");
			String autorevolvingoption = request.getParameter("autorevolvingoption");
			String autorevolvingamount = request.getParameter("autorevolvingamount");
			String dateofship = request.getParameter("dateofship");
			String dateofexpiry = request.getParameter("dateofexpiry");
			if(autorevolvingamount =="")
			{
				autorevolvingamount = "0";
			}
			PaymentInstrumentModel paymentinstrument = new PaymentInstrumentModel();
			
			paymentinstrument.setFullcontractno(fullcontractno);
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			Date contdate = formatter1.parse(contractdate);
			paymentinstrument.setContractdate(contdate);
			paymentinstrument.setCropyear(cropyear);
			paymentinstrument.setContractquantity(contractquantity);
			paymentinstrument.setVarietygradewisequantity(gradewiseqty);
			paymentinstrument.setMillofficeaddress(millofficeaddress);
			paymentinstrument.setMillsideaddress(millsideaddress);
			paymentinstrument.setPaymenttype(paymenttype);
			paymentinstrument.setMillaccountcode(millaccountcode);
			paymentinstrument.setInstrumentno(instrumentno);
			Date instdate1 = formatter1.parse(instdate);
			paymentinstrument.setInstrumentdate(instdate1);
			paymentinstrument.setBankname(bankname1);
			paymentinstrument.setBankbranch(bankbranch);
			paymentinstrument.setAmount(tamount);
			paymentinstrument.setAutorevolvingoption(autorevolvingoption);
			paymentinstrument.setAutorevolvingamount(autorevolvingamount);
			Date date3 = null;
			if(dateofship =="")
				{
				  paymentinstrument.setDateofshipment(date3);
				}
			else
				{
				  Date dateofship1 = formatter1.parse(dateofship);
				  paymentinstrument.setDateofshipment(dateofship1);
				}
			if(dateofexpiry =="")
				{
				  paymentinstrument.setDateofexpiry(date3);
				}
			else
				{
				  Date dateofexpiry1 = formatter1.parse(dateofexpiry);
				  paymentinstrument.setDateofexpiry(dateofexpiry1);
				}
		
			 Date date= new Date();
			 String currdate = date.toString();
		     paymentinstrument.setGenerateddate(currdate);
			
			this.paymentinstrumentservice.create(paymentinstrument);
			//System.out.println(paymentinstrument);
			redirectAttributes.addFlashAttribute("msg",
						"<div class=\"alert alert-success\"><b>Success !</b> Record saved successfully.</div>\r\n"
								+ "");
	
		} catch (Exception e) 
		{
			System.out.println("++++++++++++++"+e);
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("entryofpayment.obj"));
	}
	
	
	@RequestMapping("HOdispatch")
	public ModelAndView HODispatchInstructionModel(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("HOdispatchinstruction");
		return mv;
	}
	
	@RequestMapping("savehodispatch")  
	public ModelAndView hoDispatchInstruction(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		try 
		{
			String fullcontractno = request.getParameter("fullcontractno");
			String contractdate = request.getParameter("contractdate");
			String cropyear = request.getParameter("cropyear");
			String contractquantity = request.getParameter("contractquantity");
			String gradewiseqty = request.getParameter("gradewiseqty");
			String regionaloffices = request.getParameter("regionaloffices");
			String lastdateofshipment = request.getParameter("lastdateofshipment");
			String uniqueno = request.getParameter("uniqueno");
			String dateofdi = request.getParameter("dateofdi");
			String jutevariety = request.getParameter("jutevariety");
			String quantity = request.getParameter("quantity");
			String gprice1 = request.getParameter("gprice0");
			String gprice2 = request.getParameter("gprice1");
			String gprice3 = request.getParameter("gprice2");
			String gprice4 = request.getParameter("gprice3");
			String gprice5 = request.getParameter("gprice4");
			String gprice6 = request.getParameter("gprice5");
			String gprice7 = request.getParameter("gprice6");
			String gprice8 = request.getParameter("gprice7");
			if(gprice1 == null)
			{  gprice1 = "0"; }
			if(gprice2 == null)
			{  gprice2 = "0"; }
			if(gprice3 == null)
			{  gprice3 = "0"; }
			if(gprice4 == null)
			{  gprice4 = "0"; }
			if(gprice5 == null)
			{  gprice5 = "0"; }
			if(gprice6 == null)
			{  gprice6 = "0"; }
			if(gprice7 == null)
			{  gprice7 = "0"; }
			if(gprice8 == null)
			{  gprice8 = "0"; }
			
			HODispatchInstructionModel hodispatch = new HODispatchInstructionModel();
			
			hodispatch.setFullcontractno(fullcontractno);
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			Date contdate = formatter1.parse(contractdate);
			hodispatch.setContractdate(contdate);
			hodispatch.setCropyear(cropyear);
			hodispatch.setContractquantity(contractquantity);
			hodispatch.setVarietygradewisequantity(gradewiseqty);
			hodispatch.setRegionaloffice(regionaloffices);
			Date shipmentdate = formatter1.parse(lastdateofshipment);
			hodispatch.setDateofshipment(shipmentdate);
			hodispatch.setUniqueno(uniqueno);
			Date didate = formatter1.parse(dateofdi);
			hodispatch.setDidate(didate);
			hodispatch.setJutevariety(jutevariety);
			hodispatch.setQuentity(quantity);
			hodispatch.setJutegrade1(gprice1);
			hodispatch.setJutegrade2(gprice2);
			hodispatch.setJutegrade3(gprice3);
			hodispatch.setJutegrade4(gprice4);
			hodispatch.setJutegrade5(gprice5);
			hodispatch.setJutegrade6(gprice6);
			hodispatch.setJutegrade7(gprice7);
			hodispatch.setJutegrade8(gprice8);
			System.out.println("sldkfjdlf"+hodispatch);
			
			this.hodispatchservice.create(hodispatch);
			//System.out.println(hodispatch);
			redirectAttributes.addFlashAttribute("msg",
						"<div class=\"alert alert-success\"><b>Success !</b> Record saved successfully.</div>\r\n"
								+ "");
	
		} catch (Exception e)
		{
			System.out.println("++++++++++++++"+e);
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("HOdispatch.obj"));
	}
	
	@RequestMapping("entryofsale")
	public ModelAndView EntryofSaleForm(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("entryofsale");
		return mv;
	}
	
	@RequestMapping("saveentryofsale")  
	public ModelAndView saveEntryofsale(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		try 
		{
			String dpc10no = request.getParameter("dpc10no");
			String dpc10date = request.getParameter("dpc10date");
			String millsname = request.getParameter("millsname");
			String contractnodate = request.getParameter("contractnodate");
			String dinoanddate = request.getParameter("dinoanddate");
			String centername = request.getParameter("centername");
			String agency = request.getParameter("agency");
			String region = request.getParameter("region");
			String challanno = request.getParameter("challanno");
			String challandate = request.getParameter("challandate");
			String lotno = request.getParameter("lotno");
			String transportno = request.getParameter("transportno");
			String cropyear = request.getParameter("cropyear");
			String jutevariety = request.getParameter("jutevariety");
			String jutegrade = request.getParameter("jutegrade");
			String nominalweight = request.getParameter("nominalweight");
			String quantity = request.getParameter("quantity");
			String rateperquintals = request.getParameter("rateperquintals");
			
			if(lotno =="")
			{
				lotno ="0";
			}
			EntryofSaleModel entryofsale = new EntryofSaleModel();
			
			entryofsale.setDpcno(dpc10no);
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			Date dpcdate = formatter1.parse(dpc10date);
			entryofsale.setDpcdate(dpcdate);
			entryofsale.setMillsname(millsname);
			entryofsale.setContractnoanddate(contractnodate);
			entryofsale.setDinoanddate(dinoanddate);
			entryofsale.setCentername(centername);
			entryofsale.setAgency(agency);
			entryofsale.setRegion(region);
			entryofsale.setChallanno(challanno);
			Date challandate1 = formatter1.parse(challandate);
			entryofsale.setChallandate(challandate1);
			entryofsale.setLotno(lotno);
			entryofsale.setTransportno(transportno);
			entryofsale.setCropyear(cropyear);
			entryofsale.setJutevariety(jutevariety);
			entryofsale.setJutegrade(jutegrade);
			entryofsale.setNominalweight(nominalweight);
			entryofsale.setQuantity(quantity);
			entryofsale.setRateperquintals(rateperquintals);
			
			this.entryofsaleservice.create(entryofsale);
			System.out.println("entryofsale=============="+entryofsale);
			System.out.println(entryofsale);
			redirectAttributes.addFlashAttribute("msg",
						"<div class=\"alert alert-success\"><b>Success !</b> Record saved successfully.</div>\r\n"
								+ "");
	
		} catch (Exception e)
		{
			System.out.println("++++++++++++++"+e);
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("entryofsale.obj"));
	}
	
	@RequestMapping("uploadingreceipt")
	public ModelAndView UploadingofreceiptBos(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("uploadingofreceiptbos");
		return mv;
	}
	
	@RequestMapping("saveuploadingreceipt")  
	public ModelAndView uploadingreceipt(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		try 
		{
			String dpc10no = request.getParameter("dpc10no");
			String jutevariety = request.getParameter("jutevariety");
			String jutegrade = request.getParameter("jutegrade");
			String actualweight = request.getParameter("actualweight");
		

			UploadingReceiptModel uploadrecipt = new UploadingReceiptModel();
			Date d2 = new Date();
			uploadrecipt.setDpc_number(dpc10no);
			SimpleDateFormat dd = new SimpleDateFormat("YYYY-MM-dd");
			String formattedDate1 = dd.format(d2);
			uploadrecipt.setJute_variety(jutevariety);
			uploadrecipt.setJute_grade(jutegrade);
			uploadrecipt.setActual_weight(actualweight);
			uploadrecipt.setReciept_date(formattedDate1);
			

		
			this.uploadrecieptservice.create(uploadrecipt);
			//System.out.println("uploadrecipt=============="+uploadrecipt);
			//System.out.println(uploadrecipt);
			redirectAttributes.addFlashAttribute("msg",
						"<div class=\"alert alert-success\"><b>Success !</b> Record saved successfully.</div>\r\n"
								+ "");
	
		} catch (Exception e)
		{
			System.out.println("++++++++++++++"+e);
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("uploadingreceipt.obj"));
	}
	
	@ResponseBody
	@RequestMapping(value="userpriviligeajax", method = RequestMethod.GET)
	public String userpriviligeajax(HttpServletRequest request) {
		 String uPri="";
		int role_Id= 0;
		try{
			role_Id= Integer.parseInt(request.getParameter("roleId"));
		  uPri= userpriviligeservice.getUserPrivilegeListing(role_Id);
		}catch(Exception ex){
			System.out.println(ex.getStackTrace());
		}
		return uPri;
	}
	@ResponseBody
	@RequestMapping(value="userpriviligeajaxallData", method= RequestMethod.GET)
		public  String getuserpriviligeajaxallData() {
		 List<String> list=new ArrayList();
		 String res="";
		 
		try {
			list= userpriviligeservice.getuserpriviligeajaxallData();
				//System.out.println("allList============-------------   "+list);
				
			}
		
		catch(Exception e) {
			System.out.println(e.getStackTrace());
			
		}
		final Gson gson = new Gson();
        return gson.toJson((Object)list);
		//return list;
	}
	
}