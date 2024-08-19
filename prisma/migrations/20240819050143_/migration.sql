/*
  Warnings:

  - You are about to drop the column `endDatetime` on the `appointment` table. All the data in the column will be lost.
  - You are about to drop the column `startDatetime` on the `appointment` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "appointment" DROP COLUMN "endDatetime",
DROP COLUMN "startDatetime",
ADD COLUMN     "endTime" "time_of_day",
ADD COLUMN     "startTime" "time_of_day";
