/*
  Warnings:

  - You are about to alter the column `price` on the `equipment` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Integer`.
  - You are about to alter the column `totalPayableAmount` on the `payment` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Integer`.
  - You are about to alter the column `discountApplied` on the `payment` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Integer`.
  - You are about to alter the column `paidAmount` on the `payment` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Integer`.
  - You are about to alter the column `price` on the `service` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Integer`.

*/
-- AlterTable
ALTER TABLE "equipment" ALTER COLUMN "price" SET DATA TYPE INTEGER;

-- AlterTable
ALTER TABLE "payment" ALTER COLUMN "totalPayableAmount" SET DATA TYPE INTEGER,
ALTER COLUMN "discountApplied" SET DEFAULT 0,
ALTER COLUMN "discountApplied" SET DATA TYPE INTEGER,
ALTER COLUMN "paidAmount" SET DATA TYPE INTEGER;

-- AlterTable
ALTER TABLE "service" ALTER COLUMN "price" SET DATA TYPE INTEGER;
