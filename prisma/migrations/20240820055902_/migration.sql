-- CreateIndex
CREATE INDEX "patient_givenName_middleName_familyName_phoneNumber_idx" ON "patient"("givenName", "middleName", "familyName", "phoneNumber");
