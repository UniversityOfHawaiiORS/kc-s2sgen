/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
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

import gov.grants.apply.forms.nsfCoverPageV11.DegreeTypeDataType;
import gov.grants.apply.forms.nsfCoverPageV11.NSFCoverPageDocument;
import gov.grants.apply.forms.nsfCoverPageV11.NSFCoverPageDocument.NSFCoverPage;
import gov.grants.apply.forms.nsfCoverPageV11.NSFCoverPageDocument.NSFCoverPage.CoPIInfo;
import gov.grants.apply.forms.nsfCoverPageV11.NSFCoverPageDocument.NSFCoverPage.CoPIInfo.CoPI;
import gov.grants.apply.forms.nsfCoverPageV11.NSFCoverPageDocument.NSFCoverPage.NSFUnitConsideration;
import gov.grants.apply.forms.nsfCoverPageV11.NSFCoverPageDocument.NSFCoverPage.OtherInfo;
import gov.grants.apply.forms.nsfCoverPageV11.NSFCoverPageDocument.NSFCoverPage.PIInfo;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType;
import gov.grants.apply.system.attachmentsV10.AttachmentGroupMin1Max100DataType;
import gov.grants.apply.system.globalLibraryV20.YesNoDataType;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.common.api.type.ProposalTypeContract;
import org.kuali.coeus.common.api.ynq.YnqConstant;
import org.kuali.coeus.propdev.api.person.ProposalPersonContract;
import org.kuali.coeus.propdev.api.person.ProposalPersonDegreeContract;
import org.kuali.coeus.propdev.api.person.ProposalPersonYnqContract;
import org.kuali.coeus.propdev.api.ynq.ProposalYnqContract;
import org.kuali.coeus.propdev.api.core.ProposalDevelopmentDocumentContract;
import org.kuali.coeus.propdev.api.attachment.NarrativeContract;
import org.kuali.coeus.s2sgen.impl.generate.FormGenerator;
import org.kuali.coeus.s2sgen.impl.generate.FormVersion;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;


import java.util.ArrayList;
import java.util.List;

/**
 * 
 * This class is used to generate XML Document object for grants.gov NSFCoverPageV1.1. This form is generated using XMLBean API's
 * generated by compiling NSFCoverPageV1.1 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
@FormGenerator("NSFCoverPageV1_1Generator")
public class NSFCoverPageV1_1Generator extends NSFCoverPageBaseGenerator {

    @Value("http://apply.grants.gov/forms/NSF_CoverPage-V1.1")
    private String namespace;

    @Value("NSF_CoverPage-V1.1")
    private String formName;

    @Value("classpath:org/kuali/coeus/s2sgen/impl/generate/support/stylesheet/NSF_CoverPage-V1.1.fo.xsl")
    private Resource stylesheet;

    @Value("gov.grants.apply.forms.nsfCoverPageV11")
    private String packageName;

    @Value(DEFAULT_SORT_INDEX)
    private int sortIndex;

    private static final String QUESTION_ID_ACCOMPLISHMENT_RENEWAL = "5";
    private static final String QUESTION_ID_ISCURRENT_PI = "19";
    private static final int PROGRAM_ANNOUNCEMENT_NUMBER_MAX_LENGTH = 40;
    private static final DegreeTypeDataType.Enum DEFAULT_DEGREE_TYPE = DegreeTypeDataType.UKNW_NO_DEGREE_INFORMATION_SPECIFIED;

    /**
     * 
     * This method returns NSFCoverPageDocument object based on proposal development document which contains the
     * NSFCoverPageDocument informations NSFUnitConsideration,FundingOpportunityNumber,PIInfo,CoPIInfo,OtherInfo,and
     * SingleCopyDocuments for a particular proposal
     * 
     * @return nsfCoverPageDocument {@link XmlObject} of type NSFCoverPageDocument.
     */
    private NSFCoverPageDocument getNSFCoverPage() {

        NSFCoverPageDocument nsfCoverPageDocument = NSFCoverPageDocument.Factory.newInstance();
        NSFCoverPage nsfCoverPage = NSFCoverPage.Factory.newInstance();
        nsfCoverPage.setFormVersion(FormVersion.v1_1.getVersion());
        if (pdDoc.getDevelopmentProposal().getProgramAnnouncementNumber() != null) {
            if (pdDoc.getDevelopmentProposal().getProgramAnnouncementNumber().length() > PROGRAM_ANNOUNCEMENT_NUMBER_MAX_LENGTH) {
                nsfCoverPage.setFundingOpportunityNumber(pdDoc.getDevelopmentProposal().getProgramAnnouncementNumber().substring(0, PROGRAM_ANNOUNCEMENT_NUMBER_MAX_LENGTH));
            }
            else {
                nsfCoverPage.setFundingOpportunityNumber(pdDoc.getDevelopmentProposal().getProgramAnnouncementNumber());
            }
        }
        nsfCoverPage.setNSFUnitConsideration(getNSFUnitConsideration());
        nsfCoverPage.setPIInfo(getPIInfo());
        nsfCoverPage.setCoPIInfo(getCoPI());
        nsfCoverPage.setOtherInfo(getOtherInfo());
        AttachmentGroupMin1Max100DataType attachmentGroup = AttachmentGroupMin1Max100DataType.Factory.newInstance();
        attachmentGroup.setAttachedFileArray(getAttachedFileDataTypes());
        nsfCoverPage.setSingleCopyDocuments(attachmentGroup);
        nsfCoverPageDocument.setNSFCoverPage(nsfCoverPage);
        return nsfCoverPageDocument;
    }

    /**
     * 
     * This method returns PIInfo informations such as DegreeType,DegreeYear,CurrentPI status, for the PI.
     * 
     * @return PIInfo object containing principal investigator Degree details.
     */
    private PIInfo getPIInfo() {
        PIInfo pInfo = PIInfo.Factory.newInstance();
        ProposalPersonContract PI = s2SProposalPersonService.getPrincipalInvestigator(pdDoc);
        if (PI != null) {
            for (ProposalPersonDegreeContract personDegree : PI.getProposalPersonDegrees()) {
                DegreeTypeDataType.Enum degreeType = DEFAULT_DEGREE_TYPE;
                if (personDegree.getDegreeType() != null && personDegree.getDegreeType().getCode() != null) {
                    StringBuilder degreeTypeDetail = new StringBuilder();
                    degreeTypeDetail.append(personDegree.getDegreeType().getCode());
                    degreeTypeDetail.append(": ");
                    degreeTypeDetail.append(personDegree.getDegreeType().getDescription());
                    degreeType = DegreeTypeDataType.Enum.forString(degreeTypeDetail.toString());
                    if(degreeType==null){
                        //Some degrees in nthe database are not available DegreeType. Therefor this extra check.
                        degreeType=DEFAULT_DEGREE_TYPE;
                    }
                }
                else {
                    degreeType = DEFAULT_DEGREE_TYPE;
                }
                pInfo.setDegreeType(degreeType);
                if (personDegree.getGraduationYear() != null) {
                    pInfo.setDegreeYear(getYearAsCalendar(personDegree.getGraduationYear()));
                }
            }
            pInfo.setIsCurrentPI(getYNQAnswer(QUESTION_ID_ISCURRENT_PI));
        }
        return pInfo;
    }

    /**
     * 
     * This method returns CoPIInfo informations such as Name,DegreeType,DegreeYear for the CoPI.
     * 
     * @return CoPIInfo object containing Co-principal investigator Degree details.
     */
    private CoPIInfo getCoPI() {

        CoPIInfo coPIInfo = CoPIInfo.Factory.newInstance();
        int count = 0;
        ProposalPersonContract coInvestigator = null;
        for (ProposalPersonContract proposalPerson : pdDoc.getDevelopmentProposal().getProposalPersons()) {
            if (proposalPerson.getProposalPersonRoleId() != null
                    && proposalPerson.getProposalPersonRoleId().equals(PI_C0_INVESTIGATOR)) {
                count++;
            }
        }
        CoPI[] coPIArray = new CoPI[count];
        count = 0;

        for (ProposalPersonContract proposalPerson : pdDoc.getDevelopmentProposal().getProposalPersons()) {
            if (proposalPerson.getProposalPersonRoleId() != null
                    && proposalPerson.getProposalPersonRoleId().equals(PI_C0_INVESTIGATOR)) {
                coInvestigator = proposalPerson;
                CoPI coPI = CoPI.Factory.newInstance();
                coPI.setName(globLibV20Generator.getHumanNameDataType(coInvestigator));
                for (ProposalPersonDegreeContract personDegree : coInvestigator.getProposalPersonDegrees()) {
                    DegreeTypeDataType.Enum degreeType = DEFAULT_DEGREE_TYPE;
                    if (personDegree!=null && personDegree.getDegreeType() != null && personDegree.getDegreeType().getCode() != null) {
                        StringBuilder degreeTypeDetail = new StringBuilder();
                        degreeTypeDetail.append(personDegree.getDegreeType().getCode());
                        degreeTypeDetail.append(": ");
                        degreeTypeDetail.append(personDegree.getDegreeType().getDescription());
                        degreeType = DegreeTypeDataType.Enum.forString(degreeTypeDetail.toString());
                        if(degreeType==null){
                            //Some degrees in the database are not available DegreeType. Therefor this extra check.
                            degreeType=DEFAULT_DEGREE_TYPE;
                        }
                    }
                    coPI.setDegreeType(degreeType);
                    if (personDegree.getGraduationYear() != null) {
                        coPI.setDegreeYear(getYearAsCalendar(personDegree.getGraduationYear()));
                    }
                }
                coPIArray[count] = coPI;
                count++;
            }
        }
        coPIInfo.setCoPIArray(coPIArray);
        return coPIInfo;
    }

    /**
     * 
     * This method returns Investigator status,DisclosureLobbyingActivities,ExploratoryResearch,HistoricPlaces,
     * HighResolutionGraphics and AccomplishmentRenewal information for the OtherInfo type.
     * 
     * @return OtherInfo object containing other informations about the principal investigator.
     */
    private OtherInfo getOtherInfo() {
        OtherInfo otherInfo = OtherInfo.Factory.newInstance();
        YesNoDataType.Enum yesNoDataType = getYNQAnswer(QUESTION_ID_BEGIN_INVESTIGATOR);
        if (yesNoDataType != null) {
            otherInfo.setIsBeginInvestigator(yesNoDataType);
        }
        yesNoDataType = getLobbyingAnswer();
        if (yesNoDataType != null) {
            otherInfo.setIsDisclosureLobbyingActivities(yesNoDataType);
        }
        yesNoDataType = getYNQAnswer(QUESTION_ID_EXPLORATORY_RESEARCH);
        if (yesNoDataType != null) {
            otherInfo.setIsExploratoryResearch(yesNoDataType);
        }
        yesNoDataType = getYNQAnswer(QUESTION_ID_HISTORIC_PLACES);
        if (yesNoDataType != null) {
            otherInfo.setIsHistoricPlaces(yesNoDataType);
        }

        ProposalTypeContract proposalType = pdDoc.getDevelopmentProposal()
                .getProposalType();
        if (proposalType != null && proposalType.getCode() != null) {
            otherInfo.setIsAccomplishmentRenewal(proposalType.getCode().equals(QUESTION_ID_ACCOMPLISHMENT_RENEWAL) ? YesNoDataType.Y_YES
                    : YesNoDataType.N_NO);
        }
        yesNoDataType = getYNQAnswer(QUESTION_ID_RESOLUTION_GRAPHICS);
        if (yesNoDataType != null) {
            otherInfo.setIsHighResolutionGraphics(yesNoDataType);
        }
        return otherInfo;
    }

    /**
     * 
     * This method YesNo data type YNQ answers based on the ProposalYnq QuestionId
     * 
     * @param questionId Proposal Ynq question id
     * @return answer (YesNoDataType.Enum) corresponding to the question id.
     */
    private YesNoDataType.Enum getYNQAnswer(String questionId) {

        YesNoDataType.Enum answer = null;
        for (ProposalYnqContract proposalYnq : pdDoc.getDevelopmentProposal().getProposalYnqs()) {
            if (proposalYnq.getYnq() != null && proposalYnq.getYnq().getQuestionId().equals(questionId)) {
                if (proposalYnq.getAnswer() != null) {
                    answer = (proposalYnq.getAnswer().equals(YnqConstant.YES.code()) ? YesNoDataType.Y_YES
                            : YesNoDataType.N_NO);
                }
            }
        }
        return answer;
    }

    /**
     * 
     * This method YesNo data type Lobbying answers based on the ProposalYnq QuestionId
     * 
     * @return answer (YesNoDataType.Enum) corresponding to Ynq question id.
     */
    private YesNoDataType.Enum getLobbyingAnswer() {

        YesNoDataType.Enum answer = YesNoDataType.N_NO;
        for (ProposalPersonContract proposalPerson : pdDoc.getDevelopmentProposal().getProposalPersons()) {
            if (proposalPerson.getProposalPersonRoleId() != null
                    && proposalPerson.getProposalPersonRoleId().equals(PRINCIPAL_INVESTIGATOR)
                    || PI_C0_INVESTIGATOR.equals(proposalPerson.getProposalPersonRoleId())) {
                for (ProposalPersonYnqContract personYnq : proposalPerson.getProposalPersonYnqs()) {
                    if (personYnq != null) {
                        if (personYnq.getQuestionId() != null && personYnq.getQuestionId().equals(PROPOSAL_YNQ_LOBBYING_ACTIVITIES.toString())) {
                            if (personYnq.getAnswer() != null && personYnq.getAnswer().equals(YnqConstant.YES.code())) {
                                return YesNoDataType.Y_YES;
                            }
                        }
                    }
                }
            }
        }
        return answer;
    }

    /**
     * 
     * This method returns DivisionCode and ProgramCode information for the NSFUnitConsideration type.
     * 
     * @return NSFUnitConsideration object containing unit consideration informations like Division Code and Program code.
     */
    private NSFUnitConsideration getNSFUnitConsideration() {

        NSFUnitConsideration nsfConsideration = NSFUnitConsideration.Factory.newInstance();
        nsfConsideration.setDivisionCode(pdDoc.getDevelopmentProposal().getAgencyDivisionCode());
        nsfConsideration.setProgramCode(pdDoc.getDevelopmentProposal().getAgencyProgramCode());
        return nsfConsideration;
    }

    /**
     * 
     * This method returns attachment type for the form and it can be of type Personal Data or Proprietary Information.
     * 
     * @return AttachedFileDataType[] array of attachments based on the narrative type code.
     */
	private AttachedFileDataType[] getAttachedFileDataTypes() {
		List<AttachedFileDataType> attachedFileDataTypeList = new ArrayList<AttachedFileDataType>();
		for (NarrativeContract narrative : pdDoc.getDevelopmentProposal()
				.getNarratives()) {
			if (narrative.getNarrativeType().getCode() != null) {
				int narrativeTypeCode = Integer.parseInt(narrative.getNarrativeType().getCode());
				if (narrativeTypeCode == PERSONAL_DATA
						|| narrativeTypeCode == PROPRIETARY_INFORMATION 
						|| narrativeTypeCode == SINGLE_COPY_DOCUMENT) {
                    AttachedFileDataType attachedFileDataType = getAttachedFileType(narrative);
					if(attachedFileDataType != null){
						attachedFileDataTypeList.add(attachedFileDataType);
					}
				}
			}
		}
		return attachedFileDataTypeList
				.toArray(new AttachedFileDataType[attachedFileDataTypeList
						.size()]);
	}

    /**
     * This method creates {@link XmlObject} of type {@link NSFCoverPageDocument} by populating data from the given
     * {@link ProposalDevelopmentDocumentContract}
     * 
     * @param proposalDevelopmentDocument for which the {@link XmlObject} needs to be created
     * @return {@link XmlObject} which is generated using the given {@link ProposalDevelopmentDocumentContract}
     */
    public XmlObject getFormObject(ProposalDevelopmentDocumentContract proposalDevelopmentDocument) {
        this.pdDoc = proposalDevelopmentDocument;
        return getNSFCoverPage();
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
