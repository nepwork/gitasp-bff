/*
  Warnings:

  - Added the required column `date` to the `appointment` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "appointment" ADD COLUMN     "date" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "startDatetime" DROP NOT NULL;
