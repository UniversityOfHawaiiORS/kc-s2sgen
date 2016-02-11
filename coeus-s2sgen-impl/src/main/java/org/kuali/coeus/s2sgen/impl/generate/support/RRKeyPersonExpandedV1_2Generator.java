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

import gov.grants.apply.forms.rrKeyPersonExpanded12V12.PersonProfileDataType;
import gov.grants.apply.forms.rrKeyPersonExpanded12V12.PersonProfileDataType.Profile;
import gov.grants.apply.forms.rrKeyPersonExpanded12V12.PersonProfileDataType.Profile.OtherProjectRoleCategory;
import gov.grants.apply.forms.rrKeyPersonExpanded12V12.ProjectRoleDataType;
import gov.grants.apply.forms.rrKeyPersonExpanded12V12.RRKeyPersonExpanded12Document;
import gov.grants.apply.forms.rrKeyPersonExpanded12V12.RRKeyPersonExpanded12Document.RRKeyPersonExpanded12;
import gov.grants.apply.forms.rrKeyPersonExpanded12V12.RRKeyPersonExpanded12Document.RRKeyPersonExpanded12.AdditionalProfilesAttached;
import gov.grants.apply.forms.rrKeyPersonExpanded12V12.RRKeyPersonExpanded12Document.RRKeyPersonExpanded12.BioSketchsAttached;
import gov.grants.apply.forms.rrKeyPersonExpanded12V12.RRKeyPersonExpanded12Document.RRKeyPersonExpanded12.SupportsAttached;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType;

import org.apache.commons.lang3.StringUtils;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.common.api.person.KcPersonContract;
import org.kuali.coeus.common.api.rolodex.RolodexContract;
import org.kuali.coeus.common.api.rolodex.RolodexService;
import org.kuali.coeus.common.api.unit.UnitContract;
import org.kuali.coeus.propdev.api.core.DevelopmentProposalContract;
import org.kuali.coeus.propdev.api.person.ProposalPersonContract;
import org.kuali.coeus.propdev.api.person.ProposalPersonDegreeContract;
import org.kuali.coeus.propdev.api.core.ProposalDevelopmentDocumentContract;
import org.kuali.coeus.propdev.api.attachment.NarrativeContract;
import org.kuali.coeus.s2sgen.impl.generate.FormGenerator;
import org.kuali.coeus.s2sgen.api.core.AuditError;
import org.kuali.coeus.s2sgen.impl.generate.FormVersion;
import org.kuali.coeus.s2sgen.impl.util.FieldValueConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/**
 * This class generates RRKeyPersonExpanded xml object. It uses xmlbeans for
 * generation of the form. Form is generated based on RRKeyPersonExpanded
 * version 1.2 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
@FormGenerator("RRKeyPersonExpandedV1_2Generator")
public class RRKeyPersonExpandedV1_2Generator extends
		RRKeyPersonExpandedBaseGenerator {

	RolodexContract rolodex;

    @Value("http://apply.grants.gov/forms/RR_KeyPersonExpanded_1_2-V1.2")
    private String namespace;

    @Value("RR_KeyPersonExpanded_1_2-V1.2")
    private String formName;

    @Value("classpath:org/kuali/coeus/s2sgen/impl/generate/support/stylesheet/RR_KeyPersonExpanded-V1.2.xsl")
    private Resource stylesheet;

    @Value("gov.grants.apply.forms.rrKeyPersonExpanded12V12")
    private String packageName;

    @Value("155")
    private int sortIndex;

    @Autowired
    @Qualifier("rolodexService")
    private RolodexService rolodexService;

	/*
	 * This method gives details of Principal Investigator,KeyPersons and the
	 * corresponding attachments for RRKeyPersons
	 * 
	 */
	private RRKeyPersonExpanded12Document getRRKeyPersonExpanded() {
		RRKeyPersonExpanded12Document rrKeyPersonExpandedDocument = RRKeyPersonExpanded12Document.Factory
				.newInstance();
		RRKeyPersonExpanded12 rrKeyPersonExpanded = RRKeyPersonExpanded12.Factory
				.newInstance();
		setRRKeyPersonExpandedAttributes(rrKeyPersonExpanded);
		rrKeyPersonExpandedDocument
				.setRRKeyPersonExpanded12(rrKeyPersonExpanded);
		return rrKeyPersonExpandedDocument;
	}

	/*
	 * This method is used to set all attributes of
	 * RRkeyPersonExpandedAttributes object
	 */
	private void setRRKeyPersonExpandedAttributes(
			RRKeyPersonExpanded12 rrKeyPersonExpanded) {
		rrKeyPersonExpanded.setFormVersion(FormVersion.v1_2.getVersion());
		rrKeyPersonExpanded.setPDPI(getPersonProfilePI());
		PersonProfileDataType[] keyPersonArray = getpersonProfileKeyPerson();
		if (keyPersonArray.length > 0) {
			rrKeyPersonExpanded.setKeyPersonArray(keyPersonArray);
		}
		saveKeyPersonAttachmentsToProposal();
		if (extraPersons.size() > 0) {
			for (ProposalPersonContract extraPerson : extraPersons) {
				setBioSketchAttchment(rrKeyPersonExpanded, extraPerson);
				setCurrentPendingTypeAttachment(rrKeyPersonExpanded,
						extraPerson);
			}
			for (NarrativeContract narrative : pdDoc.getDevelopmentProposal()
					.getNarratives()) {
				if (narrative.getNarrativeType().getCode() != null) {
					if (Integer.parseInt(narrative.getNarrativeType().getCode()) == PROFILE_TYPE) {
						setProfileTypeAttachment(rrKeyPersonExpanded, narrative);
					}
				}
			}
		}
	}

	/*
	 * This method is used to add profile type attachment to rrKeyPersonExpanded
	 */
	private void setProfileTypeAttachment(
			RRKeyPersonExpanded12 rrKeyPersonExpanded, NarrativeContract narrative) {
		AttachedFileDataType attachedFileDataType = getAttachedFileType(narrative);
		if(attachedFileDataType != null){
			AdditionalProfilesAttached additionalProfilesAttached = AdditionalProfilesAttached.Factory
					.newInstance();
			additionalProfilesAttached
					.setAdditionalProfileAttached(attachedFileDataType);
			rrKeyPersonExpanded
				.setAdditionalProfilesAttached(additionalProfilesAttached);
		}
	}

	/*
	 * This method is used to add current type pending attachment to
	 * rrKeyPersonExpanded
	 */
	private void setCurrentPendingTypeAttachment(
			RRKeyPersonExpanded12 rrKeyPersonExpanded,
			ProposalPersonContract extraPerson) {
		AttachedFileDataType supportAttachment = getPernonnelAttachments(pdDoc,
				extraPerson.getPersonId(), extraPerson.getRolodexId(),
				CURRENT_PENDING_TYPE);
		if (supportAttachment != null) {
			SupportsAttached supportsAttached = SupportsAttached.Factory
					.newInstance();
			supportsAttached.setSupportAttached(supportAttachment);
			rrKeyPersonExpanded.setSupportsAttached(supportsAttached);
		}
	}

	/*
	 * This method is used to add biosketch type attachment to
	 * rrKeyPersonExpanded
	 */
	private void setBioSketchAttchment(
			RRKeyPersonExpanded12 rrKeyPersonExpanded,
			ProposalPersonContract extraPerson) {
		BioSketchsAttached personBioSketch = BioSketchsAttached.Factory
				.newInstance();
		AttachedFileDataType bioSketchAttachment = getPernonnelAttachments(
				pdDoc, extraPerson.getPersonId(), extraPerson.getRolodexId(),
				BIOSKETCH_TYPE);
		personBioSketch.setBioSketchAttached(bioSketchAttachment);
		rrKeyPersonExpanded.setBioSketchsAttached(personBioSketch);
	}

	/*
	 * This method is used to get PersonProfile details of Principal
	 * Investigator.It also gives the information about the attachments related
	 * to the principal investigator.
	 * 
	 */
	private PersonProfileDataType getPersonProfilePI() {
		PersonProfileDataType profileDataType = PersonProfileDataType.Factory
				.newInstance();
		Profile profile = Profile.Factory.newInstance();
		ProposalPersonContract PI = s2SProposalPersonService.getPrincipalInvestigator(pdDoc);
		if (PI != null) {
			setPersonalProfileDetailsToProfile(profileDataType, profile, PI);
		}
		return profileDataType;
	}

	/*
	 * This method is used to add Person Profile details of Principal
	 * Investigator and attachments to profile
	 */
	private void setPersonalProfileDetailsToProfile(
			PersonProfileDataType profileDataType, Profile profile,
			ProposalPersonContract PI) {
		assignRolodexId(PI);
		profile.setName(globLibV20Generator.getHumanNameDataType(PI));
		setDirectoryTitleToProfile(profile, PI);
		profile.setAddress(globLibV20Generator.getAddressDataType(PI));
		profile.setPhone(PI.getOfficePhone());
		if (StringUtils.isNotEmpty(PI.getFaxNumber())) {
			profile.setFax(PI.getFaxNumber());
		}
		if (PI.getDegree() != null) {
			profile.setDegreeType(PI.getDegree());
		}
		if (PI.getYearGraduated() != null) {
			profile.setDegreeYear(PI.getYearGraduated());
		}		
		if(PI.getDegree() == null && PI.getYearGraduated() == null ){		    
		   if(PI.getProposalPersonDegrees() != null && PI.getProposalPersonDegrees().size() > 0){
		       ProposalPersonDegreeContract proposalPersonDegree = PI.getProposalPersonDegrees().get(0);
		       if(proposalPersonDegree != null){  
		           if(proposalPersonDegree.getDegreeType() != null && proposalPersonDegree.getDegreeType().getDescription()!= null)
		               profile.setDegreeType(proposalPersonDegree.getDegreeType().getDescription());
		           if(proposalPersonDegree.getGraduationYear() != null)
		               profile.setDegreeYear(proposalPersonDegree.getGraduationYear());
		       }		   
		   }		
		}
		profile.setEmail(PI.getEmailAddress());
		DevelopmentProposalContract developmentProposal = pdDoc
				.getDevelopmentProposal();
		setOrganizationName(profile, developmentProposal);
		setDepartmentNameToProfile(profile,PI);

			
		//added for KC-398, KC-421 employee key personnel set their division to their home unit if it exists
		//otherwise set their division to the proposal's Lead Unit department (see KRACOEUS-5348)
		//in the future we will need to allow division field population/editing by proposal (see KRACOEUS-5242)
		String divisionName = null;			
		if (PI.getHomeUnit() != null) {				
			divisionName = PI.getDivision();		
		}			
		else {				
			divisionName = getDivisionName(pdDoc);
		}	
		// KC-398, KC-421 END	
		if (divisionName != null) {
			profile.setDivisionName(StringUtils.substring(divisionName, 0, DIVISION_NAME_MAX_LENGTH));
		}
		if (PI.getEraCommonsUserName() != null) {
			profile.setCredential(PI.getEraCommonsUserName());
		} else {
            if (getSponsorHierarchyService().isSponsorNihMultiplePi(pdDoc.getDevelopmentProposal().getSponsor().getSponsorCode())) {
                getAuditErrors().add(new AuditError(AuditError.NO_FIELD_ERROR_KEY, ERROR_ERA_COMMON_USER_NAME + PI.getFullName(),
                        AuditError.GG_LINK));
            }
        }
		profile.setProjectRole(ProjectRoleDataType.PD_PI);
		setAttachments(profile, PI);
		profileDataType.setProfile(profile);
	}

	//added for KC-398, KC-421 employee key personnel set their division to their home unit if it exists
	//otherwise set their division to the proposal's Lead Unit department (see KRACOEUS-5348)
	//in the future we will need to allow division field population/editing by proposal (see KRACOEUS-5242)
	/**
     * This method is to get division name using the OwnedByUnit and traversing through the parent units till the top level
     *
     * @param pdDoc Proposal development document.
     * @return divisionName based on the OwnedByUnit.
     */
    public String getDivisionName(ProposalDevelopmentDocumentContract pdDoc) {
        String divisionName = null;
        if (pdDoc != null && pdDoc.getDevelopmentProposal().getOwnedByUnit() != null) {
            UnitContract ownedByUnit = pdDoc.getDevelopmentProposal().getOwnedByUnit();
            // traverse through the parent units till the top level unit
            while (ownedByUnit.getParentUnit() != null) {
                ownedByUnit = ownedByUnit.getParentUnit();
            }
            divisionName = ownedByUnit.getUnitName();
            if (divisionName.length() > DIVISION_NAME_MAX_LENGTH) {
                divisionName = divisionName.substring(0, DIVISION_NAME_MAX_LENGTH);
            }
        }
        return divisionName;
    }
    // END KC-398, KC-421
    

	/*
	 * This method is used to add department name to profile
	 */
	private void setDepartmentNameToProfile(Profile profile, ProposalPersonContract PI) {
		if(PI.getHomeUnit() != null && PI.getPerson() != null) {
            String departmentName =  PI.getPerson().getOrganizationIdentifier();
            // KC-398 Prevent S2S errors because length is too long
            if(departmentName.length() > DEPARTMENT_NAME_MAX_LENGTH) {
            	departmentName = departmentName.substring(0, DEPARTMENT_NAME_MAX_LENGTH);
			}
            // KC-398 END
            profile.setDepartmentName(departmentName);
        }
        else
        {
            DevelopmentProposalContract developmentProposal = pdDoc.getDevelopmentProposal();
            // KC-398 Prevent S2S errors because length is too long
            String departmentName = developmentProposal.getOwnedByUnit().getUnitName();
            if(departmentName.length() > DEPARTMENT_NAME_MAX_LENGTH) {
            	departmentName = departmentName.substring(0, DEPARTMENT_NAME_MAX_LENGTH);
        }
            // KC-398 END
            profile.setDepartmentName(departmentName);
        }
	}

	/*
	 * This method is used to add directory title to profile
	 */
	private void setDirectoryTitleToProfile(Profile profile, ProposalPersonContract PI) {
		if (PI.getDirectoryTitle() != null) {
			if (PI.getDirectoryTitle().length() > DIRECTORY_TITLE_MAX_LENGTH) {
				profile.setTitle(PI.getDirectoryTitle().substring(0,
						DIRECTORY_TITLE_MAX_LENGTH));
			} else {
				profile.setTitle(PI.getDirectoryTitle());
			}
		}
	}

	/*
	 * This method is used to assign rolodex id
	 */
	private void assignRolodexId(ProposalPersonContract PI) {
	    if (PI.getPersonId() != null) {
            pIPersonOrRolodexId = PI.getPersonId();
             rolodex = null;
        } else if (PI.getRolodexId() != null) {
            pIPersonOrRolodexId = PI.getRolodexId().toString();
            rolodex = rolodexService.getRolodex(Integer.valueOf(pIPersonOrRolodexId));
        }
	}

	/*
	 * This method is used to add attachments related to principle indicator
	 */
	private void setAttachments(Profile profile, ProposalPersonContract PI) {
		setBioSketchAttachment(profile, PI);
		setCurrentPendingAttachment(profile, PI);
	}

	/*
	 * This method is used to add the current pending type attachment to profile
	 */
	private void setCurrentPendingAttachment(Profile profile, ProposalPersonContract PI) {
		AttachedFileDataType supportAttachment = getPernonnelAttachments(pdDoc,
				PI.getPersonId(), PI.getRolodexId(), CURRENT_PENDING_TYPE);
		if (supportAttachment != null) {
			PersonProfileDataType.Profile.SupportsAttached supportsAttached = PersonProfileDataType.Profile.SupportsAttached.Factory
					.newInstance();
			supportsAttached.setSupportAttached(supportAttachment);
			profile.setSupportsAttached(supportsAttached);
		}
	}

	/*
	 * This method is used to add the bioskectch attachment to profile
	 */
	private void setBioSketchAttachment(Profile profile, ProposalPersonContract PI) {
		PersonProfileDataType.Profile.BioSketchsAttached personBioSketch = PersonProfileDataType.Profile.BioSketchsAttached.Factory
				.newInstance();
		AttachedFileDataType bioSketchAttachment = getPernonnelAttachments(
				pdDoc, PI.getPersonId(), PI.getRolodexId(), BIOSKETCH_TYPE);
		personBioSketch.setBioSketchAttached(bioSketchAttachment);
		profile.setBioSketchsAttached(personBioSketch);
	}

	/*
	 * This method returns an array of PersonProfileDataType which contains the
	 * PersonProfile details and corresponding attachments for a particular Key
	 * person. The PersonProfileDataType array will have maximum of 39 key
	 * persons.
	 * 
	 */
	private PersonProfileDataType[] getpersonProfileKeyPerson() {
		List<PersonProfileDataType> personProfileDataTypeList = new ArrayList<PersonProfileDataType>();
		DevelopmentProposalContract developmentProposal = pdDoc
				.getDevelopmentProposal();
		List<? extends ProposalPersonContract> keyPersons = developmentProposal
				.getProposalPersons();
		if (keyPersons != null) {
			Collections.sort(keyPersons, new ProposalPersonComparator());
		}
		List<ProposalPersonContract> nKeyPersons = s2SProposalPersonService.getNKeyPersons(
				keyPersons, true, MAX_KEY_PERSON_COUNT);
		extraPersons = s2SProposalPersonService.getNKeyPersons(keyPersons, false,
				MAX_KEY_PERSON_COUNT);
		if (nKeyPersons.size() > 0) {
			setKeyPersonToPersonProfileDataType(personProfileDataTypeList,
					nKeyPersons);
		}
		PersonProfileDataType[] personProfileDataArray = new PersonProfileDataType[0];
		personProfileDataArray = personProfileDataTypeList
				.toArray(personProfileDataArray);
		return personProfileDataArray;
	}

	/*
	 * This method is used to add key person to person profile data type
	 */
	private void setKeyPersonToPersonProfileDataType(
			List<PersonProfileDataType> personProfileDataTypeList,
			List<ProposalPersonContract> nKeyPersons) {
		for (ProposalPersonContract keyPerson : nKeyPersons) {
			if (pIPersonOrRolodexId != null) {
				// Don't add PI to keyperson list
				if (keyPerson.getPersonId() != null
						&& keyPerson.getPersonId().equals(pIPersonOrRolodexId)) {
					continue;
				} else if ((keyPerson.getRolodexId() != null)
						&& pIPersonOrRolodexId.equals(keyPerson.getRolodexId()
								.toString())) {
					continue;
				}
			}
			Profile profileKeyPerson = Profile.Factory.newInstance();
			setAllkeyPersonDetailsToKeyPerson(keyPerson, profileKeyPerson);
			setAttachments(profileKeyPerson, keyPerson);
			PersonProfileDataType personProfileDataTypeKeyPerson = PersonProfileDataType.Factory
					.newInstance();
			personProfileDataTypeKeyPerson.setProfile(profileKeyPerson);
			personProfileDataTypeList.add(personProfileDataTypeKeyPerson);
		}
	}

	/*
	 * This method is used to add all key person details to key person
	 */
	private void setAllkeyPersonDetailsToKeyPerson(ProposalPersonContract keyPerson,
            Profile profileKeyPerson) {
        assignRolodexId(keyPerson);
		profileKeyPerson.setName(globLibV20Generator
				.getHumanNameDataType(keyPerson));
		setDirectoryTitleToProfile(profileKeyPerson, keyPerson);
		profileKeyPerson.setAddress(globLibV20Generator
				.getAddressDataType(keyPerson));
		profileKeyPerson.setPhone(keyPerson.getOfficePhone());
		if (StringUtils.isNotEmpty(keyPerson.getFaxNumber())) {
			profileKeyPerson.setFax(keyPerson.getFaxNumber());
		}
		if (keyPerson.getDegree() != null) {
			profileKeyPerson.setDegreeType(keyPerson.getDegree());
		}
		if (keyPerson.getYearGraduated() != null) {
			profileKeyPerson.setDegreeYear(keyPerson.getYearGraduated());
		}
		if(keyPerson.getDegree() == null && keyPerson.getYearGraduated() == null ){
	          if(keyPerson.getProposalPersonDegrees() != null && keyPerson.getProposalPersonDegrees().size() > 0){
	              ProposalPersonDegreeContract proposalPersonDegree = keyPerson.getProposalPersonDegrees().get(0);
	              if(proposalPersonDegree != null){  
	                  if(proposalPersonDegree.getDegreeType() != null &&proposalPersonDegree.getDegreeType().getDescription() != null)
	                      profileKeyPerson.setDegreeType(proposalPersonDegree.getDegreeType().getDescription());
	                  if(proposalPersonDegree.getGraduationYear() != null)
	                      profileKeyPerson.setDegreeYear(proposalPersonDegree.getGraduationYear());
	              }	            
	          }  
	     }
		profileKeyPerson.setEmail(keyPerson.getEmailAddress());
		DevelopmentProposalContract developmentProposal = pdDoc
				.getDevelopmentProposal();
		
		// KC-398, KC-421 BEGIN
		//added for KC-398, KC-421  non-employee key personnel set their organization to their rolodex organization entry
		//and leave their departname and division blank
		if( keyPerson.getRolodexId() != null) {		
			RolodexContract rolo = rolodexService.getRolodex(keyPerson.getRolodexId());						
			if (rolo.getOrganization() != null) {
				profileKeyPerson.setOrganizationName(rolo.getOrganization());
			}
		} else {		
		setOrganizationName(profileKeyPerson, developmentProposal);
			
			//added for KC-398, KC-421 employee key personnel set their department to their home unit if it exists
			//otherwise set their department to the proposal's Lead Unit department (see KRACOEUS-5348)
			if (keyPerson.getHomeUnit() != null) {
				KcPersonContract kcPerson = keyPerson.getPerson();
	            String deptName =  kcPerson.getOrganizationIdentifier();
				if(deptName != null) {
					//added for KC-398,  KC-421 reopen
					//need to truncate the department name to 30 characters to avoid
					//apply.grants.gov-system-GlobalLibrary-V2.0, error: cvc-maxLength-valid.1.1: string length (x) is greater than maxLength facet (30) for DepartmentNameDataType
					if(deptName.length() > DEPARTMENT_NAME_MAX_LENGTH) {
						deptName = deptName.substring(0, DEPARTMENT_NAME_MAX_LENGTH);
					}		
					profileKeyPerson.setDepartmentName(deptName);
				}
			} else {
		setDepartmentNameToProfile(profileKeyPerson,keyPerson);
			}
			
			//added for KC-398, KC-421 employee key personnel set their division to their home unit if it exists
			//otherwise set their division to the proposal's Lead Unit department (see KRACOEUS-5348)
			//in the future we will need to allow division field population/editing by proposal (see KRACOEUS-5242)
			String divisionName = null;			
			if (keyPerson.getHomeUnit() != null) {
				divisionName = keyPerson.getDivision();
			} else {				
				divisionName = getDivisionName(pdDoc);
			}
                // KC-398, KC-421 END	
		if (divisionName != null) {
			profileKeyPerson.setDivisionName(StringUtils.substring(divisionName, 0, DIVISION_NAME_MAX_LENGTH));
		}
		if (keyPerson.getEraCommonsUserName() != null) {
			profileKeyPerson.setCredential(keyPerson.getEraCommonsUserName());
		} else {
            if (getSponsorHierarchyService().isSponsorNihMultiplePi(pdDoc.getDevelopmentProposal().getSponsor().getSponsorCode())) {
                if (keyPerson.isMultiplePi()) {
                    getAuditErrors().add(new AuditError(AuditError.NO_FIELD_ERROR_KEY, ERROR_ERA_COMMON_USER_NAME + keyPerson.getFullName(),
                            AuditError.GG_LINK));
                }
            }
        }
        if (keyPerson.isMultiplePi() || keyPerson.isCoInvestigator()) {
            if(getSponsorHierarchyService().isSponsorNihMultiplePi(pdDoc.getDevelopmentProposal().getSponsor().getSponsorCode())){
                if (keyPerson.isMultiplePi()) {
                    profileKeyPerson.setProjectRole(ProjectRoleDataType.PD_PI);
                } else {
                    profileKeyPerson.setProjectRole(ProjectRoleDataType.CO_INVESTIGATOR);
                }
            }else{
                profileKeyPerson.setProjectRole(ProjectRoleDataType.CO_PD_PI);
            }
        } else {
			setProjectRoleCategoryToProfile(keyPerson, profileKeyPerson);
		}
	}
	}

	private void setOrganizationName(Profile profileKeyPerson,
			DevelopmentProposalContract developmentProposal) {
		if (developmentProposal.getApplicantOrganization() != null
				&& developmentProposal.getApplicantOrganization()
						.getOrganization() != null) {
		    if (rolodex != null){
                profileKeyPerson.setOrganizationName(rolodex.getOrganization());
            }
            else
                profileKeyPerson.setOrganizationName(developmentProposal
                    .getApplicantOrganization().getOrganization()
                    .getOrganizationName());
		}
	}

	/*
	 * This method is used to add project role category to profile
	 */
	private void setProjectRoleCategoryToProfile(ProposalPersonContract keyPerson,
			Profile profileKeyPerson) {
		profileKeyPerson.setProjectRole(ProjectRoleDataType.OTHER_SPECIFY);
		OtherProjectRoleCategory otherProjectRole = OtherProjectRoleCategory.Factory
				.newInstance();
		String otherRole;
		if (keyPerson.getProjectRole() != null) {
			if (keyPerson.getProjectRole().length() > ROLE_DESCRIPTION_MAX_LENGTH) {
				otherRole = keyPerson.getProjectRole().substring(0,
						ROLE_DESCRIPTION_MAX_LENGTH);
			} else {
				otherRole = keyPerson.getProjectRole();
			}
		} else {
			otherRole = FieldValueConstants.VALUE_UNKNOWN;
		}
		otherProjectRole.setStringValue(otherRole);
		profileKeyPerson.setOtherProjectRoleCategory(otherProjectRole);
	}

	/**
	 * This method creates {@link XmlObject} of type
	 * {@link RRKeyPersonExpanded12Document} by populating data from the given
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
		return getRRKeyPersonExpanded();
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
