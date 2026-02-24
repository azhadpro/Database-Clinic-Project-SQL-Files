--1
CREATE TABLE Person (
    P_FullName VARCHAR2(100) NOT NULL,
    P_ICNumber VARCHAR2(20) NOT NULL,
    P_Gender VARCHAR2(10) NOT NULL,
    P_DateOfBirth DATE NOT NULL,
    P_Age NUMBER(3) NOT NULL,
    P_PrimaryLanguage VARCHAR2(50),
    P_MaritalStatus VARCHAR2(15) NOT NULL,
    P_Nationality VARCHAR2(50),
    P_Race VARCHAR2(50),
    PRIMARY KEY (P_FullName, P_ICNumber)
);

--2
CREATE TABLE Doctor (
    Doc_ID VARCHAR2(10) NOT NULL,
    Doc_Owner VARCHAR2(3) NOT NULL,
    Doc_LicenseNumber VARCHAR2(30) NOT NULL,
    Doc_Specialization VARCHAR2(50) NOT NULL,
    Doc_YearsOfExperience INT NOT NULL,
    Doc_Qualification VARCHAR (50) NOT NULL,
    Doc_Status VARCHAR2(20) NOT NULL,
    Doc_Title VARCHAR2(20) NOT NULL,
    Doc_WorkingHours VARCHAR2(50),
    Doc_ShiftType VARCHAR2(20),
    Doc_Institution VARCHAR2(100) NOT NULL,
    P_FullName VARCHAR2(100) NOT NULL, 
    P_ICNumber VARCHAR2(20) NOT NULL,
    PRIMARY KEY (Doc_ID, Doc_Owner,  Doc_LicenseNumber),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber)
   );

--3
CREATE TABLE Supplier (
    Sup_ID VARCHAR2(10) NOT NULL,
    Sup_LicenseNumber VARCHAR2(20) NOT NULL,
    Sup_CompanyName VARCHAR2(100) NOT NULL,
    Sup_ProductRange VARCHAR2(100),
    Sup_CountryOrigin VARCHAR2(50) NOT NULL,
    Sup_WarrantyTerms VARCHAR2(100),
    Sup_DeliveryDate DATE NOT NULL,
    Sup_ContractDuration VARCHAR2(15),
    Sup_Review VARCHAR (255),
    Sup_CompanyType VARCHAR2(30) NOT NULL,
    Doc_ID VARCHAR2 (10) NOT NULL,
    Doc_Owner VARCHAR2(100) NOT NULL,
    Doc_LicenseNumber VARCHAR2(30) NOT NULL,
    PRIMARY KEY (Sup_ID, Sup_LicenseNumber),
    FOREIGN KEY (Doc_ID, Doc_Owner, Doc_LicenseNumber) REFERENCES Doctor (Doc_ID, Doc_Owner, Doc_LicenseNumber)
);

--4
CREATE TABLE Patient (
    Patient_ID VARCHAR2 (10) NOT NULL,
    Patient_InsuranceNumber VARCHAR2(20) NOT NULL,
    Patient_Registered DATE NOT NULL,
    Patient_CurrentMedications VARCHAR2(100),
    Patient_FamilyHistoryNote VARCHAR2(100),
    Patient_TravelHistory VARCHAR2(100),
    Patient_DietaryPreference VARCHAR2(50),
    Patient_BloodType CHAR (3),
    Patient_Allergies VARCHAR2(100),
    Patient_SmokingStatus VARCHAR2(20),
    P_FullName VARCHAR2(100) NOT NULL,
    P_ICNumber VARCHAR2(20) NOT NULL,
    PRIMARY KEY (Patient_ID, Patient_InsuranceNumber),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber)
);

--5
CREATE TABLE Clinic_Branch (
    Clinic_ID CHAR (10) NOT NULL,
    Clinic_RegistrationNumber VARCHAR2(30) NOT NULL,
    Clinic_Address VARCHAR2(255) NOT NULL,
    Clinic_City VARCHAR2(50) NOT NULL,
    Clinic_State VARCHAR2(30) NOT NULL,
    Clinic_Postcode CHAR (5) NOT NULL,
    Clinic_TotalStaff INT NOT NULL,
    Clinic_EstablishedDate DATE NOT NULL,
    Clinic_ServicesOffered VARCHAR2(255),
    Clinic_OperatingHours VARCHAR2(100) NOT NULL,
    PRIMARY KEY (Clinic_ID, Clinic_RegistrationNumber)
    );

--6
CREATE TABLE Contact (
    Cont_ID VARCHAR2(10) NOT NULL,
    Cont_PhoneNumber VARCHAR2(20) NOT NULL,
    Cont_Description VARCHAR2(100),
    Cont_PhoneNumberType VARCHAR2(20),
    Cont_Email VARCHAR2(100),
    Cont_History VARCHAR2(100),
    Cont_PreferredMethod VARCHAR2(20),
    Cont_Emergency VARCHAR2(5) ,
    Cont_Kin VARCHAR2(50),
    Cont_Region VARCHAR2(50),
    Clinic_ID CHAR(10),
    Clinic_RegistrationNumber VARCHAR2(30),
    PRIMARY KEY (Cont_ID, Cont_PhoneNumber),
    FOREIGN KEY (Clinic_ID, Clinic_RegistrationNumber) REFERENCES Clinic_Branch (Clinic_ID, Clinic_RegistrationNumber)
);

--7
CREATE TABLE Nurse (
    Nurse_ID VARCHAR2(10) NOT NULL,
    Nurse_LicenseNumber VARCHAR2(15) NOT NULL,
    Nurse_Position VARCHAR2(30) NOT NULL,
    Nurse_ShiftType VARCHAR2(20) NOT NULL,
    Nurse_RotationPeriod VARCHAR2(20),
    Nurse_JoinedDate DATE NOT NULL,
    Nurse_CPRCertificationStatus VARCHAR2(20) NOT NULL,
    Nurse_UniformCode VARCHAR2(10) NOT NULL,
    Nurse_EducationLevel VARCHAR2(50) NOT NULL,
    Nurse_CareSpecialization VARCHAR2(50),
    P_FullName VARCHAR2(100) NOT NULL,
    P_ICNumber VARCHAR2(20) NOT NULL,
    PRIMARY KEY (Nurse_ID, Nurse_LicenseNumber),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person (P_FullName, P_ICNumber)
);

--8
CREATE TABLE Salary (
    Salary_ID VARCHAR2(10) NOT NULL,
    Salary_AccountNumber VARCHAR2(20) NOT NULL,
    Salary_Monthly DECIMAL(10, 2) NOT NULL,
    Salary_Yearly DECIMAL(10, 2) NOT NULL,
    Salary_BonusAmount DECIMAL(10, 2),
    Salary_TaxDeducted DECIMAL(10, 2) NOT NULL,
    Salary_AttendanceScore INT NOT NULL,
    Salary_LatePenalty DECIMAL(10, 2),
    Salary_PaySlipReference VARCHAR2(30) UNIQUE NOT NULL,
    Salary_Remarks VARCHAR2(100),
    Doc_ID VARCHAR2(10) NOT NULL,
    Doc_Owner VARCHAR2(3) NOT NULL,
    Doc_LicenseNumber VARCHAR2(30) NOT NULL,
    Nurse_ID VARCHAR2(10) NOT NULL,
    Nurse_LicenseNumber VARCHAR2(15) NOT NULL,
    PRIMARY KEY (Salary_ID, Salary_AccountNumber),
    FOREIGN KEY (Nurse_ID, Nurse_LicenseNumber) REFERENCES Nurse(Nurse_ID, Nurse_LicenseNumber),
    FOREIGN KEY (Doc_ID, Doc_Owner , Doc_LicenseNumber) REFERENCES Doctor(Doc_ID, Doc_Owner , Doc_LicenseNumber)
);

--9
CREATE TABLE Work_Schedule (
    Sched_ID VARCHAR2(10) NOT NULL,
    Sched_WorkSlotNumber VARCHAR2(10) NOT NULL,
    Sched_DayAssigned VARCHAR2(10) NOT NULL,
    Sched_TimeSlot VARCHAR2(30) NOT NULL,
    Sched_JobRole VARCHAR2(50) NOT NULL,
    Sched_MaxPatients INT NOT NULL,
    Sched_TaskCategory VARCHAR2(50),
    Sched_BreakDuration INT,
    Sched_SlotDuration INT NOT NULL,
    Sched_Availability VARCHAR2(20) NOT NULL,
    Doc_ID VARCHAR2(10) NOT NULL,
    Doc_Owner VARCHAR2(3) NOT NULL,
    Doc_LicenseNumber VARCHAR2(30) NOT NULL,
    Salary_ID VARCHAR2(10) NOT NULL,
    Salary_AccountNumber VARCHAR2(20) NOT NULL,
    PRIMARY KEY (Sched_ID, Sched_WorkSlotNumber),
    FOREIGN KEY (Doc_ID, Doc_Owner, Doc_LicenseNumber) REFERENCES Doctor (Doc_ID, Doc_Owner, Doc_LicenseNumber),
    FOREIGN KEY (Salary_ID, Salary_AccountNumber) REFERENCES Salary (Salary_ID, Salary_AccountNumber)
);

--10
--ALTER LATER
CREATE TABLE Invoice (
    Invoice_ID VARCHAR2(15) NOT NULL,
    Invoice_IssuedBy VARCHAR2(50) NOT NULL,
    Invoice_DuePeriod VARCHAR2(15) NOT NULL,
    Invoice_TotalCharge DECIMAL(10,2) NOT NULL,
    Invoice_ItemCharge DECIMAL(10,2) NOT NULL,
    Invoice_TaxApplied DECIMAL(5,2) NOT NULL,
    Invoice_LateFee DECIMAL(10,2),
    Invoice_Template VARCHAR2(50),
    Invoice_Currency VARCHAR2(10) NOT NULL,
    Invoice_ClientName VARCHAR2(100) NOT NULL,
    Sup_ID VARCHAR2(10) NOT NULL,
    Sup_LicenseNumber VARCHAR2(20) NOT NULL,
    PRIMARY KEY (Invoice_ID, Invoice_IssuedBy),
    FOREIGN KEY (Sup_ID, Sup_LicenseNumber) REFERENCES Supplier(Sup_ID, Sup_LicenseNumber)
);

--11
CREATE TABLE Medical_Record (
    Record_ID VARCHAR2(10) NOT NULL,
    Record_FileCode VARCHAR2(10) NOT NULL,
    Record_Diagnosis VARCHAR2(100),
    Record_TreatmentHistory VARCHAR2(100),
    Record_LastUpdated DATE NOT NULL,
    Record_LabReference VARCHAR2(30),
    Record_RecoveryPlan VARCHAR2(255),
    Record_ChronicCondition VARCHAR2(5),
    Record_ImagingSummary VARCHAR2(255),
    Record_PhysicalExamNote VARCHAR2(255),
    PRIMARY KEY (Record_ID, Record_FileCode)
    );

--12
--ALTER LATER
CREATE TABLE Consultation (
    Cons_ID VARCHAR2(15) NOT NULL,
    Cons_SessionID VARCHAR2(15) NOT NULL,
    Cons_Diagnosis VARCHAR2(100) NOT NULL,
    Cons_Observations VARCHAR2(100),
    Cons_TreatmentPlan VARCHAR2(100),
    Cons_NextFollowUp DATE,
    Cons_HealthEducationGiven VARCHAR2(100) NOT NULL,
    Cons_StartTime VARCHAR2(10) NOT NULL,
    Cons_EndTime VARCHAR2(10) NOT NULL,
    Cons_Symptom VARCHAR2(100),
    Cons_Fee DECIMAL(8,2) NOT NULL,
    Invoice_ID VARCHAR2(15) NOT NULL,
    Invoice_IssuedBy VARCHAR2(50) NOT NULL,
    Record_ID VARCHAR2(10),
    Record_FileCode VARCHAR2(10),
    PRIMARY KEY (Cons_ID, Cons_SessionID),
    FOREIGN KEY (Invoice_ID, Invoice_IssuedBy) REFERENCES Invoice (Invoice_ID, Invoice_IssuedBy),
    FOREIGN KEY (Record_ID, Record_FileCode) REFERENCES Medical_Record(Record_ID, Record_FileCode)
);

--13
CREATE TABLE Room (
    Room_ID VARCHAR2(10) NOT NULL,
    Room_Number INT NOT NULL,
    Room_AvailabilityStatus VARCHAR2(15) NOT NULL,
    Room_Capacity INT NOT NULL,
    Room_CleaningSchedule VARCHAR2(50),
    Room_Type VARCHAR2(20) NOT NULL,
    Room_Name VARCHAR2(50),
    Room_Size VARCHAR2(10),
    Room_Condition VARCHAR2(20),
    Room_Purpose VARCHAR2(100),
    Cons_ID VARCHAR2(15) NOT NULL,
    Cons_SessionID VARCHAR2(15) NOT NULL,
    Clinic_ID CHAR(10) NOT NULL,
    Clinic_RegistrationNumber VARCHAR2(30) NOT NULL,
    PRIMARY KEY (Room_ID, Room_Number),
    FOREIGN KEY (Cons_ID, Cons_SessionID) REFERENCES Consultation(Cons_ID, Cons_SessionID),
    FOREIGN KEY (Clinic_ID, Clinic_RegistrationNumber) REFERENCES Clinic_Branch(Clinic_ID, Clinic_RegistrationNumber)
);

--14
CREATE TABLE AmbulanceService (
    Serv_ID VARCHAR2(10) NOT NULL,
    Serv_RequestID VARCHAR2(10) NOT NULL,
    Serv_ResponseTime VARCHAR2(10) NOT NULL,
    Serv_Notes VARCHAR2(100),
    Serv_TripDuration VARCHAR2(10) NOT NULL,
    Serv_NurseAssigned VARCHAR2(50),
    Serv_ReturnStatus VARCHAR2(15),
    Serv_SafetyEquipment VARCHAR2(100),
    Serv_Location VARCHAR2(100) NOT NULL,
    Serv_Priority VARCHAR2(10),
    Clinic_ID CHAR(10) NOT NULL,
    Clinic_RegistrationNumber VARCHAR2(30) NOT NULL,
    Patient_ID VARCHAR2(10) NOT NULL,
    Patient_InsuranceNumber VARCHAR2(20) NOT NULL,
    PRIMARY KEY (Serv_ID, Serv_RequestID),
    FOREIGN KEY (Clinic_ID, Clinic_RegistrationNumber) REFERENCES Clinic_Branch(Clinic_ID, Clinic_RegistrationNumber),
    FOREIGN KEY (Patient_ID, Patient_InsuranceNumber) REFERENCES Patient(Patient_ID, Patient_InsuranceNumber)
);

--15
CREATE TABLE Prescription (
    Pres_ID VARCHAR2(10) NOT NULL,
    Pres_FormNumber VARCHAR2(15) NOT NULL,
    Pres_TotalItems INT NOT NULL,
    Pres_Notes VARCHAR2(255),
    Pres_ValidityDuration VARCHAR2(15) NOT NULL,
    Pres_RepeatCount INT NOT NULL,
    Pres_FormulationType VARCHAR2(30) NOT NULL,
    Pres_DispensingInstruction VARCHAR2(100),
    Pres_DosageFrequency VARCHAR2(50) NOT NULL,
    Pres_DigitalSignature VARCHAR2(255),
    Cons_ID VARCHAR2(15) NOT NULL,
    Cons_SessionID VARCHAR2(15) NOT NULL,
    Invoice_ID VARCHAR2(15) NOT NULL,
    Invoice_IssuedBy VARCHAR2(50) NOT NULL,
    PRIMARY KEY (Pres_ID, Pres_FormNumber),
    FOREIGN KEY (Invoice_ID, Invoice_IssuedBy) REFERENCES Invoice(Invoice_ID, Invoice_IssuedBy),
    FOREIGN KEY (Cons_ID, Cons_SessionID) REFERENCES Consultation(Cons_ID, Cons_SessionID)
);

--16
--ALTER LATER
CREATE TABLE Payment (
    Paym_ID VARCHAR2(15) NOT NULL,
    Paym_ReceiptNumber VARCHAR2(20) NOT NULL,
    Paym_AmountReceived DECIMAL(10,2) NOT NULL,
    Paym_PaymentChannel VARCHAR2(30) NOT NULL,
    Paym_ConfirmationTime DATE NOT NULL,
    Paym_TransactionID VARCHAR2(30) UNIQUE,
    Paym_CurrencyUsed VARCHAR2(10) NOT NULL,
    Paym_RefundEligible VARCHAR2(5) NOT NULL,
    Paym_TaxIncluded VARCHAR2(5) NOT NULL,
    Paym_BankReference VARCHAR2(100),
    Sup_ID VARCHAR2(10) NOT NULL,
    Sup_LicenseNumber VARCHAR2(20) NOT NULL,
    PRIMARY KEY (Paym_ID, Paym_ReceiptNumber),
    FOREIGN KEY (Sup_ID, Sup_LicenseNumber) REFERENCES Supplier(Sup_ID, Sup_LicenseNumber)
);

--17
CREATE TABLE Inventory (
    Inv_ID VARCHAR2(15) NOT NULL,
    Inv_SerialTracked VARCHAR2(10) NOT NULL,
    Inv_ItemCategory VARCHAR2(50) NOT NULL,
    Inv_ConditionStatus VARCHAR2(30),
    Inv_ItemOrigin VARCHAR2(20),
    Inv_Handling VARCHAR2(100),
    PRIMARY KEY (Inv_ID, Inv_SerialTracked)
);

--18
CREATE TABLE Medical_Device (
    Dev_ID VARCHAR2(15) NOT NULL,
    Dev_SerialNumber VARCHAR2(30) NOT NULL,
    Dev_Model VARCHAR2(50) NOT NULL,
    Dev_Manufacturer VARCHAR2(50) NOT NULL,
    Dev_PurchaseDate DATE NOT NULL,
    Dev_Warranty VARCHAR2(50),
    Dev_Operation VARCHAR2(100),
    Dev_LastServiceDate DATE,
    Dev_RiskLevel VARCHAR2(10) NOT NULL,
    Dev_SterilizationMethod VARCHAR2(50),
    Dev_Fee DECIMAL(8,2),
    Inv_ID VARCHAR2(15) NOT NULL,
    Inv_SerialTracked VARCHAR2(10) NOT NULL,
    PRIMARY KEY (Dev_ID, Dev_SerialNumber),
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)
);

--19
CREATE TABLE Medication (
    Med_ID VARCHAR2(15) NOT NULL,
    Med_Name VARCHAR2(50) NOT NULL,
    Med_Type VARCHAR2(30) NOT NULL,
    Med_Manufacturer VARCHAR2(50) NOT NULL,
    Med_ExpiryDate DATE NOT NULL,
    Med_Dosage VARCHAR2(50) NOT NULL,
    Med_StockQuantity INT NOT NULL,
    Med_StorageInstructions VARCHAR2(100) NOT NULL,
    Med_Price DECIMAL(10,2) NOT NULL,
    Med_SideEffect VARCHAR2(100),
    Med_Fee DECIMAL(8,2) NOT NULL,
    Pres_ID VARCHAR2(10) NOT NULL,
    Pres_FormNumber VARCHAR2(15) NOT NULL,
    Inv_ID VARCHAR2(15) NOT NULL,
    Inv_SerialTracked VARCHAR2(10) NOT NULL,
    PRIMARY KEY (Med_ID, Med_Name),
    FOREIGN KEY (Pres_ID, Pres_FormNumber) REFERENCES Prescription(Pres_ID, Pres_FormNumber),
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)
);

--20
CREATE TABLE Leave (
    Leave_ID VARCHAR2(15) NOT NULL,
    Leave_ReferenceNumber VARCHAR2(20) NOT NULL,
    Leave_Type VARCHAR2(30) NOT NULL,
    Leave_StartDate DATE NOT NULL,
    Leave_EndDate DATE NOT NULL,
    Leave_Reason VARCHAR2(100),
    Leave_ApprovalStatus VARCHAR2(20) NOT NULL,
    Leave_ApprovedDate DATE,
    Leave_Duration VARCHAR2(20) NOT NULL,
    Leave_SupportingDocument VARCHAR2(100),
    Salary_ID VARCHAR2(10) NOT NULL,
    Salary_AccountNumber VARCHAR2(20) NOT NULL,
    PRIMARY KEY (Leave_ID, Leave_ReferenceNumber),
    FOREIGN KEY (Salary_ID, Salary_AccountNumber) REFERENCES Salary(Salary_ID, Salary_AccountNumber)
    );

--21
CREATE TABLE Appointment (
    App_ID VARCHAR2(15) NOT NULL,
    App_BookingRef VARCHAR2(20) NOT NULL,
    App_DateScheduled DATE NOT NULL,
    App_TimeScheduled VARCHAR2(20) NOT NULL,
    App_Reason VARCHAR2(100),
    App_BookingType VARCHAR2(20) NOT NULL,
    App_WaitingTime INT CHECK (App_WaitingTime >= 0),
    App_QueueNumber INT,
    App_CreatedBy VARCHAR2(50) NOT NULL,
    App_NotesProvided VARCHAR2(100),
    Room_ID VARCHAR2(10) NOT NULL,
    Room_Number INT NOT NULL,
    PRIMARY KEY (App_ID, App_BookingRef),
    FOREIGN KEY (Room_ID, Room_Number) REFERENCES Room(Room_ID, Room_Number)
);

--22
CREATE TABLE Vaccine (
    Vaccine_ID CHAR(10) NOT NULL,
    Vaccine_CertificateNumber VARCHAR2(15) NOT NULL,
    Vaccine_Dose INT NOT NULL,
    Vaccine_BrandName VARCHAR2(50) NOT NULL,
    Vaccine_AdministrationMethod VARCHAR2(30) NOT NULL,
    Vaccine_SideEffect VARCHAR2(100),
    Vaccine_StorageTemperature VARCHAR2(20) NOT NULL,
    Vaccine_ConsentForm VARCHAR2(10) NOT NULL,
    Vaccine_ImmunityDuration VARCHAR2(20),
    Vaccine_BatchCode VARCHAR2(30) NOT NULL,
    Vaccine_Fee DECIMAL(8,2),
    Inv_ID VARCHAR2(15) NOT NULL,
    Inv_SerialTracked VARCHAR2(10) NOT NULL,
    PRIMARY KEY (Vaccine_ID, Vaccine_CertificateNumber),
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)
);

--23
CREATE TABLE Person_Person (
    P1_FullName VARCHAR2(100) NOT NULL,
    P2_FullName VARCHAR2(100) NOT NULL,
    P1_ICNumber VARCHAR(20) NOT NULL,
    P2_ICNumber VARCHAR(20) NOT NULL,
    PRIMARY KEY (P1_FullName, P2_FullName, P1_ICNumber, P2_ICNumber),
    FOREIGN KEY (P1_FullName, P2_FullName) REFERENCES Person(P_FullName),
    FOREIGN KEY (P1_ICNumber, P2_ICNumber) REFERENCES Person(P_ICNumber)
);

--24
CREATE TABLE Person_Invoice (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    Invoice_ID VARCHAR(15) NOT NULL,
    Invoice_IssuedBy VARCHAR(50) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, Invoice_ID, Invoice_IssuedBy),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (Invoice_ID, Invoice_IssuedBy) REFERENCES Invoice(Invoice_ID, Invoice_IssuedBy)
);

--25
CREATE TABLE Person_Payment (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    Paym_ID VARCHAR(15) NOT NULL,
    Paym_ReceiptNumber VARCHAR(20) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, Paym_ID, Paym_ReceiptNumber),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (Paym_ID, Paym_ReceiptNumber) REFERENCES Payment(Paym_ID, Paym_ReceiptNumber)
);

--26
CREATE TABLE Person_Medical_Record (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    Record_ID CHAR(10) NOT NULL,
    Record_FileCode VARCHAR(20) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, Record_ID, Record_FileCode),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (Record_ID, Record_FileCode) REFERENCES Medical_Record(Record_ID, Record_FileCode)
);

--27
CREATE TABLE Person_Room (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    Room_ID VARCHAR(10) NOT NULL,
    Room_Number VARCHAR(10) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, Room_ID, Room_Number),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (Room_ID, Room_Number) REFERENCES Room(Room_ID, Room_Number)
);

--28
CREATE TABLE Person_Inventory (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    Inv_ID VARCHAR(15) NOT NULL,
    Inv_SerialTracked VARCHAR(10) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, Inv_ID, Inv_SerialTracked),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)
);


--29
CREATE TABLE Person_Appointment (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    App_ID VARCHAR(15) NOT NULL,
    App_BookingRef VARCHAR(20) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, App_ID, App_BookingRef),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (App_ID, App_BookingRef) REFERENCES Appointment(App_ID, App_BookingRef)
);

--30
CREATE TABLE Person_Prescription (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    Pres_ID VARCHAR(10) NOT NULL,
    Pres_FormNumber VARCHAR(15) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, Pres_ID, Pres_FormNumber),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (Pres_ID, Pres_FormNumber) REFERENCES Prescription(Pres_ID, Pres_FormNumber)
);

--31
CREATE TABLE Person_Clinic_Branch (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    Clinic_ID CHAR(10) NOT NULL,
    Clinic_RegistrationNumber VARCHAR(30) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, Clinic_ID, Clinic_RegistrationNumber),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (Clinic_ID, Clinic_RegistrationNumber) REFERENCES Clinic_Branch(Clinic_ID, Clinic_RegistrationNumber)
);

--32
CREATE TABLE Person_Consultation (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    Cons_ID VARCHAR(15) NOT NULL,
    Cons_SessionID VARCHAR(15) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, Cons_ID, Cons_SessionID),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (Cons_ID, Cons_SessionID) REFERENCES Consultation(Cons_ID, Cons_SessionID)
);

--33
CREATE TABLE Person_Contact (
    P_FullName VARCHAR(100) NOT NULL,
    P_ICNumber VARCHAR(20) NOT NULL,
    Cont_ID CHAR(10) NOT NULL,
    Cont_PhoneNumber VARCHAR(20) NOT NULL,
    PRIMARY KEY (P_FullName, P_ICNumber, Cont_ID, Cont_PhoneNumber),
    FOREIGN KEY (P_FullName, P_ICNumber) REFERENCES Person(P_FullName, P_ICNumber),
    FOREIGN KEY (Cont_ID, Cont_PhoneNumber) REFERENCES Person(P_FullName, P_ICNumber) -- referencing same Person table
);

--34
CREATE TABLE Ambulance_Service_Nurse (
    Serv_ID VARCHAR(10) NOT NULL,
    Serv_RequestID VARCHAR(10) NOT NULL,
    Nurse_ID CHAR(10) NOT NULL,
    Nurse_LicenseNumber VARCHAR(30) NOT NULL,
    PRIMARY KEY (Serv_ID, Serv_RequestID, Nurse_ID, Nurse_LicenseNumber),
    FOREIGN KEY (Serv_ID, Serv_RequestID) REFERENCES Ambulance_Service(Serv_ID, Serv_RequestID), -- referencing ambulance service
    FOREIGN KEY (Nurse_ID, Nurse_LicenseNumber) REFERENCES Nurse(Nurse_ID, Nurse_LicenseNumber)  -- referencing nurse table
);

--35
CREATE TABLE Ambulance_Service_Medical_Device (
    Serv_ID VARCHAR(10) NOT NULL,
    Serv_RequestID VARCHAR(10) NOT NULL,
    Dev_ID VARCHAR(15) NOT NULL,
    Dev_SerialNumber VARCHAR(30) NOT NULL,
    PRIMARY KEY (Serv_ID, Serv_RequestID, Dev_ID, Dev_SerialNumber),
    FOREIGN KEY (Serv_ID, Serv_RequestID) REFERENCES Ambulance_Service(Serv_ID, Serv_RequestID), -- referencing ambulance service
    FOREIGN KEY (Dev_ID, Dev_SerialNumber) REFERENCES Medical_Device(Dev_ID, Dev_SerialNumber)  -- referencing medical device
);

--36
CREATE TABLE Invoice_Inventory (
    Invoice_ID VARCHAR(15) NOT NULL,
    Invoice_IssuedBy VARCHAR(50) NOT NULL,
    Inv_ID VARCHAR(15) NOT NULL,
    Inv_SerialTracked VARCHAR(10) NOT NULL,
    PRIMARY KEY (Invoice_ID, Invoice_IssuedBy, Inv_ID, Inv_SerialTracked),
    FOREIGN KEY (Invoice_ID, Invoice_IssuedBy) REFERENCES Invoice(Invoice_ID, Invoice_IssuedBy), -- referencing invoice table
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)  -- referencing inventory table
);

--37
CREATE TABLE Inventory_Room (
    Inv_ID VARCHAR(15) NOT NULL,
    Inv_SerialTracked VARCHAR(10) NOT NULL,
    Room_ID VARCHAR(10) NOT NULL,
    Room_Number VARCHAR(10) NOT NULL,
    PRIMARY KEY (Inv_ID, Inv_SerialTracked, Room_ID, Room_Number),
    FOREIGN KEY (Room_ID, Room_Number) REFERENCES Room(Room_ID, Room_Number), -- referencing room table
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)  -- referencing inventory table
);

--38
CREATE TABLE Inventory_Inventory (
    Inv_ID VARCHAR(15) NOT NULL,
    Inv_SerialTracked VARCHAR(10) NOT NULL,
    PRIMARY KEY (Inv_ID, Inv_SerialTracked),
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)
);

--39
CREATE TABLE Inventory_Consultation (
    Inv_ID VARCHAR(15) NOT NULL,
    Inv_SerialTracked VARCHAR(10) NOT NULL,
    Cons_ID VARCHAR(15) NOT NULL,
    Cons_SessionID VARCHAR(15) NOT NULL,
    PRIMARY KEY (Inv_ID, Inv_SerialTracked, Cons_ID, Cons_SessionID),
    FOREIGN KEY (Cons_ID, Cons_SessionID) REFERENCES Consultation(Cons_ID, Cons_SessionID),
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)
);

--40
CREATE TABLE Appointment_Vaccine (
    App_ID VARCHAR(15) NOT NULL,
    App_BookingRef VARCHAR(20) NOT NULL,
    Vaccine_ID CHAR(10) NOT NULL,
    Vaccine_CertificateNumber VARCHAR(30) NOT NULL,
    PRIMARY KEY (App_ID, App_BookingRef, Vaccine_ID, Vaccine_CertificateNumber),
    FOREIGN KEY (Vaccine_ID, Vaccine_CertificateNumber) REFERENCES Vaccine(Vaccine_ID, Vaccine_CertificateNumber),
    FOREIGN KEY (App_ID, App_BookingRef) REFERENCES Appointment(App_ID, App_BookingRef)
);

--41
CREATE TABLE Medical_Record_Inventory (
    Record_ID CHAR(10) NOT NULL,
    Record_FileCode VARCHAR(20) NOT NULL,
    Inv_ID VARCHAR(15) NOT NULL,
    Inv_SerialTracked VARCHAR(10) NOT NULL,
    PRIMARY KEY (Record_ID, Record_FileCode, Inv_ID, Inv_SerialTracked),
    FOREIGN KEY (Record_ID, Record_FileCode) REFERENCES Medical_Record(Record_ID, Record_FileCode),
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)
);

--42
CREATE TABLE Inventory_Payment (
    Inv_ID VARCHAR(15) NOT NULL,
    Inv_SerialTracked VARCHAR(10) NOT NULL,
    Paym_ID VARCHAR(15) NOT NULL,
    Paym_ReceiptNumber VARCHAR(20) NOT NULL,
    PRIMARY KEY (Inv_ID, Inv_SerialTracked, Paym_ID, Paym_ReceiptNumber),
    FOREIGN KEY (Paym_ID, Paym_ReceiptNumber) REFERENCES Payment(Paym_ID, Paym_ReceiptNumber),
    FOREIGN KEY (Inv_ID, Inv_SerialTracked) REFERENCES Inventory(Inv_ID, Inv_SerialTracked)
);

--43
CREATE TABLE Nurse_Work_Schedule (
    Nurse_ID CHAR(10) NOT NULL,
    Nurse_LicenseNumber VARCHAR(30) NOT NULL,
    Sched_ID CHAR(10) NOT NULL,
    Sched_WorkSlotNumber SMALLINT NOT NULL,
    PRIMARY KEY (Nurse_ID, Nurse_LicenseNumber, Sched_ID, Sched_WorkSlotNumber),
    FOREIGN KEY (Nurse_ID, Nurse_LicenseNumber) REFERENCES Nurse(Nurse_ID, Nurse_LicenseNumber),
    FOREIGN KEY (Sched_ID, Sched_WorkSlotNumber) REFERENCES Work_Schedule(Sched_ID, Sched_WorkSlotNumber)
);

--44
CREATE TABLE Nurse_Leave_Day (
    Nurse_ID CHAR(10) NOT NULL,
    Nurse_LicenseNumber VARCHAR(30) NOT NULL,
    Leave_ID VARCHAR(15) NOT NULL,
    Leave_ReferenceNumber VARCHAR(20) NOT NULL,
    PRIMARY KEY (Nurse_ID, Nurse_LicenseNumber, Leave_ID, Leave_ReferenceNumber),
    FOREIGN KEY (Nurse_ID, Nurse_LicenseNumber) REFERENCES Nurse(Nurse_ID, Nurse_LicenseNumber),
    FOREIGN KEY (Leave_ID, Leave_ReferenceNumber) REFERENCES Leave_Day(Leave_ID, Leave_ReferenceNumber)
);

--45
CREATE TABLE Vaccine_Prescription (
    Vaccine_ID CHAR(10) NOT NULL,
    Vaccine_CertificateNumber VARCHAR(30) NOT NULL,
    Pres_ID VARCHAR(10) NOT NULL,
    Pres_FormNumber VARCHAR(15) NOT NULL,
    PRIMARY KEY (Vaccine_ID, Vaccine_CertificateNumber, Pres_ID, Pres_FormNumber),
    FOREIGN KEY (Pres_ID, Pres_FormNumber) REFERENCES Prescription(Pres_ID, Pres_FormNumber),
    FOREIGN KEY (Vaccine_ID, Vaccine_CertificateNumber) REFERENCES Vaccine(Vaccine_ID, Vaccine_CertificateNumber)
);

--46
CREATE TABLE Leave_Day_Doctor (
    Leave_ID VARCHAR(15) NOT NULL,
    Leave_ReferenceNumber VARCHAR(20) NOT NULL,
    Doc_ID CHAR(10) NOT NULL,
    Doc_Owner VARCHAR(100) NOT NULL,
    Doc_LicenseNumber VARCHAR(30) NOT NULL,
    PRIMARY KEY (Leave_ID, Leave_ReferenceNumber, Doc_ID, Doc_Owner, Doc_LicenseNumber),
    FOREIGN KEY (Doc_ID, Doc_Owner, Doc_LicenseNumber) REFERENCES Doctor(Doc_ID, Doc_Owner, Doc_LicenseNumber),
    FOREIGN KEY (Leave_ID, Leave_ReferenceNumber) REFERENCES Leave_Day(Leave_ID, Leave_ReferenceNumber)
);

--47
CREATE TABLE Clinic_Branch_Medical_Record (
    Clinic_ID CHAR(10) NOT NULL,
    Clinic_RegistrationNumber VARCHAR(30) NOT NULL,
    Record_ID CHAR(10) NOT NULL,
    Record_FileCode VARCHAR(20) NOT NULL,
    PRIMARY KEY (Clinic_ID, Clinic_RegistrationNumber, Record_ID, Record_FileCode),
    FOREIGN KEY (Record_ID, Record_FileCode) REFERENCES Medical_Record(Record_ID, Record_FileCode),  -- referencing medical record table
    FOREIGN KEY (Clinic_ID, Clinic_RegistrationNumber) REFERENCES Clinic_Branch(Clinic_ID, Clinic_RegistrationNumber)  -- referencing clinic branch table
);