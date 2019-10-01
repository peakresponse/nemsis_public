CREATE TABLE StateDataSet (
	pk_StateDataSet	INT PRIMARY KEY
,	[sState.01]	VARCHAR(255)
,	[sSoftware.01] VARCHAR(255)
,	[sSoftware.01_NV]	VARCHAR(255)
,	[sSoftware.02]	VARCHAR(255)
,	[sSfotware.02_NV]	VARCHAR(255)
,	[sSoftware.03]	VARCHAR(255)
,	[sSfotware.03_NV]	VARCHAR(255)

)

CREATE TABLE [sElement.01] (
	[pk_sElement.01]	INT PRIMARY KEY,
	[fk_pk_StateDataSet]	INT FOREIGN KEY REFERENCES	[StateDataSet]([pk_StateDataSet])
,	[sElement.01] VARCHAR(255)
,	[sElement.01_NV]	VARCHAR(255)
)

CREATE TABLE [sConfiguration.01] (
	[pk_sConfiguration.01]	INT PRIMARY KEY,
	[fk_pk_StateDataSet]	INT FOREIGN KEY REFERENCES	[StateDataSet]([pk_StateDataSet])
,	[sConfiguration.01] VARCHAR(255)
,	[sConfiguration.01_NV]	VARCHAR(255)
)

CREATE TABLE [sConfiguration.ProcedureGroup] (
	[pk_sConfiguration.ProcedureGroup]	INT PRIMARY KEY,
	[fk_pk_StateDataSet]	INT FOREIGN KEY REFERENCES	[StateDataSet]([pk_StateDataSet])
,	[sConfiguration.02] VARCHAR(255)
,	[sConfiguration.02_NV]	VARCHAR(255)
)

CREATE TABLE [sConfiguration.03] (
	[pk_sConfiguration.03]	INT PRIMARY KEY,
	[fk_pk_sConfiguration.ProcedureGroup]	INT FOREIGN KEY REFERENCES [sConfiguration.ProcedureGroup]([pk_sConfiguration.ProcedureGroup])
,	[sConfiguration.03]	VARCHAR(255)
,	[sConfiguration.03_NV]	VARCHAR(255)
)

CREATE TABLE [sConfiguration.MedicationGroup] (
	[pk_sConfiguration.MedicationGroup]	INT PRIMARY KEY,
	[fk_pk_StateDataSet]	INT FOREIGN KEY REFERENCES	[StateDataSet]([pk_StateDataSet])
,	[sConfiguration.04] VARCHAR(255)
,	[sConfiguration.04_NV]	VARCHAR(255)
)

CREATE TABLE [sConfiguration.05] (
	[pk_sConfiguration.05]	INT PRIMARY KEY,
	[fk_pk_sConfiguration.MedicationGroup]	INT FOREIGN KEY REFERENCES [sConfiguration.MedicationGroup]([pk_sConfiguration.MedicationGroup])
,	[sConfiguration.05]	VARCHAR(255)
,	[sConfiguration.05_NV]	VARCHAR(255)
,	[sConfiguration.05_CodeType]	VARCHAR(255)
)

CREATE TABLE [sConfiguration.06] (
	[pk_sConfiguration.06]	INT	PRIMARY KEY,
	[fk_pk_StateDataSet]	INT FOREIGN KEY REFERENCES	[StateDataSet]([pk_StateDataSet])
,	[sConfiguration.06]	VARCHAR(255)
,	[sConfiguration.06_NV]	VARCHAR(255)
)

CREATE TABLE [sAgencyGroup] (
	[pk_sAgencyGroup]	INT PRIMARY KEY,
	[fk_pk_StateDataSet]	INT FOREIGN KEY REFERENCES [StateDataSet]([pk_StateDataSet])
,	[sAgency.01]	VARCHAR(255)
,	[sAgency.01_NV]	VARCHAR(255)
,	[sAgency.02]	VARCHAR(255)
,	[sAgency.02_NV]	VARCHAR(255)
,	[sAgency.03]	VARCHAR(255)
)

CREATE TABLE [sFacilityGroup] (
	[pk_sFacilityGroup]	INT PRIMARY KEY,
	[fk_pk_StateDataSet]	INT FOREIGN KEY REFERENCES [StateDataSet]([pk_StateDataSet])
,	[sFacility.01]	VARCHAR(255)
,	[sFacility.01_NV]	VARCHAR(255)
)

CREATE TABLE [sFacility.FacilityGroup] (
	[pk_sFacility.FacilityGroup]	INT PRIMARY KEY,
	[fk_pk_sFacilityGroup]	INT FOREIGN KEY REFERENCES [sFacilityGroup]([pk_sFacilityGroup])
,	[sFacility.02]	VARCHAR(255)
,	[sFacility.02_NV]	VARCHAR(255)
,	[sFacility.03]	VARCHAR(255)
,	[sFacility.03_NV]	VARCHAR(255)
,	[sFacility.06]	VARCHAR(255)
,	[sFacility.07]	VARCHAR(255)
,	[sFacility.07_StreetAddress2]	VARCHAR(255)
,	[sFacility.08]	VARCHAR(255)
,	[sFacility.09]	VARCHAR(255)
,	[sFacility.09_NV]	VARCHAR(255)
,	[sFacility.10]	VARCHAR(255)
,	[sFacility.10_NV]	VARCHAR(255)
,	[sFacility.11]	VARCHAR(255)
,	[sFacility.11_NV]	VARCHAR(255)
,	[sFacility.12]	VARCHAR(255)
,	[sFacility.13]	VARCHAR(255)
,	[sFacility.14]	VARCHAR(255)
)

CREATE TABLE [sFacility.04] (
	[pk_sFacility.04]	INT PRIMARY KEY,
	[fk_pk_sFacility.FacilityGroup]	INT FOREIGN KEY REFERENCES [sFacility.FacilityGroup]([pk_sFacility.FacilityGroup])
,	[sFacility.04]	VARCHAR(255)
,	[sFacility.04_NV]	VARCHAR(255)
)

CREATE TABLE [sFacility.05] (
	[pk_sFacility.05]	INT PRIMARY KEY,
	[fk_pk_sFacility.FacilityGroup]	INT FOREIGN KEY REFERENCES [sFacility.FacilityGroup]([pk_sFacility.FacilityGroup])
,	[sFacility.05]	VARCHAR(255)
)

CREATE TABLE [sFacility.15] (
	[pk_sFacility.15]	INT PRIMARY KEY,
	[fk_pk_sFacility.FacilityGroup]	INT FOREIGN KEY REFERENCES [sFacility.FacilityGroup]([pk_sFacility.FacilityGroup])
,	[sFacility.15]	VARCHAR(255)
,	[sFacility.15_PhoneNumberType]	VARCHAR(255)
)