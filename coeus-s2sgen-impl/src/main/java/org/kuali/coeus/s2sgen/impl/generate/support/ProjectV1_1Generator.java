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

import gov.grants.apply.forms.projectV11.ProjectNarrativeAttachmentsDocument;
import gov.grants.apply.forms.projectV11.ProjectNarrativeAttachmentsDocument.ProjectNarrativeAttachments;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType;
import gov.grants.apply.system.attachmentsV10.AttachmentGroupMin1Max100DataType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.propdev.api.core.ProposalDevelopmentDocumentContract;
import org.kuali.coeus.propdev.api.attachment.NarrativeContract;
import org.kuali.coeus.s2sgen.impl.generate.FormGenerator;
import org.kuali.coeus.s2sgen.impl.generate.FormVersion;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;


import java.util.ArrayList;
import java.util.List;

/**
 * This Class is used to generate XML object for grants.gov RRPerformanceSiteV1.0. This form is generated using XMLBean classes and
 * is based on RRPerformanceSite schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
@FormGenerator("ProjectV1_1Generator")
public class ProjectV1_1Generator extends ProjectBaseGenerator {

    private static final Logger LOG = LoggerFactory.getLogger(ProjectV1_1Generator.class);

    @Value("http://apply.grants.gov/forms/Project-V1.1")
    private String namespace;

    @Value("Project-V1.1")
    private String formName;

    @Value("classpath:org/kuali/coeus/s2sgen/impl/generate/support/stylesheet/Project-V1.1.fo.xsl")
    private Resource stylesheet;

    @Value("gov.grants.apply.forms.projectV11")
    private String packageName;

    @Value(DEFAULT_SORT_INDEX)
    private int sortIndex;

    /**
     * 
     * This method is used to get Narrative Attachments for Particular Project
     * 
     * @return proAttachmentsDocument {@link XmlObject} of type ProjectNarrativeAttachmentsDocument.
     * 
     */
    private ProjectNarrativeAttachmentsDocument getProjectNarrativeAttachments() {

        ProjectNarrativeAttachmentsDocument proAttachmentsDocument = ProjectNarrativeAttachmentsDocument.Factory.newInstance();
        ProjectNarrativeAttachments proAttachments = ProjectNarrativeAttachments.Factory.newInstance();
        proAttachments.setFormVersion(FormVersion.v1_1.getVersion());
        AttachmentGroupMin1Max100DataType attMin1Max100DataType = AttachmentGroupMin1Max100DataType.Factory.newInstance();
        attMin1Max100DataType.setAttachedFileArray(getAttachedFileDataType());
        proAttachments.setAttachments(attMin1Max100DataType);
        proAttachmentsDocument.setProjectNarrativeAttachments(proAttachments);
        return proAttachmentsDocument;
    }

    /**
     * 
     * This method is used to get List of project attachments from NarrativeAttachment
     * 
     * @return AttachedFileDataType[] array of attachments for the  narrative type code PROJECT_ATTACHMENTS.
     */
    private AttachedFileDataType[] getAttachedFileDataType() {

        List<AttachedFileDataType> attachedFileDataTypeList = new ArrayList<AttachedFileDataType>();
        AttachedFileDataType attachedFileDataType = null;
        for (NarrativeContract narrative : pdDoc.getDevelopmentProposal().getNarratives()) {
            if (narrative.getNarrativeType().getCode() != null
                    && Integer.parseInt(narrative.getNarrativeType().getCode()) == PROJECT_ATTACHMENTS) {
            	attachedFileDataType = getAttachedFileType(narrative);
            	if(attachedFileDataType != null){
            		attachedFileDataTypeList.add(attachedFileDataType);
            	}
            	LOG.info("Attachmentcount" + attachedFileDataTypeList.size());
            }
        }
        return attachedFileDataTypeList.toArray(new AttachedFileDataType[0]);
    }

    /**
     * This method creates {@link XmlObject} of type {@link ProjectNarrativeAttachmentsDocument} by populating data from the given
     * {@link ProposalDevelopmentDocumentContract}
     * 
     * @param proposalDevelopmentDocument for which the {@link XmlObject} needs to be created
     * @return {@link XmlObject} which is generated using the given {@link ProposalDevelopmentDocumentContract}
     */
    public XmlObject getFormObject(ProposalDevelopmentDocumentContract proposalDevelopmentDocument) {
        this.pdDoc = proposalDevelopmentDocument;
        return getProjectNarrativeAttachments();
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
