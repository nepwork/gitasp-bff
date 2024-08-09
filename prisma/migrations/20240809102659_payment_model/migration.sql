-- CreateEnum
CREATE TYPE "PayerType" AS ENUM ('FirstTime', 'Returning', 'RegularMember', 'PremiumMember');

-- CreateEnum
CREATE TYPE "PaymentMethod" AS ENUM ('CashAtCounter', 'QRCodeEsewa', 'QRCodeBank', 'CashPartial');

-- CreateTable
CREATE TABLE "Payment" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "patientName" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "paymentMethod" "PaymentMethod" NOT NULL DEFAULT 'CashAtCounter',
    "paymentType" "PayerType" NOT NULL DEFAULT 'Returning',
    "paymentAmount" DECIMAL(65,30) NOT NULL,
    "discountApplied" DECIMAL(65,30) NOT NULL DEFAULT 0.0,
    "remainingAmount" DECIMAL(65,30) NOT NULL,
    "reasonForVisit" TEXT NOT NULL,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);
