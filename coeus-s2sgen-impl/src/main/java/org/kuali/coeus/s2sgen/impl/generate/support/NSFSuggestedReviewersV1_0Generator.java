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

import gov.grants.apply.forms.nsfSuggestedReviewersV10.NSFSuggestedReviewersDocument;
import gov.grants.apply.forms.nsfSuggestedReviewersV10.NSFSuggestedReviewersDocument.NSFSuggestedReviewers;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.s2sgen.impl.generate.FormGenerator;
import org.kuali.coeus.propdev.api.core.ProposalDevelopmentDocumentContract;
import org.kuali.coeus.s2sgen.impl.generate.FormVersion;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;


/**
 * 
 * This class is used to generate XML Document object for grants.gov NSFSuggestedReviewersV1.0. This form is generated using XMLBean
 * API's generated by compiling NSFSuggestedReviewersV1.0 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
@FormGenerator("NSFSuggestedReviewersV1_0Generator")
public class NSFSuggestedReviewersV1_0Generator extends NSFSuggestedReviewersBaseGenerator {
    @Value("http://apply.grants.gov/forms/NSF_SuggestedReviewers-V1.0")
    private String namespace;

    @Value("NSF_SuggestedReviewers-V1.0")
    private String formName;

    @Value("classpath:org/kuali/coeus/s2sgen/impl/generate/support/stylesheet/NSF_SuggestedReviewers-V1.0.fo.xsl")
    private Resource stylesheet;

    @Value("gov.grants.apply.forms.nsfSuggestedReviewersV10")
    private String packageName;

    @Value(DEFAULT_SORT_INDEX)
    private int sortIndex;

    /**
     * 
     * This method returns NSFSuggestedReviewersDocument object based on proposal development document which contains the
     * NSFSuggestedReviewersDocument informations SuggestedReviewers and inclusion of Reviewer for a particular proposal
     * 
     * @return nsfReviewersDocument {@link XmlObject} of type NSFSuggestedReviewersDocument.
     */
    private NSFSuggestedReviewersDocument getNSFSuggestedReviewers() {

        NSFSuggestedReviewersDocument nsfReviewersDocument = NSFSuggestedReviewersDocument.Factory.newInstance();
        NSFSuggestedReviewers nsfSuggestedReviewers = NSFSuggestedReviewers.Factory.newInstance();
        nsfSuggestedReviewers.setFormVersion(FormVersion.v1_0.getVersion());
        String suggestedRev = getAbstractText(SUGGESTED_REVIEWERS);
        if (suggestedRev != null && !suggestedRev.equals("")) {
            nsfSuggestedReviewers.setSuggestedReviewers(suggestedRev);
        }
        String doNotInclude = getAbstractText(REVIEWERS_NOT_TO_INCLUDE);
        if (doNotInclude != null && !doNotInclude.equals("")) {
            nsfSuggestedReviewers.setReviewersNotToInclude(doNotInclude);
        }
        nsfReviewersDocument.setNSFSuggestedReviewers(nsfSuggestedReviewers);
        return nsfReviewersDocument;
    }

    /**
     * This method creates {@link XmlObject} of type {@link NSFSuggestedReviewersDocument} by populating data from the given
     * {@link ProposalDevelopmentDocumentContract}
     * 
     * @param proposalDevelopmentDocument for which the {@link XmlObject} needs to be created
     * @return {@link XmlObject} which is generated using the given {@link ProposalDevelopmentDocumentContract}
     */
    public XmlObject getFormObject(ProposalDevelopmentDocumentContract proposalDevelopmentDocument) {
        this.pdDoc = proposalDevelopmentDocument;
        return getNSFSuggestedReviewers();
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
