/*
  Warnings:

  - You are about to drop the column `category` on the `Service` table. All the data in the column will be lost.
  - You are about to drop the column `metadata` on the `Service` table. All the data in the column will be lost.
  - You are about to drop the column `creator` on the `appointment` table. All the data in the column will be lost.
  - You are about to drop the column `dateCreated` on the `appointment` table. All the data in the column will be lost.
  - You are about to drop the column `lastChangedBy` on the `appointment` table. All the data in the column will be lost.
  - You are about to drop the column `lastChangedDate` on the `appointment` table. All the data in the column will be lost.
  - Added the required column `name` to the `Service` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price` to the `Service` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `appointment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `payment` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "BudgetEntry" DROP CONSTRAINT "BudgetEntry_serviceId_fkey";

-- DropForeignKey
ALTER TABLE "appointment" DROP CONSTRAINT "appointment_appointmentTypeId_fkey";

-- DropForeignKey
ALTER TABLE "appointment" DROP CONSTRAINT "appointment_locationId_fkey";

-- DropForeignKey
ALTER TABLE "appointment" DROP CONSTRAINT "appointment_providerId_fkey";

-- AlterTable
ALTER TABLE "Service" DROP COLUMN "category",
DROP COLUMN "metadata",
ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "price" DECIMAL(65,30) NOT NULL,
ADD COLUMN     "updatedBy" UUID;

-- AlterTable
ALTER TABLE "appointment" DROP COLUMN "creator",
DROP COLUMN "dateCreated",
DROP COLUMN "lastChangedBy",
DROP COLUMN "lastChangedDate",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "updatedBy" UUID,
ALTER COLUMN "appointmentTypeId" DROP NOT NULL,
ALTER COLUMN "locationId" DROP NOT NULL,
ALTER COLUMN "providerId" DROP NOT NULL,
ALTER COLUMN "endDatetime" DROP NOT NULL,
ALTER COLUMN "voided" DROP NOT NULL,
ALTER COLUMN "voidedBy" DROP NOT NULL,
ALTER COLUMN "dateVoided" DROP NOT NULL,
ALTER COLUMN "voidReason" DROP NOT NULL;

-- AlterTable
ALTER TABLE "payment" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "updatedBy" UUID;

-- CreateTable
CREATE TABLE "Equipment" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "price" DECIMAL(65,30) NOT NULL,
    "count" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BudgetService" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "description" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "metadata" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BudgetService_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_appointmentTypeId_fkey" FOREIGN KEY ("appointmentTypeId") REFERENCES "appointment_type"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "location"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "provider"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BudgetEntry" ADD CONSTRAINT "BudgetEntry_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "BudgetService"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
