/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2016 Kuali, Inc.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.coeus.s2sgen.impl.generate.support;

import gov.grants.apply.forms.phs398Checklist13V13.PHS398Checklist13Document;
import gov.grants.apply.forms.phs398Checklist13V13.PHS398Checklist13Document.PHS398Checklist13;
import gov.grants.apply.forms.phs398Checklist13V13.PHS398Checklist13Document.PHS398Checklist13.ApplicationType;
import gov.grants.apply.forms.phs398Checklist13V13.PHS398Checklist13Document.PHS398Checklist13.IncomeBudgetPeriod;
import gov.grants.apply.system.globalLibraryV20.HumanNameDataType;
import gov.grants.apply.system.globalLibraryV20.YesNoDataType;
import gov.grants.apply.system.globalLibraryV20.YesNoDataType.Enum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.common.api.ynq.YnqConstant;
import org.kuali.coeus.common.questionnaire.api.answer.AnswerHeaderContract;
import org.kuali.coeus.common.api.rolodex.RolodexContract;
import org.kuali.coeus.common.api.rolodex.RolodexService;
import org.kuali.coeus.common.budget.api.income.BudgetProjectIncomeContract;
import org.kuali.coeus.s2sgen.impl.generate.FormGenerator;
import org.kuali.coeus.propdev.api.budget.ProposalDevelopmentBudgetExtContract;
import org.kuali.coeus.propdev.api.core.DevelopmentProposalContract;
import org.kuali.coeus.propdev.api.core.ProposalDevelopmentDocumentContract;
import org.kuali.coeus.s2sgen.impl.generate.FormVersion;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * 
 * This class is used to generate XML Document object for grants.gov
 * PHS398ChecklistV1.3. This form is generated using XMLBean API's generated by
 * compiling PHS398ChecklistV1.1 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
@FormGenerator("PHS398ChecklistV1_3Generator")
public class PHS398ChecklistV1_3Generator extends PHS398ChecklistBaseGenerator {
	private static final Integer YNQANSWER_121 = 121;
	List<? extends AnswerHeaderContract> answerHeaders;
	Enum ynqAnswer;

    @Value("http://apply.grants.gov/forms/PHS398_Checklist_1_3-V1.3")
    private String namespace;

    @Value("PHS398_Checklist_1_3-V1.3")
    private String formName;

    @Value("classpath:org/kuali/coeus/s2sgen/impl/generate/support/stylesheet/PHS398_Checklist-V1.3.xsl")
    private Resource stylesheet;

    @Value("gov.grants.apply.forms.phs398Checklist13V13")
    private String packageName;

    @Value("230")
    private int sortIndex;

    @Autowired
    @Qualifier("rolodexService")
    private RolodexService rolodexService;

	/*
	 * This method returns PHS398ChecklistDocument object based on proposal
	 * development document which contains the PHS398ChecklistDocument
	 * informations
	 * ApplicationType,FederalID,ChangeOfPDPI,FormerPDName,ChangeOfInstitution,
	 * FormerInstitutionName,InventionsAndPatents, ProgramIncome and
	 * CertificationExplanation for a particular proposal
	 * 
	 */
	private PHS398Checklist13Document getPHS398Checklist() {
		PHS398Checklist13Document phsChecklistDocument = PHS398Checklist13Document.Factory
				.newInstance();
		PHS398Checklist13 phsChecklist = PHS398Checklist13.Factory.newInstance();
		answerHeaders = getPropDevQuestionAnswerService().getQuestionnaireAnswerHeaders(pdDoc.getDevelopmentProposal().getProposalNumber());
		setPhsCheckListBasicProperties(phsChecklist);
		setFormerPDNameAndIsChangeOfPDPI(phsChecklist);
		setFormerInstitutionNameAndChangeOfInstitution(phsChecklist);
		setIsInventionsAndPatentsAndIsPreviouslyReported(phsChecklist);

        ProposalDevelopmentBudgetExtContract budget = s2SCommonBudgetService.getBudget(pdDoc.getDevelopmentProposal());

		if (budget != null) {
			int numPeriods = budget.getBudgetPeriods().size();
			setIncomeBudgetPeriods(phsChecklist, budget.getBudgetProjectIncomes(),numPeriods);
		} else {
			phsChecklist.setProgramIncome(YesNoDataType.N_NO);
		}
		ynqAnswer = getYNQAnswer(YNQANSWER_121);
		phsChecklist.setDisclosurePermission(ynqAnswer);
		phsChecklistDocument.setPHS398Checklist13(phsChecklist);
		return phsChecklistDocument;
	}

	/*
	 * This method will set values to following attributes setFederalID,
	 * setApplicationType ,setFormVersion
	 */
	private void setPhsCheckListBasicProperties(PHS398Checklist13 phsChecklist) {
		phsChecklist.setFormVersion(FormVersion.v1_3.getVersion());
		DevelopmentProposalContract developmentProposal = pdDoc
				.getDevelopmentProposal();
		ApplicationType.Enum applicationEnum = null;
		if (developmentProposal.getProposalType() != null
				&& Integer.parseInt(developmentProposal.getProposalType().getCode()) < PROPOSAL_TYPE_CODE_6) {
			applicationEnum = ApplicationType.Enum.forInt(Integer
					.valueOf(developmentProposal.getProposalType().getCode()));
		}
		phsChecklist.setApplicationType(applicationEnum);
		String federalId = getSubmissionInfoService().getFederalId(pdDoc.getDevelopmentProposal().getProposalNumber());
		if (federalId != null) {
			phsChecklist.setFederalID(federalId);
		}
	}

	/*
	 * This method will set values to income budget periods
	 */
	private static void setIncomeBudgetPeriods(PHS398Checklist13 phsChecklist,
			List<? extends BudgetProjectIncomeContract> projectIncomes, int numPeriods) {
		if (projectIncomes.isEmpty()) {
			phsChecklist.setProgramIncome(YesNoDataType.N_NO);
		} else {
			phsChecklist.setProgramIncome(YesNoDataType.Y_YES);
		}
		phsChecklist.setIncomeBudgetPeriodArray(getIncomeBudgetPeriod(projectIncomes));
	}
	/*
	 * Method to sum up IncomeBudgetPeriod of different period Number
	 */
	private static IncomeBudgetPeriod[] getIncomeBudgetPeriod(
			final List<? extends BudgetProjectIncomeContract> projectIncomes) {
		//TreeMap Used to maintain the order of the Budget periods.
		Map<Integer, IncomeBudgetPeriod> incomeBudgetPeriodMap = new TreeMap<Integer, IncomeBudgetPeriod>();
		BigDecimal anticipatedAmount;
		for (BudgetProjectIncomeContract projectIncome : projectIncomes) {

			Integer budgetPeriodNumber = projectIncome.getBudgetPeriodNumber();
			IncomeBudgetPeriod incomeBudgPeriod = incomeBudgetPeriodMap
					.get(budgetPeriodNumber);
			if (incomeBudgPeriod == null) {
				incomeBudgPeriod = IncomeBudgetPeriod.Factory.newInstance();
				incomeBudgPeriod.setBudgetPeriod(budgetPeriodNumber.intValue());
				anticipatedAmount = BigDecimal.ZERO;
			} else {
				anticipatedAmount = incomeBudgPeriod.getAnticipatedAmount();
			}
			anticipatedAmount = anticipatedAmount.add(projectIncome
					.getProjectIncome().bigDecimalValue());
			incomeBudgPeriod.setAnticipatedAmount(anticipatedAmount);
			String description = getProjectIncomeDescription(projectIncome);
			if (description != null) {
				if (incomeBudgPeriod.getSource() != null) {
					incomeBudgPeriod.setSource(incomeBudgPeriod.getSource()
							+ ";" + description);
				} else {
					incomeBudgPeriod.setSource(description);
				}
			}
			incomeBudgetPeriodMap.put(budgetPeriodNumber, incomeBudgPeriod);
		}
		Collection<IncomeBudgetPeriod> incomeBudgetPeriodCollection = incomeBudgetPeriodMap
				.values();
		return incomeBudgetPeriodCollection.toArray(new IncomeBudgetPeriod[0]);
	}
	/*
	 * This method will get the project income description
	 */
	protected static String getProjectIncomeDescription(BudgetProjectIncomeContract projectIncome) {
		String description = null;
		if (projectIncome.getDescription() != null) {
			if (projectIncome.getDescription().length() > PROJECT_INCOME_DESCRIPTION_MAX_LENGTH) {
				description = projectIncome.getDescription().substring(0,
						PROJECT_INCOME_DESCRIPTION_MAX_LENGTH);
			} else {
				description = projectIncome.getDescription();
			}
		}
		return description;
	}
	/*
	 * This method will set the values to
	 * setIsInventionsAndPatents,setIsPreviouslyReported based on condition
	 */
	private void setIsInventionsAndPatentsAndIsPreviouslyReported(
	        PHS398Checklist13 phsChecklist) {
	    String answer = getAnswer(PROPOSAL_YNQ_QUESTION_118,answerHeaders);
	    if (answer != null && !answer.equals(NOT_ANSWERED)) {
	        if (YnqConstant.YES.code().equals(answer)) {
	            String explanation = getAnswer(PROPOSAL_YNQ_QUESTION_119,answerHeaders);
	            if(explanation != null && !explanation.equals(NOT_ANSWERED)) {
	                if (YnqConstant.YES.code().equals(explanation)) {
	                    phsChecklist.setIsInventionsAndPatents(YesNoDataType.Y_YES);
	                    String subQuestionExplanation = getAnswer(PROPOSAL_YNQ_QUESTION_120,answerHeaders);
	                    if (subQuestionExplanation != null && !subQuestionExplanation.equals(NOT_ANSWERED)) {
	                        if (YnqConstant.YES.code().equals(subQuestionExplanation)) {
	                            phsChecklist.setIsPreviouslyReported(YesNoDataType.Y_YES);  
	                        }else if(YnqConstant.NO.code().equals(subQuestionExplanation)) {
	                            phsChecklist.setIsPreviouslyReported(YesNoDataType.N_NO);
	                        }
	                    } else {
	                        phsChecklist.setIsPreviouslyReported(null);
	                    }

	                } else if(YnqConstant.NO.code().equals(explanation)) {
	                    phsChecklist.setIsInventionsAndPatents(YesNoDataType.N_NO);
	                }
	            } else {
	                phsChecklist.setIsInventionsAndPatents(null);
	            }
	        }
	    }
	}

	/*
	 * This method will set the values to setFormerInstitutionName
	 * ,setIsChangeOfInstitution based on condition
	 */
	private void setFormerInstitutionNameAndChangeOfInstitution(
			PHS398Checklist13 phsChecklist) {
	    String answer = getAnswer(PROPOSAL_YNQ_QUESTION_116,answerHeaders);
        String explanation = getAnswer(PROPOSAL_YNQ_QUESTION_117,answerHeaders);
        
        if (YnqConstant.YES.code().equals(answer)) {
            phsChecklist.setIsChangeOfInstitution(YesNoDataType.Y_YES);
            if (explanation != null) {
                phsChecklist.setFormerInstitutionName(explanation);
            }
            else {
                phsChecklist.setFormerInstitutionName(null);
            }   
        } else {
            phsChecklist.setIsChangeOfInstitution(YesNoDataType.N_NO);
        }
	}

	/*
	 * This method will set the values to setFormerPDName ,setIsChangeOfPDPI
	 * based on condition
	 */
	private void setFormerPDNameAndIsChangeOfPDPI(PHS398Checklist13 phsChecklist) {
		String answer = getAnswer(PROPOSAL_YNQ_QUESTION_114,answerHeaders);
	    String explanation = getAnswer(PROPOSAL_YNQ_QUESTION_115,answerHeaders);
	    if (YnqConstant.YES.code().equals(answer)) {
            phsChecklist.setIsChangeOfPDPI(YesNoDataType.Y_YES);
            if (explanation != null) {
                RolodexContract rolodex = rolodexService.getRolodex(Integer.valueOf(explanation));
                HumanNameDataType formerPDName = globLibV20Generator
                        .getHumanNameDataType(rolodex);
                if (formerPDName != null
                        && formerPDName.getFirstName() != null
                        && formerPDName.getLastName() != null) {
                    phsChecklist.setFormerPDName(formerPDName);
                }
            }
            else{
                    phsChecklist.setFormerPDName(null);
            }
        } else {
            phsChecklist.setIsChangeOfPDPI(YesNoDataType.N_NO);
        }
    }

	/*
	 * This method will get the YNQ Answer for question id
	 */
	private YesNoDataType.Enum getYNQAnswer(Integer questionID) {
	    YesNoDataType.Enum answerType = null;
	    String answer = getAnswer(questionID,answerHeaders);
	    if (answer != null && !answer.equals(NOT_ANSWERED)) {
	        answerType = "Y".equals(answer) ? YesNoDataType.Y_YES
                : YesNoDataType.N_NO;
	        return answerType;
	    } else {
            return null;
        }
	}

	/**
	 * This method creates {@link XmlObject} of type
	 * {@link PHS398Checklist13Document} by populating data from the given
	 * {@link ProposalDevelopmentDocumentContract}
	 * 
	 * @param proposalDevelopmentDocument
	 *            for which the {@link XmlObject} needs to be created
	 * @return {@link XmlObject} which is generated using the given
	 *         {@link ProposalDevelopmentDocumentContract}
	 */
	public XmlObject getFormObject(
			ProposalDevelopmentDocumentContract proposalDevelopmentDocument) {
		this.pdDoc = proposalDevelopmentDocument;
		return getPHS398Checklist();
	}

    public RolodexService getRolodexService() {
        return rolodexService;
    }

    public void setRolodexService(RolodexService rolodexService) {
        this.rolodexService = rolodexService;
    }

    @Override
    public String getNamespace() {
        return namespace;
    }

    public void setNamespace(String namespace) {
        this.namespace = namespace;
    }

    @Override
    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    @Override
    public Resource getStylesheet() {
        return stylesheet;
    }

    public void setStylesheet(Resource stylesheet) {
        this.stylesheet = stylesheet;
    }

    @Override
    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    @Override
    public int getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(int sortIndex) {
        this.sortIndex = sortIndex;
    }
}
