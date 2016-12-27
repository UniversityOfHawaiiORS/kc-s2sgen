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

import gov.grants.apply.forms.performanceSite20V20.PerformanceSite20Document;
import gov.grants.apply.forms.performanceSite20V20.SiteLocationDataType;
import gov.grants.apply.forms.performanceSite20V20.PerformanceSite20Document.PerformanceSite20;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType;
import gov.grants.apply.system.globalLibraryV20.YesNoDataType;

import java.util.List;

import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.common.api.org.OrganizationContract;
import org.kuali.coeus.common.api.org.OrganizationYnqContract;
import org.kuali.coeus.common.api.rolodex.RolodexContract;
import org.kuali.coeus.common.api.rolodex.RolodexService;
import org.kuali.coeus.propdev.api.location.CongressionalDistrictContract;
import org.kuali.coeus.propdev.api.location.ProposalSiteContract;
import org.kuali.coeus.s2sgen.impl.generate.FormGenerator;
import org.kuali.coeus.s2sgen.impl.generate.FormVersion;
import org.kuali.coeus.s2sgen.impl.validate.S2SErrorHandlerService;
import org.kuali.coeus.propdev.api.core.ProposalDevelopmentDocumentContract;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;

/**
 * 
 * This class is used to generate XML Document object for grants.gov
 * PerformanceSiteV2.0. This form is generated using XMLBean API's generated by
 * compiling PerformanceSiteV2.0 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
@FormGenerator("PerformanceSiteV2_0Generator")
public class PerformanceSiteV2_0Generator extends PerformanceSiteBaseGenerator {

	private static final String QUESTION_ID_FOR_INDIVIDUAL_YNQ = "30";
    private static final int PERFORMING_ORG_LOCATION_TYPE_CODE = 2;
    private static final int OTHER_ORG_LOCATION_TYPE_CODE = 3;
    private static final int PERFORMANCE_SITE_LOCATION_TYPE_CODE = 4;

    @Value("http://apply.grants.gov/forms/PerformanceSite_2_0-V2.0")
    private String namespace;

    @Value("PerformanceSite_2_0")
    private String formName;

    @Value("classpath:org/kuali/coeus/s2sgen/impl/generate/support/stylesheet/PerformanceSite-V2.0.xsl")
    private Resource stylesheet;

    @Value("gov.grants.apply.forms.performanceSite20V20")
    private String packageName;

    @Value("130")
    private int sortIndex;

    @Autowired
    @Qualifier("rolodexService")
    private RolodexService rolodexService;

    @Autowired
    @Qualifier("s2SErrorHandlerService")
    private S2SErrorHandlerService s2SErrorHandlerService;

	private PerformanceSite20Document getPerformanceSite() {
		PerformanceSite20Document performanceSite14Document = PerformanceSite20Document.Factory
				.newInstance();
		PerformanceSite20 performanceSite14 = PerformanceSite20.Factory
				.newInstance();
		performanceSite14.setFormVersion(FormVersion.v2_0.getVersion());
		setOtherSites(performanceSite14);
		AttachedFileDataType attachedFile = getAttachedFileDataType("40");
		if(attachedFile!=null){
		    performanceSite14.setAttachedFile(attachedFile);
		}
		performanceSite14Document.setPerformanceSite20(performanceSite14);
		return performanceSite14Document;
	}


	private void setSiteLocationDataType(
			SiteLocationDataType siteLocationDataType, OrganizationContract organization) {
		if (organization.getOrganizationYnqs() != null
				&& !organization.getOrganizationYnqs().isEmpty()) {
			for (OrganizationYnqContract organizationYnq : organization
					.getOrganizationYnqs()) {
				if (organizationYnq.getQuestionId().equals(
						QUESTION_ID_FOR_INDIVIDUAL_YNQ)) {
					YesNoDataType.Enum answer = organizationYnq.getAnswer()
							.equals("Y") ? YesNoDataType.Y_YES
							: YesNoDataType.N_NO;
					siteLocationDataType.setIndividual(answer);
				}
			}
		}
	}

    private void setOtherSites(PerformanceSite20  performanceSite) {
        List<? extends ProposalSiteContract> proposalSites = pdDoc.getDevelopmentProposal().getProposalSites();
        if (proposalSites != null) {
            OrganizationContract organization = null;
            RolodexContract rolodex = null;
            SiteLocationDataType siteLocationDataType = null;
            for (ProposalSiteContract proposalSite : proposalSites) {
                switch(proposalSite.getLocationTypeCode()){
                    case(PERFORMING_ORG_LOCATION_TYPE_CODE):
                        siteLocationDataType = performanceSite.addNewPrimarySite();
                        organization = proposalSite.getOrganization();
                        setSiteLocationDataType(siteLocationDataType, organization);
                        rolodex = rolodexService.getRolodex(organization.getContactAddressId());
                        siteLocationDataType.setOrganizationName(proposalSite.getLocationName());
                        break;
                    case(OTHER_ORG_LOCATION_TYPE_CODE):
                        organization = proposalSite.getOrganization();
                        rolodex = rolodexService.getRolodex(organization.getContactAddressId());
                        siteLocationDataType = performanceSite.addNewOtherSite();
                        siteLocationDataType.setOrganizationName(organization.getOrganizationName());
                        break;
                    case(PERFORMANCE_SITE_LOCATION_TYPE_CODE):
                        organization = proposalSite.getOrganization();
                        rolodex = proposalSite.getRolodex();
                        siteLocationDataType = performanceSite.addNewOtherSite();
                        siteLocationDataType.setOrganizationName(rolodex.getOrganization());
                        break;
                }
                if(siteLocationDataType!=null){
                    siteLocationDataType.setAddress(globLibV20Generator.getAddressDataType(rolodex));
                    if (organization!=null && organization.getDunsNumber() != null) {
                        siteLocationDataType.setDUNSNumber(organization.getDunsNumber());
                    }
                    String congressionalDistrict = getCongressionalDistrict(proposalSite);
                    if (congressionalDistrict == null) {
                        getAuditErrors().add(s2SErrorHandlerService.getError(CONGRESSIONAL_DISTRICT, getFormName()));
                        siteLocationDataType.setCongressionalDistrictProgramProject(null);
                    }else{
                        siteLocationDataType.setCongressionalDistrictProgramProject(congressionalDistrict);
                    }
                }
            }
        }
    }

    private String getCongressionalDistrict(ProposalSiteContract proposalSite) {
        String congDistrictProject = null;
        for (CongressionalDistrictContract congDistrict : proposalSite.getCongressionalDistricts()) {
            congDistrictProject = congDistrict.getCongressionalDistrict();
            if (congDistrictProject != null && congDistrictProject.length() > CONGRESSIONAL_DISTRICT_MAX_LENGTH) {
                congDistrictProject = congDistrictProject.substring(0, CONGRESSIONAL_DISTRICT_MAX_LENGTH);
            }
        }
        return congDistrictProject;
    }

	/**
	 * This method creates {@link XmlObject} of type
	 * {@link PerformanceSite20Document} by populating data from the given
	 * {@link ProposalDevelopmentDocumentContract}
	 * 
	 * @param proposalDevelopmentDocument
	 *            for which the {@link XmlObject} needs to be created
	 * @return {@link XmlObject} which is generated using the given
	 *         {@link ProposalDevelopmentDocumentContract}
	 */
	@Override
    public PerformanceSite20Document getFormObject(
			ProposalDevelopmentDocumentContract proposalDevelopmentDocument) {
		this.pdDoc = proposalDevelopmentDocument;
		return getPerformanceSite();
	}

    public RolodexService getRolodexService() {
        return rolodexService;
    }

    public void setRolodexService(RolodexService rolodexService) {
        this.rolodexService = rolodexService;
    }

    public S2SErrorHandlerService getS2SErrorHandlerService() {
        return s2SErrorHandlerService;
    }

    public void setS2SErrorHandlerService(S2SErrorHandlerService s2SErrorHandlerService) {
        this.s2SErrorHandlerService = s2SErrorHandlerService;
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
