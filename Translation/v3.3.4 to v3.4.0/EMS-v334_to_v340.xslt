<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:tbf="http://www.altova.com/MapForce/UDF/tbf" 
	xmlns:ns0="http://www.nemsis.org" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	exclude-result-prefixes="tbf ns0 xs fn">
	
	<xsl:template name="tbf:tbf1_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/node()">
			<xsl:choose>
				<xsl:when test="fn:boolean(self::*)">
					<xsl:if test="fn:boolean(self::ns0:ePayment.23)">
						<xsl:variable name="var1_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var2_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var1_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.24)">
						<xsl:variable name="var3_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var4_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var3_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.25)">
						<xsl:variable name="var5_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var6_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var5_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.26)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf2_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.27)">
						<xsl:variable name="var7_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var8_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var7_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.28)">
						<xsl:variable name="var9_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var10_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var9_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.29)">
						<xsl:variable name="var11_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var12_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var11_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.30)">
						<xsl:variable name="var13_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var14_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var13_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.31)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf3_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.32)">
						<xsl:variable name="var15_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var16_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var15_resultof_cast"/>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="fn:not(fn:boolean(self::text()))">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tbf:tbf2_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@StreetAddress2">
			<xsl:attribute name="StreetAddress2" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf3_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@PhoneNumberType">
			<xsl:attribute name="PhoneNumberType" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:for-each select="$input/@CorrelationID">
			<xsl:attribute name="CorrelationID" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf4_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/node()">
			<xsl:choose>
				<xsl:when test="fn:boolean(self::*)">
					<xsl:if test="fn:boolean(self::ns0:ePayment.33)">
						<xsl:variable name="var1_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var2_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var1_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.34)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf5_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.35)">
						<xsl:variable name="var3_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var4_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var3_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.36)">
						<xsl:variable name="var5_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var6_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var5_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.37)">
						<xsl:variable name="var7_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var8_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var7_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.38)">
						<xsl:variable name="var9_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var10_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var9_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:ePayment.39)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf6_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="fn:not(fn:boolean(self::text()))">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tbf:tbf5_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@StreetAddress2">
			<xsl:attribute name="StreetAddress2" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf6_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@PhoneNumberType">
			<xsl:attribute name="PhoneNumberType" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf7_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:for-each select="$input/@CorrelationID">
			<xsl:attribute name="CorrelationID" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf8_eDisposition">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/node()">
			<xsl:choose>
				<xsl:when test="fn:boolean(self::*)">
					<xsl:if test="fn:boolean(self::ns0:eDisposition.DestinationGroup)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf9_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.11)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf16_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.12)">
						<xsl:variable name="var1_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var2_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var1_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.13)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf17_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.14)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf18_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.15)">
						<xsl:variable name="var3_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var4_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var3_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.16)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf19_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.17)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf20_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.18)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf21_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.19)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf22_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.20)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf23_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.21)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf24_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.22)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf25_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.23)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf26_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.HospitalTeamActivationGroup)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf27_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.26)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf30_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="fn:not(fn:boolean(self::text()))">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tbf:tbf9_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/node()">
			<xsl:choose>
				<xsl:when test="fn:boolean(self::*)">
					<xsl:if test="fn:boolean(self::ns0:eDisposition.01)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf10_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.02)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf11_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.03)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:call-template name="tbf:tbf12_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.04)">
						<xsl:variable name="var1_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var2_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var1_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.05)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf13_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.06)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf14_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.07)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf15_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.08)">
						<xsl:variable name="var3_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var4_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var3_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.09)">
						<xsl:variable name="var5_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var6_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var5_resultof_cast"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.10)">
						<xsl:variable name="var7_resultof_cast" as="xs:string" select="fn:string(.)"/>
						<xsl:variable name="var8_resultof_node_name" as="xs:QName" select="fn:node-name(.)"/>
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="$var7_resultof_cast"/>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="fn:not(fn:boolean(self::text()))">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tbf:tbf10_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf11_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf12_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@StreetAddress2">
			<xsl:attribute name="StreetAddress2" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf13_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf14_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf15_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf16_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf17_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@CorrelationID">
			<xsl:attribute name="CorrelationID" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf18_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@CorrelationID">
			<xsl:attribute name="CorrelationID" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf19_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf20_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf21_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:for-each select="$input/@CorrelationID">
			<xsl:attribute name="CorrelationID" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf22_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf23_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:for-each select="$input/@CorrelationID">
			<xsl:attribute name="CorrelationID" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf24_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf25_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf26_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf27_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@CorrelationID">
			<xsl:attribute name="CorrelationID" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:for-each select="$input/node()">
			<xsl:choose>
				<xsl:when test="fn:boolean(self::*)">
					<xsl:if test="fn:boolean(self::ns0:eDisposition.24)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf28_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="fn:boolean(self::ns0:eDisposition.25)">
						<xsl:element name="{node-name(.)}" namespace="{namespace-uri(.)}">
							<xsl:sequence select="@xsi:nil"/>
							<xsl:call-template name="tbf:tbf29_">
								<xsl:with-param name="input" select="." as="node()"/>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="fn:not(fn:boolean(self::text()))">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tbf:tbf28_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf29_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@NV">
			<xsl:attribute name="NV" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:template name="tbf:tbf30_">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@CorrelationID">
			<xsl:attribute name="CorrelationID" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:sequence select="fn:string($input)"/>
	</xsl:template>
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
	<xsl:template match="/">
		<EMSDataSet xmlns="http://www.nemsis.org">
			<xsl:attribute name="xsi:schemaLocation" select="'http://www.nemsis.org http://nemsis.org/media/nemsis_v3/v3.4.0.150302/XSDs/NEMSIS_Xsds_v3.4.0.150302/EMSDataSet_v3.xsd'"/>
			<xsl:for-each select="ns0:EMSDataSet">
				<xsl:for-each select="ns0:eState">
					<eState>
						<xsl:sequence select="(./@node(), ./node())"/>
					</eState>
				</xsl:for-each>
				<xsl:for-each select="ns0:Header">
					<Header>
						<DemographicGroup>
							<xsl:sequence select="(./ns0:DemographicGroup/@node(), ./ns0:DemographicGroup/node())"/>
						</DemographicGroup>
						<xsl:for-each select="ns0:eCustomConfiguration">
							<eCustomConfiguration>
								<xsl:for-each select="ns0:eCustomConfiguration.CustomGroup">
									<eCustomConfiguration.CustomGroup>
										<xsl:attribute name="CustomElementID" namespace="" select="fn:string(@CustomElementID)"/>
										<eCustomConfiguration.01>
											<xsl:sequence select="(./ns0:eCustomConfiguration.01/@node(), ./ns0:eCustomConfiguration.01/node())"/>
										</eCustomConfiguration.01>
										<eCustomConfiguration.02>
											<xsl:sequence select="fn:string(ns0:eCustomConfiguration.02)"/>
										</eCustomConfiguration.02>
										<eCustomConfiguration.03>
											<xsl:sequence select="fn:string(ns0:eCustomConfiguration.03)"/>
										</eCustomConfiguration.03>
										<eCustomConfiguration.04>
											<xsl:sequence select="fn:string(ns0:eCustomConfiguration.04)"/>
										</eCustomConfiguration.04>
										<eCustomConfiguration.05>
											<xsl:sequence select="fn:string(ns0:eCustomConfiguration.05)"/>
										</eCustomConfiguration.05>
										<xsl:for-each select="ns0:eCustomConfiguration.06">
											<eCustomConfiguration.06>
												<xsl:sequence select="(./@node(), ./node())"/>
											</eCustomConfiguration.06>
										</xsl:for-each>
										<xsl:for-each select="ns0:eCustomConfiguration.07">
											<eCustomConfiguration.07>
												<xsl:sequence select="fn:string(.)"/>
											</eCustomConfiguration.07>
										</xsl:for-each>
										<xsl:for-each select="ns0:eCustomConfiguration.08">
											<eCustomConfiguration.08>
												<xsl:sequence select="fn:string(.)"/>
											</eCustomConfiguration.08>
										</xsl:for-each>
									</eCustomConfiguration.CustomGroup>
								</xsl:for-each>
							</eCustomConfiguration>
						</xsl:for-each>
						<xsl:for-each select="ns0:PatientCareReport">
							<PatientCareReport>
								<eRecord>
									<eRecord.01>
										<xsl:sequence select="fn:string(ns0:eRecord/ns0:eRecord.01)"/>
									</eRecord.01>
									<eRecord.SoftwareApplicationGroup>
										<xsl:sequence select="(./ns0:eRecord/ns0:eRecord.SoftwareApplicationGroup/@node(), ./ns0:eRecord/ns0:eRecord.SoftwareApplicationGroup/node())"/>
									</eRecord.SoftwareApplicationGroup>
								</eRecord>
								<eResponse>
									<xsl:sequence select="(./ns0:eResponse/@node(), ./ns0:eResponse/node())"/>
								</eResponse>
								<eDispatch>
									<eDispatch.01>
										<xsl:sequence select="fn:string(ns0:eDispatch/ns0:eDispatch.01)"/>
									</eDispatch.01>
									<eDispatch.02>
										<xsl:sequence select="(./ns0:eDispatch/ns0:eDispatch.02/@node(), ./ns0:eDispatch/ns0:eDispatch.02/node())"/>
									</eDispatch.02>
									<xsl:for-each select="ns0:eDispatch/ns0:eDispatch.03">
										<eDispatch.03>
											<xsl:sequence select="fn:string(.)"/>
										</eDispatch.03>
									</xsl:for-each>
									<xsl:for-each select="ns0:eDispatch/ns0:eDispatch.04">
										<eDispatch.04>
											<xsl:sequence select="fn:string(.)"/>
										</eDispatch.04>
									</xsl:for-each>
									<xsl:for-each select="ns0:eDispatch/ns0:eDispatch.05">
										<eDispatch.05>
											<xsl:sequence select="fn:string(.)"/>
										</eDispatch.05>
									</xsl:for-each>
								</eDispatch>
								<xsl:for-each select="ns0:eCrew">
									<eCrew>
										<xsl:sequence select="(./@node(), ./node())"/>
									</eCrew>
								</xsl:for-each>
								<eTimes>
									<xsl:sequence select="(./ns0:eTimes/@node(), ./ns0:eTimes/node())"/>
								</eTimes>
								<ePatient>
									<xsl:sequence select="(./ns0:ePatient/@node(), ./ns0:ePatient/node())"/>
								</ePatient>
								<ePayment>
									<ePayment.01>
										<xsl:sequence select="(./ns0:ePayment/ns0:ePayment.01/@node(), ./ns0:ePayment/ns0:ePayment.01/node())"/>
									</ePayment.01>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.CertificateGroup">
										<ePayment.CertificateGroup>
											<xsl:sequence select="(./@node(), ./node())"/>
										</ePayment.CertificateGroup>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.08">
										<ePayment.08>
											<xsl:sequence select="fn:string(.)"/>
										</ePayment.08>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.InsuranceGroup">
										<xsl:variable name="var1_CorrelationID" as="node()?" select="@CorrelationID"/>
										<ePayment.InsuranceGroup>
											<xsl:if test="fn:exists($var1_CorrelationID)">
												<xsl:attribute name="CorrelationID" namespace="" select="fn:string($var1_CorrelationID)"/>
											</xsl:if>
											<xsl:for-each select="ns0:ePayment.09">
												<ePayment.09>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.09>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.10">
												<ePayment.10>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.10>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.11">
												<ePayment.11>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.11>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.12">
												<ePayment.12>
													<xsl:sequence select="(./@node(), ./node())"/>
												</ePayment.12>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.13">
												<ePayment.13>
													<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
												</ePayment.13>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.14">
												<ePayment.14>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.14>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.15">
												<ePayment.15>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.15>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.16">
												<ePayment.16>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.16>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.17">
												<ePayment.17>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.17>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.18">
												<ePayment.18>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.18>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.19">
												<ePayment.19>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.19>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.20">
												<ePayment.20>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.20>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.21">
												<ePayment.21>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.21>
											</xsl:for-each>
											<xsl:for-each select="ns0:ePayment.22">
												<ePayment.22>
													<xsl:sequence select="fn:string(.)"/>
												</ePayment.22>
											</xsl:for-each>
										</ePayment.InsuranceGroup>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.ClosestRelativeGroup">
										<ePayment.ClosestRelativeGroup>
											<xsl:call-template name="tbf:tbf1_">
												<xsl:with-param name="input" select="." as="node()"/>
											</xsl:call-template>
										</ePayment.ClosestRelativeGroup>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.EmployerGroup">
										<ePayment.EmployerGroup>
											<xsl:call-template name="tbf:tbf4_">
												<xsl:with-param name="input" select="." as="node()"/>
											</xsl:call-template>
										</ePayment.EmployerGroup>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.40">
										<ePayment.40>
											<xsl:sequence select="fn:string(.)"/>
										</ePayment.40>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.41">
										<ePayment.41>
											<xsl:sequence select="(./@node(), ./node())"/>
										</ePayment.41>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.42">
										<ePayment.42>
											<xsl:sequence select="(./@node(), ./node())"/>
										</ePayment.42>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.44">
										<ePayment.44>
											<xsl:sequence select="(./@node(), ./node())"/>
										</ePayment.44>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.45">
										<ePayment.45>
											<xsl:sequence select="fn:string(.)"/>
										</ePayment.45>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.46">
										<ePayment.46>
											<xsl:sequence select="fn:string(.)"/>
										</ePayment.46>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.47">
										<ePayment.47>
											<xsl:sequence select="(./@node(), ./node())"/>
										</ePayment.47>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.48">
										<ePayment.48>
											<xsl:sequence select="xs:string(xs:decimal(fn:string(.)))"/>
										</ePayment.48>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.49">
										<ePayment.49>
											<xsl:sequence select="fn:string(.)"/>
										</ePayment.49>
									</xsl:for-each>
									<ePayment.50>
										<xsl:sequence select="(./ns0:ePayment/ns0:ePayment.50/@node(), ./ns0:ePayment/ns0:ePayment.50/node())"/>
									</ePayment.50>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.51">
										<ePayment.51>
											<xsl:sequence select="(./@node(), ./node())"/>
										</ePayment.51>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.52">
										<ePayment.52>
											<xsl:sequence select="(./@node(), ./node())"/>
										</ePayment.52>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.53">
										<ePayment.53>
											<xsl:sequence select="fn:string(.)"/>
										</ePayment.53>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.54">
										<ePayment.54>
											<xsl:sequence select="fn:string(.)"/>
										</ePayment.54>
									</xsl:for-each>
									<xsl:for-each select="ns0:ePayment/ns0:ePayment.SupplyItemGroup">
										<ePayment.SupplyItemGroup>
											<xsl:sequence select="(./@node(), ./node())"/>
										</ePayment.SupplyItemGroup>
									</xsl:for-each>
								</ePayment>
								<eScene>
									<xsl:sequence select="(./ns0:eScene/@node(), ./ns0:eScene/node())"/>
								</eScene>
								<eSituation>
									<eSituation.01>
										<xsl:sequence select="(./ns0:eSituation/ns0:eSituation.01/@node(), ./ns0:eSituation/ns0:eSituation.01/node())"/>
									</eSituation.01>
									<eSituation.02>
										<xsl:sequence select="(./ns0:eSituation/ns0:eSituation.02/@node(), ./ns0:eSituation/ns0:eSituation.02/node())"/>
									</eSituation.02>
									<xsl:for-each select="ns0:eSituation/ns0:eSituation.PatientComplaintGroup">
										<eSituation.PatientComplaintGroup>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eSituation.PatientComplaintGroup>
									</xsl:for-each>
									<eSituation.07>
										<xsl:sequence select="(./ns0:eSituation/ns0:eSituation.07/@node(), ./ns0:eSituation/ns0:eSituation.07/node())"/>
									</eSituation.07>
									<eSituation.08>
										<xsl:sequence select="(./ns0:eSituation/ns0:eSituation.08/@node(), ./ns0:eSituation/ns0:eSituation.08/node())"/>
									</eSituation.08>
									<eSituation.09>
										<xsl:sequence select="(./ns0:eSituation/ns0:eSituation.09/@node(), ./ns0:eSituation/ns0:eSituation.09/node())"/>
									</eSituation.09>
									<xsl:for-each select="ns0:eSituation/ns0:eSituation.10">
										<eSituation.10>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eSituation.10>
									</xsl:for-each>
									<eSituation.11>
										<xsl:sequence select="(./ns0:eSituation/ns0:eSituation.11/@node(), ./ns0:eSituation/ns0:eSituation.11/node())"/>
									</eSituation.11>
									<xsl:for-each select="ns0:eSituation/ns0:eSituation.12">
										<eSituation.12>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eSituation.12>
									</xsl:for-each>
									<eSituation.13>
										<xsl:sequence select="(./ns0:eSituation/ns0:eSituation.13/@node(), ./ns0:eSituation/ns0:eSituation.13/node())"/>
									</eSituation.13>
									<xsl:for-each select="ns0:eSituation/ns0:eSituation.WorkRelatedGroup">
										<eSituation.WorkRelatedGroup>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eSituation.WorkRelatedGroup>
									</xsl:for-each>
									<xsl:for-each select="ns0:eSituation/ns0:eSituation.17">
										<eSituation.17>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eSituation.17>
									</xsl:for-each>
								</eSituation>
								<eInjury>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.01">
										<eInjury.01>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eInjury.01>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.02">
										<eInjury.02>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eInjury.02>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.03">
										<eInjury.03>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eInjury.03>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.04">
										<xsl:variable name="var2_NV" as="node()?" select="@NV"/>
										<xsl:variable name="var3_CorrelationID" as="node()?" select="@CorrelationID"/>
										<eInjury.04>
											<xsl:if test="fn:exists($var2_NV)">
												<xsl:attribute name="NV" namespace="" select="fn:string($var2_NV)"/>
											</xsl:if>
											<xsl:if test="fn:exists($var3_CorrelationID)">
												<xsl:attribute name="CorrelationID" namespace="" select="fn:string($var3_CorrelationID)"/>
											</xsl:if>
											<xsl:if test="(fn:translate(fn:string(@xsi:nil), 'true ', '1') = '1')">
												<xsl:attribute name="xsi:nil" select="'true'"/>
											</xsl:if>
											<xsl:if test="fn:not((fn:translate(fn:string(@xsi:nil), 'true ', '1') = '1'))">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:if>
										</eInjury.04>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.05">
										<eInjury.05>
											<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
										</eInjury.05>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.06">
										<eInjury.06>
											<xsl:sequence select="fn:string(.)"/>
										</eInjury.06>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.07">
										<eInjury.07>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eInjury.07>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.08">
										<eInjury.08>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eInjury.08>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.09">
										<eInjury.09>
											<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
										</eInjury.09>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.10">
										<eInjury.10>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eInjury.10>
									</xsl:for-each>
									<xsl:for-each select="ns0:eInjury/ns0:eInjury.CollisionGroup">
										<eInjury.CollisionGroup>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eInjury.CollisionGroup>
									</xsl:for-each>
								</eInjury>
								<eArrest>
									<eArrest.01>
										<xsl:sequence select="(./ns0:eArrest/ns0:eArrest.01/@node(), ./ns0:eArrest/ns0:eArrest.01/node())"/>
									</eArrest.01>
									<eArrest.02>
										<xsl:sequence select="(./ns0:eArrest/ns0:eArrest.02/@node(), ./ns0:eArrest/ns0:eArrest.02/node())"/>
									</eArrest.02>
									<xsl:for-each select="ns0:eArrest/ns0:eArrest.03">
										<eArrest.03>
											<xsl:sequence select="@xsi:nil"/>
											<xsl:call-template name="tbf:tbf7_">
												<xsl:with-param name="input" select="." as="node()"/>
											</xsl:call-template>
										</eArrest.03>
									</xsl:for-each>
									<xsl:for-each select="ns0:eArrest/ns0:eArrest.04">
										<eArrest.04>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eArrest.04>
									</xsl:for-each>
									<eArrest.05>
										<xsl:sequence select="(./ns0:eArrest/ns0:eArrest.05/@node(), ./ns0:eArrest/ns0:eArrest.05/node())"/>
									</eArrest.05>
									<xsl:for-each select="ns0:eArrest/ns0:eArrest.06">
										<eArrest.06>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eArrest.06>
									</xsl:for-each>
									<eArrest.07>
										<xsl:sequence select="(./ns0:eArrest/ns0:eArrest.07/@node(), ./ns0:eArrest/ns0:eArrest.07/node())"/>
									</eArrest.07>
									<xsl:for-each select="ns0:eArrest/ns0:eArrest.08">
										<eArrest.08>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eArrest.08>
									</xsl:for-each>
									<xsl:for-each select="ns0:eArrest/ns0:eArrest.09">
										<eArrest.09>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eArrest.09>
									</xsl:for-each>
									<eArrest.11>
										<xsl:sequence select="(./ns0:eArrest/ns0:eArrest.11/@node(), ./ns0:eArrest/ns0:eArrest.11/node())"/>
									</eArrest.11>
									<xsl:for-each select="ns0:eArrest/ns0:eArrest.12">
										<eArrest.12>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eArrest.12>
									</xsl:for-each>
									<xsl:for-each select="ns0:eArrest/ns0:eArrest.13">
										<eArrest.13>
											<xsl:sequence select="fn:string(.)"/>
										</eArrest.13>
									</xsl:for-each>
									<eArrest.14>
										<xsl:sequence select="(./ns0:eArrest/ns0:eArrest.14/@node(), ./ns0:eArrest/ns0:eArrest.14/node())"/>
									</eArrest.14>
									<xsl:for-each select="ns0:eArrest/ns0:eArrest.15">
										<eArrest.15>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eArrest.15>
									</xsl:for-each>
									<eArrest.16>
										<xsl:sequence select="(./ns0:eArrest/ns0:eArrest.16/@node(), ./ns0:eArrest/ns0:eArrest.16/node())"/>
									</eArrest.16>
									<xsl:for-each select="ns0:eArrest/ns0:eArrest.17">
										<eArrest.17>
											<xsl:sequence select="(./@node(), ./node())"/>
										</eArrest.17>
									</xsl:for-each>
									<eArrest.18>
										<xsl:sequence select="(./ns0:eArrest/ns0:eArrest.18/@node(), ./ns0:eArrest/ns0:eArrest.18/node())"/>
									</eArrest.18>
								</eArrest>
								<eHistory>
									<xsl:sequence select="(./ns0:eHistory/@node(), ./ns0:eHistory/node())"/>
								</eHistory>
								<xsl:for-each select="ns0:eNarrative">
									<eNarrative>
										<xsl:sequence select="(./@node(), ./node())"/>
									</eNarrative>
								</xsl:for-each>
								<eVitals>
									<xsl:sequence select="(./ns0:eVitals/@node(), ./ns0:eVitals/node())"/>
								</eVitals>
								<xsl:for-each select="ns0:eLabs">
									<eLabs>
										<xsl:sequence select="(./@node(), ./node())"/>
									</eLabs>
								</xsl:for-each>
								<xsl:for-each select="ns0:eExam">
									<eExam>
										<xsl:for-each select="ns0:eExam.01">
											<eExam.01>
												<xsl:sequence select="(./@node(), ./node())"/>
											</eExam.01>
										</xsl:for-each>
										<xsl:for-each select="ns0:eExam.02">
											<eExam.02>
												<xsl:sequence select="(./@node(), ./node())"/>
											</eExam.02>
										</xsl:for-each>
										<xsl:for-each select="ns0:eExam.AssessmentGroup">
											<eExam.AssessmentGroup>
												<xsl:sequence select="(./@node(), ./node())"/>
											</eExam.AssessmentGroup>
										</xsl:for-each>
									</eExam>
								</xsl:for-each>
								<eProtocols>
									<xsl:sequence select="(./ns0:eProtocols/@node(), ./ns0:eProtocols/node())"/>
								</eProtocols>
								<eMedications>
									<xsl:for-each select="ns0:eMedications/ns0:eMedications.MedicationGroup">
										<xsl:variable name="var4_CorrelationID" as="node()?" select="@CorrelationID"/>
										<xsl:variable name="eMedications10" as="node()" select="ns0:eMedications.10"/>
										<xsl:variable name="eMedications10_NV" as="node()?" select="$eMedications10/@NV"/>
										<eMedications.MedicationGroup>
											<xsl:if test="fn:exists($var4_CorrelationID)">
												<xsl:attribute name="CorrelationID" namespace="" select="fn:string($var4_CorrelationID)"/>
											</xsl:if>
											<eMedications.01>
												<xsl:sequence select="(./ns0:eMedications.01/@node(), ./ns0:eMedications.01/node())"/>
											</eMedications.01>
											<eMedications.02>
												<xsl:sequence select="(./ns0:eMedications.02/@node(), ./ns0:eMedications.02/node())"/>
											</eMedications.02>
											<eMedications.03>
												<xsl:sequence select="(./ns0:eMedications.03/@node(), ./ns0:eMedications.03/node())"/>
											</eMedications.03>
											<xsl:for-each select="ns0:eMedications.04">
												<eMedications.04>
													<xsl:sequence select="fn:string(.)"/>
												</eMedications.04>
											</xsl:for-each>
											<eMedications.DosageGroup>
												<xsl:sequence select="(./ns0:eMedications.DosageGroup/@node(), ./ns0:eMedications.DosageGroup/node())"/>
											</eMedications.DosageGroup>
											<eMedications.07>
												<xsl:sequence select="(./ns0:eMedications.07/@node(), ./ns0:eMedications.07/node())"/>
											</eMedications.07>
											<xsl:for-each select="ns0:eMedications.08">
												<eMedications.08>
													<xsl:sequence select="(./@node(), ./node())"/>
												</eMedications.08>
											</xsl:for-each>
											<xsl:for-each select="ns0:eMedications.09">
												<eMedications.09>
													<xsl:sequence select="(./@node(), ./node())"/>
												</eMedications.09>
											</xsl:for-each>
											
											
											
											<eMedications.10>
												<xsl:if test="fn:exists($eMedications10_NV)">												
														<xsl:attribute name="NV" namespace="" select="fn:string($eMedications10_NV)"/>
												</xsl:if>
												<xsl:if test="(fn:translate   (fn:string($eMedications10/@xsi:nil), 'true ', '1') = '1')">
													<xsl:attribute name="xsi:nil" select="'true'"/>
												</xsl:if>
												<xsl:if test="fn:not((fn:translate(fn:string($eMedications10/@xsi:nil), 'true ', '1') = '1'))">
													<xsl:choose>
														<xsl:when test="fn:string($eMedications10)=fn:string(9905017)">
															<xsl:sequence select="'9905035'"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:sequence select="fn:string($eMedications10)"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
											</eMedications.10>
											
											
											
											<xsl:for-each select="ns0:eMedications.11">
												<eMedications.11>
													<xsl:sequence select="fn:string(.)"/>
												</eMedications.11>
											</xsl:for-each>
											<xsl:for-each select="ns0:eMedications.12">
												<eMedications.12>
													<xsl:sequence select="fn:string(.)"/>
												</eMedications.12>
											</xsl:for-each>
										</eMedications.MedicationGroup>
									</xsl:for-each>
								</eMedications>
								<eProcedures>
									<xsl:sequence select="(./ns0:eProcedures/@node(), ./ns0:eProcedures/node())"/>
								</eProcedures>
								<xsl:for-each select="ns0:eAirway">
									<eAirway>
										<xsl:for-each select="ns0:eAirway.AirwayGroup">
											<eAirway.AirwayGroup>
												<xsl:for-each select="ns0:eAirway.01">
													<eAirway.01>
														<xsl:sequence select="(./@node(), ./node())"/>
													</eAirway.01>
												</xsl:for-each>
												<xsl:for-each select="ns0:eAirway.ConfirmationGroup">
													<xsl:variable name="var7_ProcedureGroupCorrelationID" as="node()?" select="@ProcedureGroupCorrelationID"/>
													<xsl:variable name="var8_CorrelationID" as="node()?" select="@CorrelationID"/>
													<eAirway.ConfirmationGroup>
														<xsl:if test="fn:exists($var8_CorrelationID)">
															<xsl:attribute name="CorrelationID" namespace="" select="fn:string($var8_CorrelationID)"/>
														</xsl:if>
														<xsl:if test="fn:exists($var7_ProcedureGroupCorrelationID)">
															<xsl:attribute name="ProcedureGroupCorrelationID" namespace="" select="fn:string($var7_ProcedureGroupCorrelationID)"/>
														</xsl:if>
														<xsl:for-each select="ns0:eAirway.02">
															<eAirway.02>
																<xsl:sequence select="(./@node(), ./node())"/>
															</eAirway.02>
														</xsl:for-each>
														<xsl:for-each select="ns0:eAirway.03">
															<eAirway.03>
																<xsl:sequence select="(./@node(), ./node())"/>
															</eAirway.03>
														</xsl:for-each>
														<xsl:for-each select="ns0:eAirway.04">
															<eAirway.04>
																<xsl:sequence select="(./@node(), ./node())"/>
															</eAirway.04>
														</xsl:for-each>
														<xsl:for-each select="ns0:eAirway.05">
															<eAirway.05>
																<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
															</eAirway.05>
														</xsl:for-each>
														<xsl:for-each select="ns0:eAirway.06">
															<eAirway.06>
																<xsl:sequence select="(./@node(), ./node())"/>
															</eAirway.06>
														</xsl:for-each>
														<xsl:for-each select="ns0:eAirway.07">
															<eAirway.07>
																<xsl:sequence select="(./@node(), ./node())"/>
															</eAirway.07>
														</xsl:for-each>
													</eAirway.ConfirmationGroup>
												</xsl:for-each>
												<xsl:for-each select="ns0:eAirway.10">
													<eAirway.10>
														<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
													</eAirway.10>
												</xsl:for-each>
												<xsl:for-each select="ns0:eAirway.11">
													<eAirway.11>
														<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
													</eAirway.11>
												</xsl:for-each>
											</eAirway.AirwayGroup>
										</xsl:for-each>
									</eAirway>
								</xsl:for-each>
								<xsl:for-each select="ns0:eDevice">
									<eDevice>
										<xsl:sequence select="(./@node(), ./node())"/>
									</eDevice>
								</xsl:for-each>
								<eDisposition>
									<xsl:call-template name="tbf:tbf8_eDisposition">
										<xsl:with-param name="input" select="ns0:eDisposition" as="node()"/>
									</xsl:call-template>
								</eDisposition>
								<eOutcome>
									<xsl:sequence select="(./ns0:eOutcome/@node(), ./ns0:eOutcome/node())"/>
								</eOutcome>
								<xsl:for-each select="ns0:eCustomResults">
									<eCustomResults>
										<xsl:sequence select="(./@node(), ./node())"/>
									</eCustomResults>
								</xsl:for-each>
								<eOther>
									<xsl:sequence select="(./ns0:eOther/@node(), ./ns0:eOther/node())"/>
								</eOther>
							</PatientCareReport>
						</xsl:for-each>
					</Header>
				</xsl:for-each>
			</xsl:for-each>
		</EMSDataSet>
	</xsl:template>
</xsl:stylesheet>
