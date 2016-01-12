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
<xsl:stylesheet version="1.0" xmlns:RR_SubawardBudget="http://apply.grants.gov/forms/RR_SubawardBudget-V1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:grant="http://apply.grants.gov/system/MetaGrantApplication" xmlns:RR_Budget10="http://apply.grants.gov/forms/RR_Budget10-V1.1" xmlns:glob="http://apply.grants.gov/system/Global-V1.0" xmlns:att="http://apply.grants.gov/system/Attachments-V1.0" xmlns:globLib="http://apply.grants.gov/system/GlobalLibrary-V2.0" xmlns:footer="http://apply.grants.gov/system/Footer-V1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:header="http://devapply.row.com/system/Header-V1.0">
   <xsl:template match="RR_Budget10:RR_Budget10[name(..)!='RR_SubawardBudget:BudgetAttachments']">
      <fo:root>
         <fo:layout-master-set>
            <fo:simple-page-master master-name="AB" page-height="8.5in" page-width="11in" margin-left="0.3in" margin-right="0.3in">
               <fo:region-body margin-top="0.3in" margin-bottom=".4in"/>
               <fo:region-after extent=".3in"/>
            </fo:simple-page-master>
            <fo:simple-page-master master-name="main" page-height="11in" page-width="8.5in" margin-left="0.4in" margin-right="0.4in">
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
         <xsl:for-each select="RR_Budget10:BudgetYear">
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
                              <fo:inline font-size="6px" font-weight="bold">Tracking Number: <xsl:value-of select="/*/*/footer:Grants_govTrackingNumber"/>
                              </fo:inline>
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
                           <fo:block><fo:inline font-size="6px" font-weight="bold">Expiration Date: 04/30/2008</fo:inline></fo:block>
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
                              <fo:inline font-size="6px" font-weight="bold">Tracking Number: <xsl:value-of select="/*/*/footer:Grants_govTrackingNumber"/>
                              </fo:inline>
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
                           <fo:block><fo:inline font-size="6px" font-weight="bold">Expiration Date: 04/30/2008</fo:inline></fo:block>
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
                              <fo:inline font-size="6px" font-weight="bold">Tracking Number: <xsl:value-of select="/*/*/footer:Grants_govTrackingNumber"/>
                              </fo:inline>
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
                           <fo:block><fo:inline font-size="6px" font-weight="bold">Expiration Date: 04/30/2008</fo:inline></fo:block>
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
                              <fo:inline font-weight="bold" font-size="10pt">RESEARCH &amp; RELATED BUDGET - Cumulative Budget</fo:inline>
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
               <fo:block font-size="8pt">
                  <fo:table width="420pt" space-before.optimum="3pt" space-after.optimum="2pt">
                     <fo:table-column column-width="proportional-column-width(60)"/>
                     <fo:table-column column-width="proportional-column-width(20)"/>
                     <fo:table-column column-width="proportional-column-width(20)"/>
                     <fo:table-body>
                         <fo:table-row>
                             <fo:table-cell>
                                 <fo:block></fo:block>
                             </fo:table-cell>
                         </fo:table-row>
                        <!--============= ROWS Begin ======================-->
                        <xsl:for-each select="RR_Budget10:BudgetSummary">
                           <fo:table-row>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell number-columns-spanned="2" text-align="center">
                                 <fo:block>
                                    <fo:inline font-size="8pt" font-weight="bold">Totals ($)</fo:inline>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell number-columns-spanned="3">
                                 <fo:block>&#160;</fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block font-weight="bold">Section A, Senior/Key Person</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>

									   <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedSeniorKeyPerson">
                                              <fo:inline font-weight="bold">
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                   </xsl:for-each>
	                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block font-weight="bold">Section B, Other Personnel</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>
                                    <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedOtherPersonnel">
                                       <fo:inline font-weight="bold">
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block>Total Number Other Personnel</fo:block>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>
                                    <xsl:value-of select="RR_Budget10:CumulativeTotalNoOtherPersonnel"/>
                                 </fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block font-weight="bold">Total Salary, Wages and Fringe Benefits (A+B)</fo:block>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>

                                    <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedPersonnel">
                                       <fo:inline font-weight="bold">
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block font-weight="bold">Section C, Equipment</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>
                                    <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedEquipment">
                                       <fo:inline font-weight="bold">
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block font-weight="bold">Section D, Travel</fo:block>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>
                                    <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedTravel">
                                       <fo:inline font-weight="bold">
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block>1. Domestic</fo:block>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>
                                    <xsl:for-each select="RR_Budget10:CumulativeDomesticTravelCosts">
                                       <fo:inline>
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block>2. Foreign</fo:block>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>
                                    <xsl:for-each select="RR_Budget10:CumulativeForeignTravelCosts">
                                       <fo:inline>
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block font-weight="bold">Section E, Participant/Trainee Support Costs</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedTraineeCosts">
                                          <fo:inline font-weight="bold">
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>1. Tuition/Fees/Health Insurance</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeTraineeTuitionFeesHealthInsurance">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>2. Stipends</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeTraineeStipends">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>3. Travel</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeTraineeTravel">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>4. Subsistence</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeTraineeSubsistence">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>5. Other</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeOtherTraineeCost">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>6. Number of Participants/Trainees</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:value-of select="RR_Budget10:CumulativeNoofTrainees"/>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                         
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block font-weight="bold">Section F, Other Direct Costs</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedOtherDirectCosts">
                                          <fo:inline font-weight="bold">
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>1. Materials and Supplies</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeMaterialAndSupplies">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>2. Publication Costs</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativePublicationCosts">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>3. Consultant Services</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeConsultantServices">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>4. ADP/Computer Services</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeADPComputerServices">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>5. Subawards/Consortium/Contractual Costs</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeSubawardConsortiumContractualCosts">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>6. Equipment or Facility Rental/User Fees</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeEquipmentFacilityRentalFees">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>7. Alterations and Renovations</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeAlterationsAndRenovations">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>8. Other 1</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeOther1DirectCost">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>9. Other 2</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeOther2DirectCost">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                    <fo:block>10. Other 3</fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:CumulativeOther3DirectCost">
                                          <fo:inline>
                                             <xsl:value-of select="format-number(., '#,##0.00')"/>
                                          </fo:inline>
                                       </xsl:for-each>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell>
                                    <fo:block/>
                                 </fo:table-cell>
                              </fo:table-row>
                           
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block font-weight="bold">Section G, Direct Costs (A thru F)</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>

                                    <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedDirectCosts">
                                       <fo:inline font-weight="bold">
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block font-weight="bold">Section H, Indirect Costs</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>
                                    <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedIndirectCost">
                                       <fo:inline font-weight="bold">
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block font-weight="bold">Section I, Total Direct and Indirect Costs (G + H)</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>

                                   <xsl:for-each select="RR_Budget10:CumulativeTotalFundsRequestedDirectIndirectCosts">
                                       <fo:inline font-weight="bold">
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell hyphenate="true" language="en" padding-before="3pt" padding-after="3pt">
                                 <fo:block font-weight="bold">Section J, Fee</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                 <fo:block/>
                              </fo:table-cell>
                              <fo:table-cell text-align="right">
                                 <fo:block>
                                    <xsl:for-each select="RR_Budget10:CumulativeFee">
                                       <fo:inline font-weight="bold">
                                          <xsl:value-of select="format-number(., '#,##0.00')"/>
                                       </fo:inline>
                                    </xsl:for-each>
                                 </fo:block>
                              </fo:table-cell>
                           </fo:table-row>
                           <!--============ ROWS End ================================-->
                        </xsl:for-each>
                     </fo:table-body>
                  </fo:table>
               </fo:block>

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
                        <fo:inline font-weight="bold" font-size="10pt">RESEARCH &amp; RELATED BUDGET - SECTION A &amp; B, BUDGET PERIOD&#160;<xsl:value-of select="$year"/>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
<fo:block font-size="8pt">
   <fo:inline font-weight="bold">* ORGANIZATIONAL DUNS:&#160;&#160;</fo:inline>
   <fo:inline><xsl:value-of select="../RR_Budget10:DUNSID"/></fo:inline>
</fo:block>
         <fo:inline font-size="8pt" font-weight="bold">*&#160;Budget Type:&#160;&#160;&#160;&#160;&#160;&#160; </fo:inline>
         <xsl:for-each select="../RR_Budget10:BudgetType">
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

         <xsl:for-each select="../RR_Budget10:BudgetType">
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
            <xsl:value-of select="../RR_Budget10:OrganizationName"/>
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
                              <xsl:with-param name="value" select="RR_Budget10:BudgetPeriodStartDate"/>
                           </xsl:call-template>
                        </fo:inline>
                        <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; *&#160;End Date:&#160;</fo:inline>
                        <fo:inline font-size="8pt">
                           <xsl:call-template name="formatDate">
                              <xsl:with-param name="value" select="RR_Budget10:BudgetPeriodEndDate"/>
                           </xsl:call-template>
                        </fo:inline>
                        <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; Budget Period:&#160;<xsl:value-of select="$year"/>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <xsl:for-each select="RR_Budget10:KeyPersons">
            <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
               <fo:table-column/>
               <fo:table-body>
                  <fo:table-row>
                     <fo:table-cell border-style="solid" border-color="black" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <fo:inline font-size="8pt" font-weight="bold">A. Senior/Key Person</fo:inline>
                           <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
                              <fo:table-column column-width="proportional-column-width(2)"/>
                              <fo:table-column column-width="proportional-column-width(6)"/>
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(22)"/>
                              <fo:table-column column-width="proportional-column-width(8)"/>
                              <fo:table-column column-width="proportional-column-width(14)"/>
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(6)"/>
                              <fo:table-column column-width="proportional-column-width(6)"/>
                              <fo:table-column column-width="proportional-column-width(6)"/>
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(16)"/>
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
                                          <fo:inline font-weight="bold" font-size="8pt">* Project</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Base</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Calendar</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Academic</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Summer</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">* Requested</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">* Fringe</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">* Funds</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                                 <!-- adding next row -->
                                 <fo:table-row>
                                    <fo:table-cell number-columns-spanned="2" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                        
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                         
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                         
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Role</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Salary (&#36;)</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Months</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Months</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Months</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Salary&#160;(&#36;)</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Benefits (&#36;)</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-weight="bold" font-size="8pt">Requested&#160;(&#36;)</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                              </fo:table-body>
                           </fo:table>
                           <xsl:for-each select="RR_Budget10:KeyPerson">
                              <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
                                 <fo:table-column column-width="proportional-column-width(2)"/>
                                 <fo:table-column column-width="proportional-column-width(6)"/>
                                 <fo:table-column column-width="proportional-column-width(10)"/>
                                 <fo:table-column column-width="proportional-column-width(10)"/>
                                 <fo:table-column column-width="proportional-column-width(22)"/>
                                 <fo:table-column column-width="proportional-column-width(8)"/>
                                 <fo:table-column column-width="proportional-column-width(14)"/>
                                 <fo:table-column column-width="proportional-column-width(10)"/>
                                 <fo:table-column column-width="proportional-column-width(6)"/>
                                 <fo:table-column column-width="proportional-column-width(6)"/>
                                 <fo:table-column column-width="proportional-column-width(6)"/>
                                 <fo:table-column column-width="proportional-column-width(10)"/>
                                 <fo:table-column column-width="proportional-column-width(10)"/>
                                 <fo:table-column column-width="proportional-column-width(16)"/>
                                 <fo:table-body>
                                    <fo:table-row>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <fo:inline font-size="8pt">
                                                <xsl:value-of select="position()"/>.&#160;</fo:inline>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_Budget10:Name">
                                                <xsl:for-each select="globLib:PrefixName">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_Budget10:Name">
                                                <xsl:for-each select="globLib:FirstName">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_Budget10:Name">
                                                <xsl:for-each select="globLib:MiddleName">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_Budget10:Name">
                                                <xsl:for-each select="globLib:LastName">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_Budget10:Name">
                                                <xsl:for-each select="globLib:SuffixName">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_Budget10:ProjectRole">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:BaseSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:FundsRequested">
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
                           <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(18)"/>
                              <fo:table-column column-width="proportional-column-width(12)"/>
                              <fo:table-column column-width="proportional-column-width(24)"/>
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(6)"/>
                              <fo:table-column column-width="proportional-column-width(6)"/>
                              <fo:table-column column-width="proportional-column-width(6)"/>
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(10)"/>
                              <fo:table-column column-width="proportional-column-width(16)"/>
                              <fo:table-body>
                                 <fo:table-row>
                                    <fo:table-cell number-columns-spanned="11" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt" font-weight="bold">Total Funds Requested for all Senior Key Persons in the attached file </fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:TotalFundForAttachedKeyPersons">
                                             <fo:inline font-size="8pt" font-weight="bold">
                                                <xsl:value-of select="format-number(., '#,##0.00')"/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                                 <fo:table-row>
                                    <fo:table-cell number-columns-spanned="3" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt" font-weight="bold">Additional Senior Key Persons:</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell number-columns-spanned="4" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt">File Name: </fo:inline>
                                          <xsl:for-each select="RR_Budget10:AttachedKeyPersons">
                                             <xsl:for-each select="att:FileName">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    
                                    <fo:table-cell number-columns-spanned="4" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt" font-weight="bold">Total Senior/Key Person</fo:inline>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:TotalFundForKeyPersons">
                                             <fo:inline font-size="8pt" font-weight="bold">
                                                <xsl:value-of select="format-number(., '#,##0.00')"/>
                                             </fo:inline>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                                 <fo:table-row>
                                 <fo:table-cell number-columns-spanned="3" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                         
                                       </fo:block>
                                    </fo:table-cell>
                                  <fo:table-cell number-columns-spanned="3" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <fo:inline font-size="8pt">Mime Type: </fo:inline>
                                          <xsl:for-each select="RR_Budget10:AttachedKeyPersons">
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
                        <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
                           <fo:table-column column-width="proportional-column-width(10)"/>
                           <fo:table-column column-width="proportional-column-width(75)"/>
                           <fo:table-column column-width="proportional-column-width(6)"/>
                           <fo:table-column column-width="proportional-column-width(6)"/>
                           <fo:table-column column-width="proportional-column-width(6)"/>
                           <fo:table-column column-width="proportional-column-width(10)"/>
                           <fo:table-column column-width="proportional-column-width(10)"/>
                           <fo:table-column column-width="proportional-column-width(16)"/>
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
                                       <fo:inline font-weight="bold" font-size="8pt">* Requested Salary (&#36;)</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Fringe Benefits</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Funds Requested (&#36;)</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <xsl:for-each select="RR_Budget10:OtherPersonnel">
                                 <fo:table-row>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:PostDocAssociates">
                                             <xsl:for-each select="RR_Budget10:NumberOfPersonnel">
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
                                          <xsl:for-each select="RR_Budget10:PostDocAssociates">
                                                <xsl:for-each select="RR_Budget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:PostDocAssociates">
                                                <xsl:for-each select="RR_Budget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:PostDocAssociates">
                                                <xsl:for-each select="RR_Budget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:PostDocAssociates">
                                                <xsl:for-each select="RR_Budget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:PostDocAssociates">
                                                <xsl:for-each select="RR_Budget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:PostDocAssociates">
                                                <xsl:for-each select="RR_Budget10:FundsRequested">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                                 <fo:table-row>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:GraduateStudents">
                                             <xsl:for-each select="RR_Budget10:NumberOfPersonnel">
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
                                          <xsl:for-each select="RR_Budget10:GraduateStudents">
                                                <xsl:for-each select="RR_Budget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:GraduateStudents">
                                                <xsl:for-each select="RR_Budget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:GraduateStudents">
                                                <xsl:for-each select="RR_Budget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:GraduateStudents">
                                                <xsl:for-each select="RR_Budget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:GraduateStudents">
                                                <xsl:for-each select="RR_Budget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:GraduateStudents">
                                                <xsl:for-each select="RR_Budget10:FundsRequested">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                                 <fo:table-row>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:UndergraduateStudents">
                                             <xsl:for-each select="RR_Budget10:NumberOfPersonnel">
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
                                          <xsl:for-each select="RR_Budget10:UndergraduateStudents">
                                                <xsl:for-each select="RR_Budget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:UndergraduateStudents">
                                                <xsl:for-each select="RR_Budget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:UndergraduateStudents">
                                                <xsl:for-each select="RR_Budget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:UndergraduateStudents">
                                                <xsl:for-each select="RR_Budget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:UndergraduateStudents">
                                                <xsl:for-each select="RR_Budget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:UndergraduateStudents">
                                                <xsl:for-each select="RR_Budget10:FundsRequested">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                                 <fo:table-row>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:SecretarialClerical">
                                             <xsl:for-each select="RR_Budget10:NumberOfPersonnel">
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
                                          <xsl:for-each select="RR_Budget10:SecretarialClerical">
                                                <xsl:for-each select="RR_Budget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:SecretarialClerical">
                                                <xsl:for-each select="RR_Budget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:SecretarialClerical">
                                                <xsl:for-each select="RR_Budget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:SecretarialClerical">
                                                <xsl:for-each select="RR_Budget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:SecretarialClerical">
                                                <xsl:for-each select="RR_Budget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                       <fo:block>
                                          <xsl:for-each select="RR_Budget10:SecretarialClerical">
                                                <xsl:for-each select="RR_Budget10:FundsRequested">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </xsl:for-each>
                                       </fo:block>
                                    </fo:table-cell>
                                 </fo:table-row>
                              </xsl:for-each>
                           </fo:table-body>
                        </fo:table>
                        <xsl:for-each select="RR_Budget10:OtherPersonnel">
                           <xsl:for-each select="RR_Budget10:Other">
                              <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
                                 <fo:table-column column-width="proportional-column-width(10)"/>
                                 <fo:table-column column-width="proportional-column-width(75)"/>
                                 <fo:table-column column-width="proportional-column-width(6)"/>
                                 <fo:table-column column-width="proportional-column-width(6)"/>
                                 <fo:table-column column-width="proportional-column-width(6)"/>
                                 <fo:table-column column-width="proportional-column-width(10)"/>
                                 <fo:table-column column-width="proportional-column-width(10)"/>
                                 <fo:table-column column-width="proportional-column-width(16)"/>
                                 <fo:table-body>
                                    <fo:table-row>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_Budget10:NumberOfPersonnel">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="left" width="150pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                             <xsl:for-each select="RR_Budget10:ProjectRole">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:CalendarMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:AcademicMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:SummerMonths">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:apply-templates/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:RequestedSalary">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="3pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:FringeBenefits">
                                                   <fo:inline font-size="8pt">
                                                      <xsl:value-of select="format-number(., '#,##0.00')"/>
                                                   </fo:inline>
                                                </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                          <fo:block>
                                                <xsl:for-each select="RR_Budget10:FundsRequested">
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
                        <fo:table width="100%" space-before.optimum="0pt" space-after.optimum="0pt">
                           <fo:table-column column-width="proportional-column-width(10)"/>
                           <fo:table-column column-width="proportional-column-width(75)"/>
                           <fo:table-column column-width="proportional-column-width(6)"/>
                           <fo:table-column column-width="proportional-column-width(6)"/>
                           <fo:table-column column-width="proportional-column-width(6)"/>
                           <fo:table-column column-width="proportional-column-width(10)"/>
                           <fo:table-column column-width="proportional-column-width(10)"/>
                           <fo:table-column column-width="proportional-column-width(16)"/>
                           <fo:table-body>
                              <fo:table-row>
                                 <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:OtherPersonnel">
                                          <xsl:for-each select="RR_Budget10:OtherPersonnelTotalNumber">
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
                                 <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:OtherPersonnel">
                                          <xsl:if test="RR_Budget10:TotalOtherPersonnelFund!=''">
                                             <xsl:for-each select="RR_Budget10:TotalOtherPersonnelFund">
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
                                 <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:TotalCompensation">
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
         <fo:block font-size="8pt">RESEARCH &amp; RELATED Budget {A-B} (Funds Requested)</fo:block>
      </fo:block>
   </xsl:template>
   <xsl:template name="SingleYearPart2">
      <xsl:param name="year"/>
      <fo:block>
         <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="10pt">RESEARCH &amp; RELATED BUDGET - SECTION C, D, &amp; E, BUDGET PERIOD&#160;<xsl:value-of select="$year"/>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
<fo:block font-size="8pt">
   <fo:inline font-weight="bold">* ORGANIZATIONAL DUNS:&#160;&#160;</fo:inline>
   <fo:inline><xsl:value-of select="../RR_Budget10:DUNSID"/></fo:inline>
</fo:block>
         <fo:inline font-size="8pt" font-weight="bold">* Budget Type:&#160;&#160; </fo:inline>
         <fo:inline font-size="8pt">&#160;&#160;&#160; </fo:inline>
         <xsl:for-each select="../RR_Budget10:BudgetType">
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

         <xsl:for-each select="../RR_Budget10:BudgetType">
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
         <fo:inline font-size="8pt" font-weight="bold">Enter name of Organization: </fo:inline>
         <xsl:for-each select="../RR_Budget10:OrganizationName">
            <fo:inline font-size="8pt">
               <xsl:apply-templates/>
            </fo:inline>
         </xsl:for-each>
         <fo:block>
                        
                     </fo:block>
         <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">* Start Date:&#160;</fo:inline>
                        <fo:inline font-size="8pt">
                           <xsl:call-template name="formatDate">
                              <xsl:with-param name="value" select="RR_Budget10:BudgetPeriodStartDate"/>
                           </xsl:call-template>
                        </fo:inline>
                        <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;* End Date:&#160;</fo:inline>
                        <fo:inline font-size="8pt">
                           <xsl:call-template name="formatDate">
                              <xsl:with-param name="value" select="RR_Budget10:BudgetPeriodEndDate"/>
                           </xsl:call-template>
                        </fo:inline>
                        <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; Budget Period:&#160;<xsl:value-of select="$year"/>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
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
                        <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
                           <fo:table-column column-width="proportional-column-width(85)"/>
                           <fo:table-column column-width="proportional-column-width(16)"/>
                           <fo:table-header>
                              <fo:table-row>
                                 <fo:table-cell border-before-color="white" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">Equipment Item</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell border-before-color="white" border-end-color="white" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-weight="bold" font-size="8pt">* Funds Requested (&#36;)</fo:inline>
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
                              <xsl:for-each select="RR_Budget10:Equipment">
                                 <xsl:for-each select="RR_Budget10:EquipmentList">
                                    <fo:table-row>
                                       <fo:table-cell hyphenate="true" language="en" line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                                          <fo:block>
                                             <fo:inline font-size="8pt">
                                                <xsl:value-of select="position()"/>.&#160;</fo:inline>
                                             <xsl:for-each select="RR_Budget10:EquipmentItem">
                                                <fo:inline font-size="8pt">
                                                   <xsl:apply-templates/>
                                                </fo:inline>
                                             </xsl:for-each>
                                          </fo:block>
                                       </fo:table-cell>
                                       <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                                          <fo:block>
                                             <xsl:for-each select="RR_Budget10:FundsRequested">
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
                        <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
                           <fo:table-column column-width="proportional-column-width(85)"/>
                           <fo:table-column column-width="proportional-column-width(16)"/>
                           <fo:table-header>
                              <fo:table-row>
                                 <fo:table-cell text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="bold">Total funds requested for all equipment listed in the attached file</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:Equipment">
                                          <xsl:for-each select="RR_Budget10:TotalFundForAttachedEquipment">
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
                                 <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                                    <fo:block>
                                       <fo:inline font-size="8pt" font-weight="bold">Total Equipment</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                                    <fo:block>
                                       <xsl:for-each select="RR_Budget10:Equipment">
                                          <xsl:for-each select="RR_Budget10:TotalFund">
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
                                 <!-- ele adding row -->
                               </fo:table-row>
                               <fo:table-row>
                                 <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start"  number-columns-spanned="2">
                                    <fo:block>
                                       <fo:inline font-size="8pt">&#160;&#160;&#160;&#160;&#160;&#160;File Name: </fo:inline>
                                       <xsl:for-each select="RR_Budget10:Equipment/RR_Budget10:AdditionalEquipmentsAttachment">
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
                                       <xsl:for-each select="RR_Budget10:Equipment/RR_Budget10:AdditionalEquipmentsAttachment">
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
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column column-width="proportional-column-width(87)"/>
            <fo:table-column column-width="proportional-column-width(13)"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">D. Travel</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="8pt">Funds Requested (&#36;)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt">1. Domestic Travel Costs ( Incl. Canada, Mexico, and U.S. Possessions)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:Travel/RR_Budget10:DomesticTravelCost">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt">2. Foreign Travel Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:Travel/RR_Budget10:ForeignTravelCost">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Total Travel Cost</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:Travel/RR_Budget10:TotalTravelCost">
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
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column column-width="proportional-column-width(50)"/>
            <fo:table-column column-width="proportional-column-width(35)"/>
             <fo:table-column column-width="proportional-column-width(15)"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="2">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">E. Participant/Trainee Support Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="8pt">Funds Requested (&#36;)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="2">
                     <fo:block>
                        <fo:inline font-size="8pt">1. Tuition/Fees/Health Insurance</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:ParticipantTraineeSupportCosts/RR_Budget10:TuitionFeeHealthInsurance">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="2">
                     <fo:block>
                        <fo:inline font-size="8pt">2. Stipends</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:ParticipantTraineeSupportCosts/RR_Budget10:Stipends">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="2">
                     <fo:block>
                        <fo:inline font-size="8pt">3. Travel</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:ParticipantTraineeSupportCosts/RR_Budget10:Travel">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="2">
                     <fo:block>
                        <fo:inline font-size="8pt">4. Subsistence</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:ParticipantTraineeSupportCosts/RR_Budget10:Subsistence">
                           <fo:inline font-size="8pt">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start" number-columns-spanned="2">
                     <fo:block hyphenate="true">
                        <fo:inline font-size="8pt">5. Other:&#160;&#160; </fo:inline>
                        <xsl:for-each select="RR_Budget10:ParticipantTraineeSupportCosts/RR_Budget10:Other">
                           <xsl:for-each select="RR_Budget10:Description">
                              <fo:inline font-size="8pt">
                                 <xsl:apply-templates/>
                              </fo:inline>
                           </xsl:for-each>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:ParticipantTraineeSupportCosts/RR_Budget10:Other">
                           <xsl:for-each select="RR_Budget10:Cost">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:ParticipantTraineeSupportCosts/RR_Budget10:ParticipantTraineeNumber">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:apply-templates/>
                           </fo:inline>
                        </xsl:for-each>

                         <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;Number of Participants/Trainees</fo:inline>       
                     </fo:block>
                  </fo:table-cell>

                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;&#160;&#160;&#160;Total Participant Trainee Support Costs</fo:inline>                
                     </fo:block>
                  </fo:table-cell>
                  
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:ParticipantTraineeSupportCosts/RR_Budget10:TotalCost">
                           <fo:inline font-size="8pt" font-weight="bold">
                              <xsl:value-of select="format-number(., '#,##0.00')"/>
                           </fo:inline>
                        </xsl:for-each>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block font-size="8pt">RESEARCH &amp; RELATED Budget {C-E} (Funds Requested)</fo:block>
         <fo:block break-after="page">
            <xsl:text>&#xA;</xsl:text>
         </fo:block>
         <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="10pt">RESEARCH &amp; RELATED BUDGET - SECTIONS F-K, BUDGET PERIOD&#160;<xsl:value-of select="$year"/>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
<fo:block font-size="8pt">
   <fo:inline font-weight="bold">* ORGANIZATIONAL DUNS:&#160;&#160;</fo:inline>
   <fo:inline><xsl:value-of select="../RR_Budget10:DUNSID"/></fo:inline>
</fo:block>
         <fo:inline font-size="8pt" font-weight="bold">* Budget Type:&#160;&#160; </fo:inline>
         <fo:inline font-size="8pt">&#160;&#160;&#160; </fo:inline>
         <xsl:for-each select="../RR_Budget10:BudgetType">
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

         <xsl:for-each select="../RR_Budget10:BudgetType">
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
         <fo:inline font-size="8pt" font-weight="bold">Enter name of Organization: </fo:inline>
         <xsl:for-each select="../RR_Budget10:OrganizationName">
            <fo:inline font-size="8pt">
               <xsl:apply-templates/>
            </fo:inline>
         </xsl:for-each>
         <fo:block>
                        
                     </fo:block>
         <fo:table width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell text-align="center" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">* Start Date:&#160;</fo:inline>
                        <fo:inline font-size="8pt">
                           <xsl:call-template name="formatDate">
                              <xsl:with-param name="value" select="RR_Budget10:BudgetPeriodStartDate"/>
                           </xsl:call-template>
                        </fo:inline>
                        <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;* End Date:&#160;</fo:inline>
                        <fo:inline font-size="8pt">
                           <xsl:call-template name="formatDate">
                              <xsl:with-param name="value" select="RR_Budget10:BudgetPeriodEndDate"/>
                           </xsl:call-template>
                        </fo:inline>
                        <fo:inline font-size="8pt" font-weight="bold">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; Budget Period:&#160;<xsl:value-of select="$year"/>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column column-width="proportional-column-width(85)"/>
            <fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">F. Other Direct Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="8pt">Funds Requested (&#36;)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <xsl:for-each select="RR_Budget10:OtherDirectCosts">
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">1. Materials and Supplies</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_Budget10:MaterialsSupplies">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">2. Publication Costs</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_Budget10:PublicationCosts">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">3. Consultant Services</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_Budget10:ConsultantServices">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">4. ADP/Computer Services</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_Budget10:ADPComputerServices">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">5. Subawards/Consortium/Contractual Costs</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_Budget10:SubawardConsortiumContractualCosts">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">6. Equipment or Facility Rental/User Fees</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_Budget10:EquipmentRentalFee">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                     <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                        <fo:block>
                           <fo:inline font-size="8pt">7. Alterations and Renovations</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                        <fo:block>
                           <xsl:for-each select="RR_Budget10:AlterationsRenovations">
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="format-number(., '#,##0.00')"/>
                              </fo:inline>
                           </xsl:for-each>
                        </fo:block>
                     </fo:table-cell>
                  </fo:table-row>
                     <xsl:for-each select="RR_Budget10:Other">
                        <fo:table-row>
                           <fo:table-cell hyphenate="true" language="en" line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                              <fo:block>
                                 <fo:inline font-size="8pt">
                                    <xsl:value-of select="position()+7"/>.&#160;</fo:inline>
                                 <xsl:for-each select="RR_Budget10:Description">
                                    <fo:inline font-size="8pt">
                                       <xsl:apply-templates/>
                                    </fo:inline>
                                 </xsl:for-each>
                              </fo:block>
                           </fo:table-cell>
                           <fo:table-cell line-height="9pt" text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                              <fo:block>
                                 <xsl:for-each select="RR_Budget10:Cost">
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
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Total Other Direct Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:OtherDirectCosts/RR_Budget10:TotalOtherDirectCost">
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
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column column-width="proportional-column-width(85)"/>
            <fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">G. Direct Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="8pt">Funds Requested (&#36;)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Total Direct Costs (A thru F)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:DirectCosts">
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
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column column-width="proportional-column-width(45)"/>
            <fo:table-column column-width="proportional-column-width(20)"/>
            <fo:table-column column-width="proportional-column-width(20)"/>
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
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">* Funds Requested (&#36;)</fo:inline>
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
               <xsl:for-each select="RR_Budget10:IndirectCosts">
                  <xsl:for-each select="RR_Budget10:IndirectCost">
                     <fo:table-row>
                        <fo:table-cell hyphenate="true" language="en" line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                           <fo:block>
                              <fo:inline font-size="8pt">
                                 <xsl:value-of select="position()"/>.&#160;</fo:inline>
                              <xsl:for-each select="RR_Budget10:CostType">
                                 <fo:inline font-size="8pt">
                                    <xsl:apply-templates/>
                                 </fo:inline>
                              </xsl:for-each>
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                           <fo:block>
                              <xsl:for-each select="RR_Budget10:Rate">
                                 <fo:inline font-size="8pt">
                                    <xsl:apply-templates/>
                                 </fo:inline>
                              </xsl:for-each>
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                           <fo:block>
                              <xsl:for-each select="RR_Budget10:Base">
                                 <fo:inline font-size="8pt">
                                    <xsl:value-of select="format-number(., '#,##0.00')"/>
                                 </fo:inline>
                              </xsl:for-each>
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell line-height="9pt" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="right">
                           <fo:block>
                              <xsl:for-each select="RR_Budget10:FundRequested">
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
                              <xsl:when test="RR_Budget10:IndirectCosts/RR_Budget10:TotalIndirectCosts">
                                 <xsl:value-of select="format-number(RR_Budget10:IndirectCosts/RR_Budget10:TotalIndirectCosts, '#,##0.00')"/>
                              </xsl:when>

                           </xsl:choose>
                        </fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell hyphenate="true" language="en" number-columns-spanned="4" text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="0pt" display-align="before">
                      <fo:block>
                     <fo:table>
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
                                    <xsl:for-each select="RR_Budget10:CognizantFederalAgency">
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
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column column-width="proportional-column-width(85)"/>
            <fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">I. Total Direct and Indirect Costs</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="8pt">Funds Requested (&#36;)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">Total Direct and Indirect Institutional Costs (G + H)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:TotalCosts">
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
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column column-width="proportional-column-width(85)"/>
            <fo:table-column column-width="proportional-column-width(16)"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">J. Fee</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-weight="bold" font-size="8pt">Funds Requested (&#36;)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
               <fo:table-row>
                  <fo:table-cell text-align="left" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <fo:inline font-size="8pt">&#160;                                                </fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell text-align="right" padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before">
                     <fo:block>
                        <xsl:for-each select="RR_Budget10:Fee">
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
         <fo:table border-style="solid" border-color="black" width="100%" space-before.optimum="1pt" space-after.optimum="2pt">
            <fo:table-column/>
            <fo:table-column/>
            <fo:table-column/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt" font-weight="bold">K. * Budget Justification</fo:inline>
                     </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding-start="1pt" padding-end="1pt" padding-before="1pt" padding-after="1pt" display-align="before" text-align="start">
                     <fo:block>
                        <fo:inline font-size="8pt">File Name: </fo:inline>
                        <xsl:for-each select="../RR_Budget10:BudgetJustificationAttachment">
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
                        <xsl:for-each select="../RR_Budget10:BudgetJustificationAttachment">
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
                  <fo:table-cell>
                     <fo:block/>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2">
                     <fo:block>
                        <fo:inline font-size="8pt">(Only attach one file.)</fo:inline>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
         <fo:block font-size="8pt">RESEARCH &amp; RELATED Budget {F-K} (Funds Requested)</fo:block>
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
