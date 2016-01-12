<?xml version="1.0" encoding="UTF-8"?>
<!--
   - Kuali Coeus, a comprehensive research administration system for higher education.
   - 
   - Copyright 2005-2015 Kuali, Inc.
   - 
   - This program is free software: you can redistribute it and/or modify
   - it under the terms of the GNU Affero General Public License as
   - published by the Free Software Foundation, either version 3 of the
   - License, or (at your option) any later version.
   - 
   - This program is distributed in the hope that it will be useful,
   - but WITHOUT ANY WARRANTY; without even the implied warranty of
   - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   - GNU Affero General Public License for more details.
   - 
   - You should have received a copy of the GNU Affero General Public License
   - along with this program.  If not, see <http://www.gnu.org/licenses/>.
 -->
<!-- $Revision: 1583 $ -->
<xsl:stylesheet version="1.0" xmlns:RR_SubawardBudget="http://apply.grants.gov/forms/RR_SubawardBudget-V1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:grant="http://apply.grants.gov/system/MetaGrantApplication" xmlns:RR_FedNonFedBudget10="http://apply.grants.gov/forms/RR_FedNonFedBudget10-V1.1" xmlns:glob="http://apply.grants.gov/system/Global-V1.0" xmlns:att="http://apply.grants.gov/system/Attachments-V1.0" xmlns:globLib="http://apply.grants.gov/system/GlobalLibrary-V2.0" xmlns:footer="http://apply.grants.gov/system/Footer-V1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:header="http://devapply.row.com/system/Header-V1.0">
   <xsl:template match="RR_FedNonFedBudget10:RR_FedNonFedBudget10[name(..)!='RR_SubawardBudget:BudgetAttachments']">
      <fo:root>
         <fo:layout-master-set>
            <fo:simple-page-master master-name="AB" page-height="8.5in" page-width="11in" margin-left="0.3in" margin-right="0.3in">
               <fo:region-body margin-top="0.3in" margin-bottom=".4in"/>
               <fo:region-after extent=".3in"/>
            </fo:simple-page-master>
            <fo:simple-page-master master-name="main" page-height="8.5in" page-width="11in" margin-left="0.4in" margin-right="0.4in">
               <fo:region-body margin-top="0.5in" margin-bottom="0.5in"/>
               <fo:region-after extent=".5in"/>
            </fo:simple-page-master>
            <fo:page-sequence-master master-name="primary">
               <fo:single-page-master-reference master-reference="main"/>
            </fo:page-sequence-master>
            <fo:page-sequence-master master-name="summary">
               <fo:single-page-master-reference master-reference="main"/>
            </fo:page-sequence-master>
         </fo:layout-master-set>
         <!--==========================================================================-->
         <xsl:for-each select="RR_FedNonFedBudget10:BudgetYear">
         <fo:page-sequence master-reference="AB" format="1">
            <fo:static-content flow-name="xsl-region-after">
               <fo:table width="100%"
                  space-before.optimum="0pt"
                  space-after.optimum="0pt"
                  table-layout="fixed">
                  <fo:table-column column-width="proportional-column-width(1)"/>
                  <fo:table-column column-width="proportional-column-width(1)"/>
                  <fo:table-body>
                     <fo:table-row>
                        <fo:table-cell hyphenate="true" language="en"
                         padding-start="0pt"
                         padding-end="0pt"
                         padding-before="1pt"
                         padding-after="1pt"
                         display-align="before"
                         text-align="left"
                         border-style="solid"
                         border-width="0pt"
                         border-color="white">
                           <fo:block>
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell hyphenate="true" language="en" line-height="9pt"
                         padding-start="0pt"
                         padding-end="0pt"
                         padding-before="1pt"
                         padding-after="1pt"
                         display-align="before"
                         text-align="right"
                         border-style="solid"
                         border-width="0pt"
                         border-color="white">
                           <fo:block><fo:inline font-size="6px" font-weight="bold">OMB Number: 4040-0001</fo:inline></fo:block>
                           <fo:block><fo:inline font-size="6px" font-weight="bold">Expiration Date: 06/30/2011</fo:inline></fo:block>
                        </fo:table-cell>
                     </fo:table-row>
                  </fo:table-body>
               </fo:table>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body">
               <xsl:call-template name="SingleYearPart1">
                  <xsl:with-param name="year"><xsl:value-of select="position()"></xsl:value-of></xsl:with-param>
               </xsl:call-template>
            </fo:flow>
         </fo:page-sequence>
         <fo:page-sequence master-reference="primary" format="1">
            <fo:static-content flow-name="xsl-region-after">
               <fo:table width="100%"
                  space-before.optimum="0pt"
                  space-after.optimum="0pt"
                  table-layout="fixed">
                  <fo:table-column column-width="proportional-column-width(1)"/>
                  <fo:table-column column-width="proportional-column-width(1)"/>
                  <fo:table-body>
                     <fo:table-row>
                        <fo:table-cell hyphenate="true" language="en"
                         padding-start="0pt"
                         padding-end="0pt"
                         padding-before="1pt"
                         padding-after="1pt"
                         display-align="before"
                         text-align="left"
                         border-style="solid"
                         border-width="0pt"
                         border-color="white">
                           <fo:block>
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell hyphenate="true" language="en" line-height="9pt"
                         padding-start="0pt"
                         padding-end="0pt"
                         padding-before="1pt"
                         padding-after="1pt"
                         display-align="before"
                         text-align="right"
                         border-style="solid"
                         border-width="0pt"
                         border-color="white">
                           <fo:block><fo:inline font-size="6px" font-weight="bold">OMB Number: 4040-0001</fo:inline></fo:block>
                           <fo:block><fo:inline font-size="6px" font-weight="bold">Expiration Date: 06/30/2011</fo:inline></fo:block>
                        </fo:table-cell>
                     </fo:table-row>
                  </fo:table-body>
               </fo:table>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body">
               <xsl:call-template name="SingleYearPart2">
                  <xsl:with-param name="year"><xsl:value-of select="position()"></xsl:value-of></xsl:with-param>
               </xsl:call-template>
            </fo:flow>
         </fo:page-sequence>
         </xsl:for-each>
         <!-- ====================================== new section SUMMARY ===============================-->
         <fo:page-sequence master-reference="summary" format="1">
            <fo:static-content flow-name="xsl-region-after">
               <fo:table width="100%"
                  space-before.optimum="0pt"
                  space-after.optimum="0pt"
                  table-layout="fixed">
                  <fo:table-column column-width="proportional-column-width(1)"/>
                  <fo:table-column column-width="proportional-column-width(1)"/>
                  <fo:table-body>
                     <fo:table-row>
                        <fo:table-cell hyphenate="true" language="en"
                         padding-start="0pt"
                         padding-end="0pt"
                         padding-before="1pt"
                         padding-after="1pt"
                         display-align="before"
                         text-align="left"
                         border-style="solid"
                         border-width="0pt"
                         border-color="white">
                           <fo:block>
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell hyphenate="true" language="en" line-height="9pt"
                         padding-start="0pt"
                         padding-end="0pt"
                         padding-before="1pt"
                         padding-after="1pt"
                         display-align="before"
                         text-align="right"
                         border-style="solid"
                         border-width="0pt"
                         border-color="white">
                           <fo:block><fo:inline font-size="6px" font-weight="bold">OMB Number: 4040-0001</fo:inline></fo:block>
                           <fo:block><fo:inline font-size="6px" font-weight="bold">Expiration Date: 06/30/20011</fo:inline></fo:block>
                        </fo:table-cell>
                     </fo:table-row>
                  </fo:table-body>
               </fo:table>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body">
               <fo:table width="100%" space-before.optimum="3pt" space-after.optimum="2pt">
                  <fo:table-column/>
                  <fo:table-body>
                     <fo:table-row>
                        <fo:table-cell text-align="center" padding-start="3pt" padding-end="3pt" padding-before="3pt" padding-after="3pt" display-align="before">
                           <fo:block>
                              <fo:inline font-weight="bold" font-size="10pt">RESEARCH &amp; RELATED BUDGET (TOTAL FED + NON-FED) - Cumulative Budget</fo:inline>
                           </fo:block>
                        </fo:table-cell>
                     </fo:table-row>
                  </fo:table-body>
               </fo:table>
               <fo:block>
                  <fo:leader leader-pattern="space"/>
               </fo:block>
               <fo:block>
                  <fo:leader leader-pattern="space"/>
               </fo:block>
               <!-- start here --> 
               <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
					<fo:table-column column-width="proportional-column-width(16)"/>
					<fo:table-column column-width="proportional-column-width(16)"/>
					<fo:table-column column-width="proportional-column-width(16)"/>
					<fo:table-column column-width="proportional-column-width(16)"/>
					<fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
               <fo:table-cell border-before-color="white" text-align="start" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" number-columns-spanned="2" display-align="before">
                                    <fo:block>
                                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">*Total Federal (&#36;)</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Total Non-Federal (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>
				<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Totals (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>              
               </fo:table-row>
               <xsl:for-each select="RR_FedNonFedBudget10:BudgetSummary">
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-weight="bold" font-size="8pt">Section A, Senior/Key Person</fo:inline> 
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedSeniorKeyPerson/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedSeniorKeyPerson/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedSeniorKeyPerson/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-weight="bold" font-size="8pt">Section B, Other Personnel</fo:inline> 
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedOtherPersonnel/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedOtherPersonnel/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedOtherPersonnel/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">Total Number Other Personnel</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" number-columns-spanned="3" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" font-size="8pt" display-align="before">
                        <fo:block>
                           <xsl:value-of select="RR_FedNonFedBudget10:CumulativeTotalNoOtherPersonnel"/>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt" font-weight="bold">Total Salary, Wages and Fringe Benefits (A+B)</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                      <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedPersonnel/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedPersonnel/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedPersonnel/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-weight="bold" font-size="8pt">Section C, Equipment</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedEquipment/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedEquipment/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedEquipment/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-weight="bold" font-size="8pt">Section D, Travel</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedTravel/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedTravel/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedTravel/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">1. Domestic</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeDomesticTravelCosts/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeDomesticTravelCosts/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeDomesticTravelCosts/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">2. Foreign</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeForeignTravelCosts/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeForeignTravelCosts/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeForeignTravelCosts/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-weight="bold" font-size="8pt">Section E, Participant/Trainee Support Costs </fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedTraineeCosts/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedTraineeCosts/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedTraineeCosts/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">1. Tuition/Fees/Health Insurance</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeTuitionFeesHealthInsurance/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeTuitionFeesHealthInsurance/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeTuitionFeesHealthInsurance/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">2. Stipends</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeStipends/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeStipends/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeStipends/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">3. Travel</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeTravel/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeTravel/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeTravel/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">4. Subsistence</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeSubsistence/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeSubsistence/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTraineeSubsistence/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">5. Other</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOtherTraineeCost/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOtherTraineeCost/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOtherTraineeCost/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">6. Number of Participants/Trainees</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" number-columns-spanned="3" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" font-size="8pt" display-align="before">
                        <fo:block>
                           <xsl:value-of select="RR_FedNonFedBudget10:CumulativeNoofTrainees"/> 
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">Section F, Other Direct Costs</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedOtherDirectCosts/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedOtherDirectCosts/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedOtherDirectCosts/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">1. Materials and Supplies</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeMaterialAndSupplies/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeMaterialAndSupplies/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeMaterialAndSupplies/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">2. Publication Costs</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativePublicationCosts/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativePublicationCosts/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativePublicationCosts/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">3. Consultant Services</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeConsultantServices/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeConsultantServices/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeConsultantServices/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">4. ADP/Computer Services</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeADPComputerServices/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeADPComputerServices/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeADPComputerServices/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">5. Subawards/Consortium/Contractual Costs</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeSubawardConsortiumContractualCosts/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeSubawardConsortiumContractualCosts/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeSubawardConsortiumContractualCosts/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">6. Equipment or Facility Rental/User Fees</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeEquipmentFacilityRentalFees/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeEquipmentFacilityRentalFees/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeEquipmentFacilityRentalFees/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">7. Alterations and Renovations</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeAlterationsAndRenovations/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeAlterationsAndRenovations/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeAlterationsAndRenovations/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">8. Other 1</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOther1DirectCost/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOther1DirectCost/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOther1DirectCost/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">9. Other 2</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOther2DirectCost/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOther2DirectCost/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOther2DirectCost/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">10. Other 3</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOther3DirectCost/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOther3DirectCost/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeOther3DirectCost/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">Section G, Direct Costs (A thru F)</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedDirectCosts/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedDirectCosts/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedDirectCosts/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">Section H, Indirect Costs</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedIndirectCost/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedIndirectCost/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedIndirectCost/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold">
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">Section I, Total Direct and Indirect Costs (G + H)</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedDirectIndirectCosts/RR_FedNonFedBudget10:FederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedDirectIndirectCosts/RR_FedNonFedBudget10:NonFederalSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:CumulativeTotalFundsRequestedDirectIndirectCosts/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="2" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">Section J, Fee</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" font-size="8pt" display-align="before">
                        <fo:block>
                           <xsl:value-of select="RR_FedNonFedBudget10:CumulativeFee"/>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                 </xsl:for-each>
                 </fo:table-body>
               </fo:table>
               <!--================== end new section summary ======================= -->
            </fo:flow>
         </fo:page-sequence>
      </fo:root>
   </xsl:template>
   <!--==============   Single Year Template ======================================-->
   <xsl:template name="SingleYearPart1">
      <xsl:param name="year"/>
      <fo:block>
         <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
            <fo:table-column/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="10pt">RESEARCH &amp; RELATED BUDGET  (TOTAL FED + NON-FED) -  BUDGET PERIOD&#160;<xsl:value-of select="$year"/>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
<fo:block font-size="8pt">
   <fo:inline font-weight="bold">* ORGANIZATIONAL DUNS:&#160;&#160;</fo:inline>
   <fo:inline><xsl:value-of select="../RR_FedNonFedBudget10:DUNSID"/></fo:inline>
</fo:block>
         <fo:inline font-size="8pt" font-weight="bold">*&#160;Budget Type:&#160;&#160;&#160;&#160;&#160;&#160; </fo:inline>
         <xsl:for-each select="../RR_FedNonFedBudget10:BudgetType">
            <fo:inline padding-before="-1pt" padding-after="-2pt" color="black">
               <fo:inline font-size="8pt">
                  <xsl:choose>
                     <xsl:when test=".='Project'">
                        <fo:inline font-family="ZapfDingbats" font-size="10pt">&#x25cf;</fo:inline>
                     </xsl:when>
                     <xsl:otherwise>
                        <fo:inline font-family="ZapfDingbats" font-size="10pt">&#x274d;</fo:inline>
                     </xsl:otherwise>
                  </xsl:choose>
               </fo:inline>
            </fo:inline>
         </xsl:for-each>
         <fo:inline font-size="8pt"> Project&#160;&#160;&#160;&#160;&#160;&#160; </fo:inline>

         <xsl:for-each select="../RR_FedNonFedBudget10:BudgetType">
            <fo:inline padding-before="-1pt" padding-after="-2pt" color="black">
               <fo:inline font-size="8pt">
                  <xsl:choose>
                     <xsl:when test=".='Subaward/Consortium'">
                        <fo:inline font-family="ZapfDingbats" font-size="10pt">&#x25cf;</fo:inline>
                     </xsl:when>
                     <xsl:otherwise>
                        <fo:inline font-family="ZapfDingbats" font-size="10pt">&#x274d;</fo:inline>
                     </xsl:otherwise>
                  </xsl:choose>
               </fo:inline>
            </fo:inline>
         </xsl:for-each>
         <fo:inline font-size="8pt"> Subaward/Consortium</fo:inline>
         <fo:block>
                        
                     </fo:block>
         <fo:inline font-size="8pt" hyphenate="true" language="en" font-weight="bold">Enter name of Organization: </fo:inline>
         <fo:inline font-size="8pt">
            <xsl:value-of select="../RR_FedNonFedBudget10:OrganizationName"/>
         </fo:inline>
         <fo:block>
                        
                     </fo:block>
         <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
            <fo:table-column/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">*&#160;Start Date:&#160;</fo:inline>
                        <fo:inline font-size="8pt">
                           <xsl:call-template name="formatDate">
                              <xsl:with-param name="value" select="RR_FedNonFedBudget10:BudgetPeriodStartDate"/>
                           </xsl:call-template>
                        </fo:inline>
                        <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; *&#160;End Date:&#160;</fo:inline>
                        <fo:inline font-size="8pt">
                           <xsl:call-template name="formatDate">
                              <xsl:with-param name="value" select="RR_FedNonFedBudget10:BudgetPeriodEndDate"/>
                           </xsl:call-template>
                        </fo:inline>
                        <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; Budget Period:&#160;<xsl:value-of select="$year"/>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <xsl:for-each select="RR_FedNonFedBudget10:KeyPersons">
            <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
               <fo:table-column/>
               <fo:table-body>
                  <fo:table-row>
                     <fo:table-cell border-style="solid" border-color="black" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <fo:inline font-size="8pt" font-weight="bold">A. Senior/Key Person</fo:inline>
                           <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt" table-layout="fixed">
                              <fo:table-column column-width="proportional-column-width(2)"/>
										<fo:table-column column-width="proportional-column-width(4)"/>
										<fo:table-column column-width="proportional-column-width(10)"/>
										<fo:table-column column-width="proportional-column-width(10)"/>
										<fo:table-column column-width="proportional-column-width(18)"/>
										<fo:table-column column-width="proportional-column-width(4)"/>
										<fo:table-column column-width="proportional-column-width(14)"/>
										<fo:table-column column-width="proportional-column-width(10)"/>
										<fo:table-column column-width="proportional-column-width(6)"/>
										<fo:table-column column-width="proportional-column-width(6)"/>
										<fo:table-column column-width="proportional-column-width(6)"/>
										<fo:table-column column-width="proportional-column-width(8)"/>
										<fo:table-column column-width="proportional-column-width(8)"/>
										<fo:table-column column-width="proportional-column-width(9)"/>
										<fo:table-column column-width="proportional-column-width(9)"/>
										<fo:table-column column-width="proportional-column-width(12)"/>
                             <fo:table-body>
											<fo:table-row>
												<fo:table-cell number-columns-spanned="2" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">Prefix</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">* First Name</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">Middle Name</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">* Last Name</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">Suffix</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">* Project Role</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">Base Salary (&#36;)</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">Cal. Months</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">Acad. Months</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">Sum. Months</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">* Req. Salary&#160;(&#36;)</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">* Fringe Ben. (&#36;)</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">* Total(Sal &amp; FB)(Fed + Non-Fed) (&#36;)</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-weight="bold" font-size="8pt">* Non-Federal (&#36;)</fo:inline>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</fo:table-body>
									</fo:table>
                           <xsl:for-each select="RR_FedNonFedBudget10:KeyPerson">
                              <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt" table-layout="fixed">
                                 <fo:table-column column-width="proportional-column-width(2)"/>
											<fo:table-column column-width="proportional-column-width(4)"/>
											<fo:table-column column-width="proportional-column-width(10)"/>
											<fo:table-column column-width="proportional-column-width(10)"/>
											<fo:table-column column-width="proportional-column-width(18)"/>
											<fo:table-column column-width="proportional-column-width(4)"/>
											<fo:table-column column-width="proportional-column-width(14)"/>
											<fo:table-column column-width="proportional-column-width(10)"/>
											<fo:table-column column-width="proportional-column-width(6)"/>
											<fo:table-column column-width="proportional-column-width(6)"/>
											<fo:table-column column-width="proportional-column-width(6)"/>
											<fo:table-column column-width="proportional-column-width(8)"/>
											<fo:table-column column-width="proportional-column-width(8)"/>
											<fo:table-column column-width="proportional-column-width(9)"/>
											<fo:table-column column-width="proportional-column-width(9)"/>
											<fo:table-column column-width="proportional-column-width(12)"/>
                                 <fo:table-body>
                                    <fo:table-row>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<fo:inline font-size="8pt">
																<xsl:value-of select="position()"/>.&#160;</fo:inline>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Name">
																<xsl:for-each select="globLib:PrefixName">
																	<fo:inline font-size="8pt">
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Name">
																<xsl:for-each select="globLib:FirstName">
																	<fo:inline font-size="8pt">
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Name">
																<xsl:for-each select="globLib:MiddleName">
																	<fo:inline font-size="8pt">
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Name">
																<xsl:for-each select="globLib:LastName">
																	<fo:inline font-size="8pt">
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Name">
																<xsl:for-each select="globLib:SuffixName">
																	<fo:inline font-size="8pt">
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:ProjectRole">
																<fo:inline font-size="8pt">
																	<xsl:apply-templates/>
																</fo:inline>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:BaseSalary">
																	<fo:inline font-size="8pt">
																		<xsl:value-of select="format-number(., '#,##0.00')"/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:CalendarMonths">
																	<fo:inline font-size="8pt">
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:AcademicMonths">
																	<fo:inline font-size="8pt">
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:SummerMonths">
																	<fo:inline font-size="8pt">
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:RequestedSalary">
																	<fo:inline font-size="8pt">
																		<xsl:value-of select="format-number(., '#,##0.00')"/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:FringeBenefits">
																	<fo:inline font-size="8pt">
																		<xsl:value-of select="format-number(., '#,##0.00')"/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:Total/RR_FedNonFedBudget10:TotalFedNonFed">
																	<fo:inline font-size="8pt">
																		<xsl:value-of select="format-number(., '#,##0.00')"/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:Total/RR_FedNonFedBudget10:Federal">
																	<fo:inline font-size="8pt">
																		<xsl:value-of select="format-number(., '#,##0.00')"/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
														<fo:block>
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:Total/RR_FedNonFedBudget10:NonFederal">
																	<fo:inline font-size="8pt">
																		<xsl:value-of select="format-number(., '#,##0.00')"/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</fo:block>
													</fo:table-cell>
                                    </fo:table-row>
                                 </fo:table-body>
                              </fo:table>
                           </xsl:for-each>
                           <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt" table-layout="fixed">
                              <fo:table-column column-width="proportional-column-width(2)"/>
										<fo:table-column column-width="proportional-column-width(4)"/>
										<fo:table-column column-width="proportional-column-width(10)"/>
										<fo:table-column column-width="proportional-column-width(10)"/>
										<fo:table-column column-width="proportional-column-width(18)"/>
										<fo:table-column column-width="proportional-column-width(4)"/>
										<fo:table-column column-width="proportional-column-width(14)"/>
										<fo:table-column column-width="proportional-column-width(10)"/>
										<fo:table-column column-width="proportional-column-width(6)"/>
										<fo:table-column column-width="proportional-column-width(6)"/>
										<fo:table-column column-width="proportional-column-width(6)"/>
										<fo:table-column column-width="proportional-column-width(8)"/>
										<fo:table-column column-width="proportional-column-width(8)"/>
										<fo:table-column column-width="proportional-column-width(9)"/>
										<fo:table-column column-width="proportional-column-width(9)"/>
										<fo:table-column column-width="proportional-column-width(12)"/>
                              <fo:table-body>
                             
                               <fo:table-row>
                                   <fo:table-cell number-columns-spanned="4" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-size="8pt" font-weight="bold">Additional Senior Key Persons:</fo:inline>
													</fo:block>
								   </fo:table-cell>
								   
                                    <fo:table-cell number-columns-spanned="6" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt">File Name: </fo:inline>
                                          <xsl:for-each select="RR_FedNonFedBudget10:AttachedKeyPersons">
                                             <xsl:for-each select="att:FileName">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                  
                                  <fo:table-cell number-columns-spanned="6" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-size="8pt">Mime Type: </fo:inline>
														<xsl:for-each select="RR_FedNonFedBudget10:AttachedKeyPersons">
															<xsl:for-each select="att:MimeType">
																<fo:inline font-size="8pt">
																	<xsl:apply-templates/>
																</fo:inline>
															</xsl:for-each>
														</xsl:for-each>
													</fo:block>
                                    </fo:table-cell>
                               </fo:table-row>
                            
                                 <fo:table-row>
                                    <fo:table-cell number-columns-spanned="13" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<fo:inline font-size="8pt" font-weight="bold">Total Funds Requested for all Senior Key Persons in the attached file </fo:inline>
													</fo:block>
									</fo:table-cell>
									
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<xsl:for-each select="RR_FedNonFedBudget10:TotalFundForAttachedKeyPersons/RR_FedNonFedBudget10:TotalFedNonFedSummary">
															<fo:inline font-size="8pt">
																<xsl:value-of select="format-number(., '#,##0.00')"/>
															</fo:inline>
														</xsl:for-each>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<xsl:for-each select="RR_FedNonFedBudget10:TotalFundForAttachedKeyPersons/RR_FedNonFedBudget10:FederalSummary">
															<fo:inline font-size="8pt">
																<xsl:value-of select="format-number(., '#,##0.00')"/>
															</fo:inline>
														</xsl:for-each>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<xsl:for-each select="RR_FedNonFedBudget10:TotalFundForAttachedKeyPersons/RR_FedNonFedBudget10:NonFederalSummary">
															<fo:inline font-size="8pt">
																<xsl:value-of select="format-number(., '#,##0.00')"/>
															</fo:inline>
														</xsl:for-each>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
									<fo:table-row>
                                    <fo:table-cell number-columns-spanned="13" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt" font-weight="bold">Total Senior/Key Person</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<xsl:for-each select="RR_FedNonFedBudget10:TotalFundForKeyPersons/RR_FedNonFedBudget10:TotalFedNonFedSummary">
															<fo:inline font-size="8pt" font-weight="bold">
																<xsl:value-of select="format-number(., '#,##0.00')"/>
															</fo:inline>
														</xsl:for-each>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<xsl:for-each select="RR_FedNonFedBudget10:TotalFundForKeyPersons/RR_FedNonFedBudget10:FederalSummary">
															<fo:inline font-size="8pt" font-weight="bold">
																<xsl:value-of select="format-number(., '#,##0.00')"/>
															</fo:inline>
														</xsl:for-each>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
													<fo:block>
														<xsl:for-each select="RR_FedNonFedBudget10:TotalFundForKeyPersons/RR_FedNonFedBudget10:NonFederalSummary">
															<fo:inline font-size="8pt" font-weight="bold">
																<xsl:value-of select="format-number(., '#,##0.00')"/>
															</fo:inline>
														</xsl:for-each>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</fo:table-body>
									</fo:table>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>                                    
            </fo:table>
         </xsl:for-each>
         <fo:block>
            <fo:leader leader-pattern="space"/>
         </fo:block>
         <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
            <fo:table-column/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell border-style="solid" border-color="black" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">B. Other Personnel</fo:inline>
                        <fo:block>
                           <xsl:text>&#xA;</xsl:text>
                        </fo:block>
                        <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt" table-layout="fixed">
                           <fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(60)"/>
											<fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
											<fo:table-column column-width="proportional-column-width(15)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
                           <fo:table-body>
                              <fo:table-row>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Number of Personnel</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="left" width="150pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Project Role</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">Cal. Months</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">Acad. Months</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">Sum. Months</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Req. Salary (&#36;)</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Fringe Ben.</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">*Total(Sal &amp; FB)(Fed + Non-Fed) (&#36;)</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Non-Federal (&#36;)</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <xsl:for-each select="RR_FedNonFedBudget10:OtherPersonnel">
                                 <fo:table-row>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
   
                                          <xsl:for-each select="RR_FedNonFedBudget10:PostDocAssociates">
                                             <xsl:for-each select="RR_FedNonFedBudget10:NumberOfPersonnel">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="left" width="150pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt">Post Doctoral Associates</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                       <xsl:for-each select="RR_FedNonFedBudget10:PostDocAssociates">
															<xsl:for-each select="RR_FedNonFedBudget10:Compensation">
																<xsl:for-each select="RR_FedNonFedBudget10:CalendarMonths">
																	<fo:inline font-size="8pt">
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</xsl:for-each>
														</xsl:for-each>   
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:PostDocAssociates">
                                          <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:PostDocAssociates">
                                          <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:PostDocAssociates">
											  <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:PostDocAssociates">
                                           <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                              </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:PostDocAssociates">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:TotalFedNonFed">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:PostDocAssociates">
                                          
                                          <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                          <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Federal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                                </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:PostDocAssociates">                                          
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:NonFederal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                              </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                                 <fo:table-row>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:GraduateStudents">
                                             <xsl:for-each select="RR_FedNonFedBudget10:NumberOfPersonnel">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="left" width="150pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt">Graduate Students</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:GraduateStudents">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                              </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:GraduateStudents">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                              </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:GraduateStudents">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                              </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:GraduateStudents">
                                             <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                              </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:GraduateStudents">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                              </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:GraduateStudents">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:TotalFedNonFed">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                   <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:GraduateStudents">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:Federal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                   <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:GraduateStudents">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:NonFederal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                                 <fo:table-row>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:UndergraduateStudents">
                                             <xsl:for-each select="RR_FedNonFedBudget10:NumberOfPersonnel">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="left" width="150pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt">Undergraduate Students</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:UndergraduateStudents">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:UndergraduateStudents">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:UndergraduateStudents">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:UndergraduateStudents">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:UndergraduateStudents">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:UndergraduateStudents">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:TotalFedNonFed">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:UndergraduateStudents">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:Federal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:UndergraduateStudents">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:NonFederal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                                 <fo:table-row>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:SecretarialClerical">
                                             <xsl:for-each select="RR_FedNonFedBudget10:NumberOfPersonnel">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="left" width="150pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt">Secretarial/Clerical</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:SecretarialClerical">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:SecretarialClerical">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:SecretarialClerical">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:SecretarialClerical">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:SecretarialClerical">
                                            <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:SecretarialClerical">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:TotalFedNonFed">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:SecretarialClerical">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:Federal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_FedNonFedBudget10:SecretarialClerical">
                                                <xsl:for-each select="RR_FedNonFedBudget10:Compensation">
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:NonFederal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                   </xsl:for-each>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                              </xsl:for-each>
                           </fo:table-body>
                        </fo:table>
                        <xsl:for-each select="RR_FedNonFedBudget10:OtherPersonnel">
                           <xsl:for-each select="RR_FedNonFedBudget10:Other">
                              <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt" table-layout="fixed">
                                 <fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(60)"/>
											<fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
											<fo:table-column column-width="proportional-column-width(15)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
                                 <fo:table-body>
                                    <fo:table-row>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_FedNonFedBudget10:NumberOfPersonnel">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="left" width="150pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_FedNonFedBudget10:ProjectRole">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_FedNonFedBudget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_FedNonFedBudget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_FedNonFedBudget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_FedNonFedBudget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_FedNonFedBudget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:TotalFedNonFed">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                      <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:Federal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                      <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_FedNonFedBudget10:OtherTotal/RR_FedNonFedBudget10:NonFederal">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                    </fo:table-row>
                                 </fo:table-body>
                              </fo:table>
                           </xsl:for-each>
                        </xsl:for-each>
                        <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt" table-layout="fixed">
                           <fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(60)"/>
											<fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(5)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
											<fo:table-column column-width="proportional-column-width(15)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
											<fo:table-column column-width="proportional-column-width(11)"/>
                           <fo:table-body>
                              <fo:table-row>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_FedNonFedBudget10:OtherPersonnel">
                                          <xsl:for-each select="RR_FedNonFedBudget10:OtherPersonnelTotalNumber">
                                             <fo:inline font-size="8pt" font-weight="bold">
                                                <xsl:apply-templates/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="left" width="150pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="bold">Total Number Other Personnel</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell number-columns-spanned="5" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="bold">Total Other Personnel</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell hyphenate="true" language="en" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_FedNonFedBudget10:OtherPersonnel">
                                          <xsl:if test="RR_FedNonFedBudget10:TotalOtherPersonnelFund/RR_FedNonFedBudget10:TotalFedNonFedSummary!=''">
                                             <xsl:for-each select="RR_FedNonFedBudget10:TotalOtherPersonnelFund/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                                                <fo:inline font-size="8pt" font-weight="bold">
                                                   <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </xsl:if>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>

											<fo:table-cell hyphenate="true" language="en"  text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<xsl:for-each select="RR_FedNonFedBudget10:OtherPersonnel">
														<xsl:if test="RR_FedNonFedBudget10:TotalOtherPersonnelFund/RR_FedNonFedBudget10:FederalSummary!=''">
															<xsl:for-each select="RR_FedNonFedBudget10:TotalOtherPersonnelFund/RR_FedNonFedBudget10:FederalSummary">
																<fo:inline font-size="8pt" font-weight="bold">
																	<xsl:value-of select="format-number(., '#,##0.00')"/>
																</fo:inline>
															</xsl:for-each>
														</xsl:if>
													</xsl:for-each>
												</fo:block>
											</fo:table-cell>

											<fo:table-cell  hyphenate="true" language="en" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<xsl:for-each select="RR_FedNonFedBudget10:OtherPersonnel">
														<xsl:if test="RR_FedNonFedBudget10:TotalOtherPersonnelFund/RR_FedNonFedBudget10:NonFederalSummary!=''">
															<xsl:for-each select="RR_FedNonFedBudget10:TotalOtherPersonnelFund/RR_FedNonFedBudget10:NonFederalSummary">
																<fo:inline font-size="8pt" font-weight="bold">
																	<xsl:value-of select="format-number(., '#,##0.00')"/>
																</fo:inline>
															</xsl:for-each>
														</xsl:if>
													</xsl:for-each>
												</fo:block>
											</fo:table-cell>

                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell number-columns-spanned="7" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="bold">Total Salary, Wages and Fringe Benefits (A+B)</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right" hyphenate="true" language="en" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<xsl:for-each select="RR_FedNonFedBudget10:TotalCompensation/RR_FedNonFedBudget10:TotalFedNonFedSummary">
														<fo:inline font-size="8pt" font-weight="bold">
															<xsl:value-of select="format-number(., '#,##0.00')"/>
														</fo:inline>
													</xsl:for-each>
												</fo:block>
								 </fo:table-cell>
								 <fo:table-cell text-align="right" hyphenate="true" language="en" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<xsl:for-each select="RR_FedNonFedBudget10:TotalCompensation/RR_FedNonFedBudget10:FederalSummary">
														<fo:inline font-size="8pt" font-weight="bold">
															<xsl:value-of select="format-number(., '#,##0.00')"/>
														</fo:inline>
													</xsl:for-each>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell text-align="right" hyphenate="true" language="en" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<xsl:for-each select="RR_FedNonFedBudget10:TotalCompensation/RR_FedNonFedBudget10:NonFederalSummary">
														<fo:inline font-size="8pt" font-weight="bold">
															<xsl:value-of select="format-number(., '#,##0.00')"/>
														</fo:inline>
													</xsl:for-each>
												</fo:block>
											</fo:table-cell>
                              </fo:table-row>
                           </fo:table-body>
                        </fo:table>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:block>
   </xsl:template>
   <xsl:template name="SingleYearPart2">
      <xsl:param name="year"/>
      <fo:block>
         <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell hyphenate="true" language="en" border-style="solid" border-color="black" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">C. Equipment Description</fo:inline>
                        <fo:block>
                                          
                                       </fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">List items and dollar amount for each item exceeding $5,000</fo:inline>
                        <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
									<fo:table-column column-width="proportional-column-width(52)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
                           <fo:table-header>
                              <fo:table-row>								  
                                 <fo:table-cell border-before-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" number-columns-spanned="3" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">*Equipment Item</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Non-Federal (&#36;)</fo:inline>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Total (Fed + Non-Fed) (&#36;)</fo:inline>
												</fo:block>
											</fo:table-cell>
                              </fo:table-row>
                           </fo:table-header>
                           <fo:table-body>
                               <fo:table-row>                               
                                 <fo:table-cell>
                                       <fo:block></fo:block>
                                   </fo:table-cell> 
                               </fo:table-row>
                              <xsl:for-each select="RR_FedNonFedBudget10:Equipment">
                                 <xsl:for-each select="RR_FedNonFedBudget10:EquipmentList">
                                    <fo:table-row>                                   
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="left">
                                          <fo:block>
                                            <fo:inline font-size="8pt">
                                                <xsl:value-of select="position()"/>. &#160;</fo:inline> 
                                             <xsl:for-each select="RR_FedNonFedBudget10:EquipmentItem">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                                          <fo:block>
                                             <xsl:for-each select="RR_FedNonFedBudget10:FundsRequested/RR_FedNonFedBudget10:Federal">
                                                <fo:inline font-size="8pt">
                                                   <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>                                       
											<fo:table-cell hyphenate="true" language="en" line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
												<fo:block>
													<xsl:for-each select="RR_FedNonFedBudget10:FundsRequested/RR_FedNonFedBudget10:NonFederal">
														<fo:inline font-size="8pt">
															<xsl:value-of select="format-number(., '#,##0.00')"/>
														</fo:inline>
													</xsl:for-each>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell hyphenate="true" language="en" line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
												<fo:block>
													<xsl:for-each select="RR_FedNonFedBudget10:FundsRequested/RR_FedNonFedBudget10:TotalFedNonFed">
														<fo:inline font-size="8pt">
															<xsl:value-of select="format-number(., '#,##0.00')"/>
														</fo:inline>
													</xsl:for-each>
												</fo:block>
											</fo:table-cell>
                                    </fo:table-row>
                                 </xsl:for-each>
                              </xsl:for-each>
                           </fo:table-body>
                        </fo:table>
                        <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
									<fo:table-column column-width="proportional-column-width(53)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
                           <fo:table-header>
                              <fo:table-row>
                                 <fo:table-cell text-align="right" number-columns-spanned="3" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="bold">Total funds requested for all equipment listed in the attached file</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_FedNonFedBudget10:Equipment">
                                          <xsl:for-each select="RR_FedNonFedBudget10:TotalFundForAttachedEquipment/RR_FedNonFedBudget10:Federal">
                                             <fo:inline font-size="8pt" font-weight="bold">
                                                <xsl:value-of select="format-number(., '#,##0.00')"/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_FedNonFedBudget10:Equipment">
                                          <xsl:for-each select="RR_FedNonFedBudget10:TotalFundForAttachedEquipment/RR_FedNonFedBudget10:NonFederal">
                                             <fo:inline font-size="8pt" font-weight="bold">
                                                <xsl:value-of select="format-number(., '#,##0.00')"/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_FedNonFedBudget10:Equipment">
                                          <xsl:for-each select="RR_FedNonFedBudget10:TotalFundForAttachedEquipment/RR_FedNonFedBudget10:TotalFedNonFed">
                                             <fo:inline font-size="8pt" font-weight="bold">
                                                <xsl:value-of select="format-number(., '#,##0.00')"/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                           </fo:table-header>
                           <fo:table-body>
                              <fo:table-row>
                                 <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before"  number-columns-spanned="3" text-align="right">
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="bold">Total Equipment</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_FedNonFedBudget10:Equipment">
                                          <xsl:for-each select="RR_FedNonFedBudget10:TotalFund/RR_FedNonFedBudget10:FederalSummary">
                                             <fo:inline font-size="8pt" font-weight="bold">
                                                <xsl:value-of select="format-number(., '#,##0.00')"/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_FedNonFedBudget10:Equipment">
                                          <xsl:for-each select="RR_FedNonFedBudget10:TotalFund/RR_FedNonFedBudget10:NonFederalSummary">
                                             <fo:inline font-size="8pt" font-weight="bold">
                                                <xsl:value-of select="format-number(., '#,##0.00')"/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_FedNonFedBudget10:Equipment">
                                          <xsl:for-each select="RR_FedNonFedBudget10:TotalFund/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                                             <fo:inline font-size="8pt" font-weight="bold">
                                                <xsl:value-of select="format-number(., '#,##0.00')"/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                           </fo:table-body>
                        </fo:table>
                        <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
                           <fo:table-column/>
                           <fo:table-column/>
                           <fo:table-column/>
                           <fo:table-body>
                              <fo:table-row>
                                 <fo:table-cell text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="bold">Additional Equipment: </fo:inline>
                                    </fo:block>
                                 </fo:table-cell>                             
                               </fo:table-row>
                               <fo:table-row>
                                 <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start"  number-columns-spanned="2">
                                    <fo:block>
                                       <fo:inline font-size="8pt">&#160;&#160;&#160;&#160;&#160;&#160;File Name: </fo:inline>
                                       <xsl:for-each select="RR_FedNonFedBudget10:Equipment/RR_FedNonFedBudget10:AdditionalEquipmentsAttachment">
                                          <xsl:for-each select="att:FileName">
                                             <fo:inline font-size="8pt">
                                                <xsl:apply-templates/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                                    <fo:block>
                                       <fo:inline font-size="8pt">Mime Type: </fo:inline>
                                       <xsl:for-each select="RR_FedNonFedBudget10:Equipment/RR_FedNonFedBudget10:AdditionalEquipmentsAttachment">
                                          <xsl:for-each select="att:MimeType">
                                             <fo:inline font-size="8pt">
                                                <xsl:apply-templates/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                           </fo:table-body>
                        </fo:table>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block>
            <fo:leader leader-pattern="space"/>
         </fo:block>
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
				<fo:table-column column-width="proportional-column-width(53)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
                <fo:table-cell border-before-color="white" text-align="start" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" number-columns-spanned="3" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">D. Travel</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Non-Federal (&#36;)</fo:inline>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Total (Fed + Non-Fed) (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3"  text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt">1. Domestic Travel Costs ( Incl. Canada, Mexico, and U.S. Possessions)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Travel/RR_FedNonFedBudget10:DomesticTravelCost/RR_FedNonFedBudget10:Federal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Travel/RR_FedNonFedBudget10:DomesticTravelCost/RR_FedNonFedBudget10:NonFederal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Travel/RR_FedNonFedBudget10:DomesticTravelCost/RR_FedNonFedBudget10:TotalFedNonFed">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3"  text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt">2. Foreign Travel Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Travel/RR_FedNonFedBudget10:ForeignTravelCost/RR_FedNonFedBudget10:Federal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Travel/RR_FedNonFedBudget10:ForeignTravelCost/RR_FedNonFedBudget10:NonFederal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Travel/RR_FedNonFedBudget10:ForeignTravelCost/RR_FedNonFedBudget10:TotalFedNonFed">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell text-align="right"  number-columns-spanned="3" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Total Travel Cost</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Travel/RR_FedNonFedBudget10:TotalTravelCost/RR_FedNonFedBudget10:FederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Travel/RR_FedNonFedBudget10:TotalTravelCost/RR_FedNonFedBudget10:NonFederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Travel/RR_FedNonFedBudget10:TotalTravelCost/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block>
            <fo:leader leader-pattern="space"/>
         </fo:block>
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
         <fo:table-column column-width="proportional-column-width(53)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
				<fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
                <fo:table-cell border-before-color="white" text-align="start" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" number-columns-spanned="3" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">E. Participant/Trainee Support Costs</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Non-Federal (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>
				<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Total (Fed + Non-Fed) (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="3">
                     <fo:block>
                        <fo:inline font-size="8pt">1. Tuition/Fees/Health Insurance</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:TuitionFeeHealthInsurance/RR_FedNonFedBudget10:Federal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:TuitionFeeHealthInsurance/RR_FedNonFedBudget10:NonFederal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:TuitionFeeHealthInsurance/RR_FedNonFedBudget10:TotalFedNonFed">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="3">
                     <fo:block>
                        <fo:inline font-size="8pt">2. Stipends</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Stipends/RR_FedNonFedBudget10:Federal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Stipends/RR_FedNonFedBudget10:NonFederal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Stipends/RR_FedNonFedBudget10:TotalFedNonFed">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="3">
                     <fo:block>
                        <fo:inline font-size="8pt">3. Travel</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:ParticipantTravel/RR_FedNonFedBudget10:Federal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:ParticipantTravel/RR_FedNonFedBudget10:NonFederal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:ParticipantTravel/RR_FedNonFedBudget10:TotalFedNonFed">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="3">
                     <fo:block>
                        <fo:inline font-size="8pt">4. Subsistence</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Subsistence/RR_FedNonFedBudget10:Federal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Subsistence/RR_FedNonFedBudget10:NonFederal">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Subsistence/RR_FedNonFedBudget10:TotalFedNonFed">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="3">
                     <fo:block hyphenate="true">
                        <fo:inline font-size="8pt">5. Other:&#160;&#160; </fo:inline>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Other">
                           <xsl:for-each select="RR_FedNonFedBudget10:Description">
                              <fo:inline font-size="8pt">
                                 <xsl:apply-templates/>
                              </fo:inline>
                           </xsl:for-each>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Other">
                           <xsl:for-each select="RR_FedNonFedBudget10:Cost/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Other">
                           <xsl:for-each select="RR_FedNonFedBudget10:Cost/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:Other">
                           <xsl:for-each select="RR_FedNonFedBudget10:Cost/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="right">
                     <fo:block> 
                          <fo:inline font-size="8pt" font-weight="bold">Total Participant/Trainee Support Costs</fo:inline>           
                     </fo:block>
                  </fo:table-cell>
                  
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:TotalCost/RR_FedNonFedBudget10:FederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                   <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:TotalCost/RR_FedNonFedBudget10:NonFederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                   <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:TotalCost/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
                <fo:table-row>
                  <fo:table-cell padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:ParticipantTraineeSupportCosts/RR_FedNonFedBudget10:ParticipantTraineeNumber">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:apply-templates/>
                           </fo:inline>
                        </xsl:for-each>
                            <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;Number of Participants/Trainees</fo:inline>       
                     </fo:block>
                  </fo:table-cell>
                 </fo:table-row>        
            </fo:table-body>
         </fo:table>
         <fo:block break-after="page">
            <xsl:text>&#xA;</xsl:text>
         </fo:block>
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
            <fo:table-column column-width="proportional-column-width(52)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
               <fo:table-cell border-before-color="white" text-align="start" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" number-columns-spanned="3" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">F. Other Direct Costs</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Non-Federal (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>
				<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Total (Fed + Non-Fed) (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>              
               </fo:table-row>
               <xsl:for-each select="RR_FedNonFedBudget10:OtherDirectCosts">
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">1. Materials and Supplies</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:MaterialsSupplies/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:MaterialsSupplies/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:MaterialsSupplies/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">2. Publication Costs</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:PublicationCosts/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:PublicationCosts/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:PublicationCosts/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">3. Consultant Services</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:ConsultantServices/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                      
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:ConsultantServices/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:ConsultantServices/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">4. ADP/Computer Services</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:ADPComputerServices/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:ADPComputerServices/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:ADPComputerServices/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">5. Subawards/Consortium/Contractual Costs</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:SubawardConsortiumContractualCosts/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                     
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:SubawardConsortiumContractualCosts/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:SubawardConsortiumContractualCosts/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">6. Equipment or Facility Rental/User Fees</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:EquipmentRentalFee/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:EquipmentRentalFee/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:EquipmentRentalFee/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">7. Alterations and Renovations</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:AlterationsRenovations/RR_FedNonFedBudget10:Federal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>                   
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:AlterationsRenovations/RR_FedNonFedBudget10:NonFederal">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_FedNonFedBudget10:AlterationsRenovations/RR_FedNonFedBudget10:TotalFedNonFed">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row> -->
                     <xsl:for-each select="RR_FedNonFedBudget10:Others">
                       <xsl:for-each select="RR_FedNonFedBudget10:Other">
                        <fo:table-row>
                           <fo:table-cell hyphenate="true" language="en" line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                              <fo:block>
                                 <fo:inline font-size="8pt">
                                    <xsl:value-of select="position()+7"/>.&#160;</fo:inline>
                                 <xsl:for-each select="RR_FedNonFedBudget10:Description">
                                    <fo:inline font-size="8pt">
                                       <xsl:apply-templates/>
                                    </fo:inline>
                                 </xsl:for-each>
                              </fo:block>
                           </fo:table-cell>
                           <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                              <fo:block>
                                 <xsl:for-each select="RR_FedNonFedBudget10:Cost/RR_FedNonFedBudget10:Federal">
                                    <fo:inline font-size="8pt">
                                       <xsl:value-of select="format-number(., '#,##0.00')"/>
                                    </fo:inline>
                                 </xsl:for-each>
                              </fo:block>
                           </fo:table-cell>
                           <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                              <fo:block>
                                 <xsl:for-each select="RR_FedNonFedBudget10:Cost/RR_FedNonFedBudget10:NonFederal">
                                    <fo:inline font-size="8pt">
                                       <xsl:value-of select="format-number(., '#,##0.00')"/>
                                    </fo:inline>
                                 </xsl:for-each>
                              </fo:block>
                           </fo:table-cell>
                           <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                              <fo:block>
                                 <xsl:for-each select="RR_FedNonFedBudget10:Cost/RR_FedNonFedBudget10:TotalFedNonFed">
                                    <fo:inline font-size="8pt">
                                       <xsl:value-of select="format-number(., '#,##0.00')"/>
                                    </fo:inline>
                                 </xsl:for-each>
                              </fo:block>
                           </fo:table-cell>
                        </fo:table-row>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:for-each>
               <fo:table-row>
                  <fo:table-cell text-align="right" number-columns-spanned="3"  padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Total Other Direct Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:OtherDirectCosts/RR_FedNonFedBudget10:TotalOtherDirectCost/RR_FedNonFedBudget10:FederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                   <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:OtherDirectCosts/RR_FedNonFedBudget10:TotalOtherDirectCost/RR_FedNonFedBudget10:NonFederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                   <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:OtherDirectCosts/RR_FedNonFedBudget10:TotalOtherDirectCost/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block>
            <fo:leader leader-pattern="space"/>
         </fo:block>
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
            <fo:table-column column-width="proportional-column-width(52)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
               <fo:table-cell border-before-color="white" text-align="start" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" number-columns-spanned="3" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">G. Direct Costs</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Non-Federal (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>
				<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Total (Fed + Non-Fed) (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>              
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell text-align="right" number-columns-spanned="3" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Total Direct Costs (A thru F)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:DirectCosts/RR_FedNonFedBudget10:FederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:DirectCosts/RR_FedNonFedBudget10:NonFederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:DirectCosts/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block>
            <fo:leader leader-pattern="space"/>
         </fo:block>
        <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
            <fo:table-column column-width="proportional-column-width(52)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-header>
               <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">H. Indirect Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="left">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Indirect Cost Type</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Indirect Cost Rate (%)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="center">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Indirect Cost Base ($)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                   <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Non-Federal (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>
				<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Total (Fed + Non-Fed) (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>    
               </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
               <xsl:for-each select="RR_FedNonFedBudget10:IndirectCosts">
                  <xsl:for-each select="RR_FedNonFedBudget10:IndirectCost">
                     <fo:table-row>
                        <fo:table-cell hyphenate="true" language="en" line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                           <fo:block>
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="position()"/>.&#160;</fo:inline>
                              <xsl:for-each select="RR_FedNonFedBudget10:CostType">
                                 <fo:inline font-size="8pt">
                                    <xsl:apply-templates/>
                                 </fo:inline>
                              </xsl:for-each>
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                           <fo:block>
                              <xsl:for-each select="RR_FedNonFedBudget10:Rate">
                                 <fo:inline font-size="8pt">
                                    <xsl:apply-templates/>
                                 </fo:inline>
                              </xsl:for-each>
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                           <fo:block>
                              <xsl:for-each select="RR_FedNonFedBudget10:Base">
                                 <fo:inline font-size="8pt">
                                    <xsl:value-of select="format-number(., '#,##0.00')"/>
                                 </fo:inline>
                              </xsl:for-each>
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                           <fo:block>
                              <xsl:for-each select="RR_FedNonFedBudget10:FundRequested/RR_FedNonFedBudget10:Federal">
                                 <fo:inline font-size="8pt">
                                    <xsl:value-of select="format-number(., '#,##0.00')"/>
                                 </fo:inline>
                              </xsl:for-each>
                           </fo:block>
                        </fo:table-cell>
                         <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                           <fo:block>
                              <xsl:for-each select="RR_FedNonFedBudget10:FundRequested/RR_FedNonFedBudget10:NonFederal">
                                 <fo:inline font-size="8pt">
                                    <xsl:value-of select="format-number(., '#,##0.00')"/>
                                 </fo:inline>
                              </xsl:for-each>
                           </fo:block>
                        </fo:table-cell>
                         <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                           <fo:block>
                              <xsl:for-each select="RR_FedNonFedBudget10:FundRequested/RR_FedNonFedBudget10:TotalFedNonFed">
                                 <fo:inline font-size="8pt">
                                    <xsl:value-of select="format-number(., '#,##0.00')"/>
                                 </fo:inline>
                              </xsl:for-each>
                           </fo:block>
                        </fo:table-cell>
                     </fo:table-row>
                  </xsl:for-each>
               </xsl:for-each>
               <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Total Indirect Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="8pt">
                           <xsl:choose>
                              <xsl:when test="RR_FedNonFedBudget10:IndirectCosts/RR_FedNonFedBudget10:TotalIndirectCosts">
                                 <xsl:value-of select="format-number(RR_FedNonFedBudget10:IndirectCosts/RR_FedNonFedBudget10:TotalIndirectCosts/RR_FedNonFedBudget10:FederalSummary, '#,##0.00')"/>
                              </xsl:when>

                           </xsl:choose>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="8pt">
                           <xsl:choose>
                              <xsl:when test="RR_FedNonFedBudget10:IndirectCosts/RR_FedNonFedBudget10:TotalIndirectCosts">
                                 <xsl:value-of select="format-number(RR_FedNonFedBudget10:IndirectCosts/RR_FedNonFedBudget10:TotalIndirectCosts/RR_FedNonFedBudget10:NonFederalSummary, '#,##0.00')"/>
                              </xsl:when>

                           </xsl:choose>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="8pt">
                           <xsl:choose>
                              <xsl:when test="RR_FedNonFedBudget10:IndirectCosts/RR_FedNonFedBudget10:TotalIndirectCosts">
                                 <xsl:value-of select="format-number(RR_FedNonFedBudget10:IndirectCosts/RR_FedNonFedBudget10:TotalIndirectCosts/RR_FedNonFedBudget10:TotalFedNonFedSummary, '#,##0.00')"/>
                              </xsl:when>

                           </xsl:choose>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell hyphenate="true" language="en" number-columns-spanned="2" text-align="left" padding-start="3pt" padding-end="1pt" padding-before="2pt" padding-after="0pt" display-align="before">
                      <fo:block>
                     <fo:table table-layout="fixed">
                     <fo:table-column column-width="proportional-column-width(40)"/>
                     <fo:table-column column-width="proportional-column-width(60)"/>                                                
                     <fo:table-body>
   					 <fo:table-row>
                              <fo:table-cell>
                                 <fo:block>
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="bold">Cognizant Federal Agency</fo:inline>
                                       <fo:inline font-size="8pt">&#160; </fo:inline>
                                    </fo:block>
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="normal">(Agency Name, POC Name, and POC Phone Number)</fo:inline>
                                    </fo:block>
                                 </fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block>
                                    <xsl:for-each select="RR_FedNonFedBudget10:CognizantFederalAgency">
                                       <fo:inline font-size="8pt">
                                          <xsl:apply-templates/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                        </fo:table-body>
                     </fo:table>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block>
            <fo:leader leader-pattern="space"/>
         </fo:block>
          <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
            <fo:table-column column-width="proportional-column-width(52)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
               <fo:table-cell border-before-color="white" text-align="start" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" number-columns-spanned="3" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">I. Total Direct and Indirect Costs</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Non-Federal (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>
				<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>
													<fo:inline font-weight="bold" font-size="8pt">*Total (Fed + Non-Fed) (&#36;)</fo:inline>
												</fo:block>
				</fo:table-cell>              
               </fo:table-row>         
               <fo:table-row>
                  <fo:table-cell text-align="right"  number-columns-spanned="3" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Total Direct and Indirect Institutional Costs (G + H)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:TotalCosts/RR_FedNonFedBudget10:FederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:TotalCosts/RR_FedNonFedBudget10:NonFederalSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:TotalCosts/RR_FedNonFedBudget10:TotalFedNonFedSummary">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block>
            <fo:leader leader-pattern="space"/>
         </fo:block>
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
         <fo:table-column column-width="proportional-column-width(52)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
               <fo:table-cell border-before-color="white" text-align="start" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" number-columns-spanned="3" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">J. Fee</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Federal (&#36;)</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>

												</fo:block>
				</fo:table-cell>
				<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>

												</fo:block>
				</fo:table-cell>              
               </fo:table-row>     
            
               <fo:table-row>
                  <fo:table-cell text-align="left" number-columns-spanned="3" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt">&#160;                                                </fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_FedNonFedBudget10:Fee">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block>
            <fo:leader leader-pattern="space"/>
         </fo:block>
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt" table-layout="fixed">
         <fo:table-column column-width="proportional-column-width(52)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
									<fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
               <fo:table-cell border-before-color="white" text-align="start" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" number-columns-spanned="3" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">K. * Budget Justification</fo:inline>
                                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>

                                    </fo:block>
                </fo:table-cell>
                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>

												</fo:block>
				</fo:table-cell>
				<fo:table-cell border-before-color="white" border-end-color="white" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
												<fo:block>

												</fo:block>
				</fo:table-cell>              
               </fo:table-row>     
               <fo:table-row>
                  <fo:table-cell text-align="left"  padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="7pt" font-weight="normal">(Only attach one file.)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="start" number-columns-spanned="3" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                      <fo:inline font-size="8pt">File Name: </fo:inline>
                        <xsl:for-each select="../RR_FedNonFedBudget10:BudgetJustificationAttachment">
                           <xsl:for-each select="att:FileName">
                              <fo:inline font-size="8pt">
                                 <xsl:apply-templates/>
                           </fo:inline>
                        </xsl:for-each>
                      </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" number-columns-spanned="3" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt">Mime Type: </fo:inline>
                        <xsl:for-each select="../RR_FedNonFedBudget10:BudgetJustificationAttachment">
                           <xsl:for-each select="att:MimeType">
                              <fo:inline font-size="8pt">
                                 <xsl:apply-templates/>
                              </fo:inline>
                           </xsl:for-each>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  </fo:table-row>  
             </fo:table-body>
         </fo:table>
      </fo:block>
   </xsl:template>
   <!--===========================End Single Year Template===========-->
   <!--========================== date template =================-->
   <xsl:template name="formatDate">
      <xsl:param name="value"/>
      <xsl:value-of select="format-number(substring($value,6,2), '00')"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="format-number(substring($value,9,2), '00')"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="format-number(substring($value,1,4), '0000')"/>
   </xsl:template>
</xsl:stylesheet>
