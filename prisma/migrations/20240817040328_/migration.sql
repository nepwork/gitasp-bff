-- DropForeignKey
ALTER TABLE "payment" DROP CONSTRAINT "payment_payerId_fkey";

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_payerId_fkey" FOREIGN KEY ("payerId") REFERENCES "patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
