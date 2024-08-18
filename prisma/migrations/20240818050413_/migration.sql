/*
  Warnings:

  - The `uuid` column on the `appointment` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "appointment" DROP COLUMN "uuid",
ADD COLUMN     "uuid" UUID NOT NULL DEFAULT gen_random_uuid();

-- CreateIndex
CREATE UNIQUE INDEX "appointment_uuid_key" ON "appointment"("uuid");
