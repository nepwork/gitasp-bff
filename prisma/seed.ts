import { faker } from '@faker-js/faker';
import { DiscountType, PaymentMethod } from '@prisma/client';
import { prisma } from './db-utils';

export const init = async () => {

	const persons = await prisma.person.createManyAndReturn({
		data: Array(100).fill(1).map(_ => ({
			username: faker.internet.userName(),
			firstName: faker.name.firstName(),
			lastName: faker.name.lastName(),
			phoneNumber: faker.datatype.number({ min: 9000000000}).toString(10),
			payerType: faker.helpers.objectValue(DiscountType)
		})),
		select: {
			id: true
		}
	});

	const payerIdList = persons.slice(0, 50)
		.map(p => p.id);

	const receiverIdList = persons.slice(50)
		.map(p => p.id)


	await prisma.payment.createMany({
		data: Array(50).fill(1).map(_ => ({
			payerId: faker.helpers.arrayElement(payerIdList),
			receiverId: faker.helpers.arrayElement(receiverIdList),
			reasonForVisit: faker.name.jobDescriptor(),
			totalPayableAmount: faker.commerce.price(),
			paidAmount: faker.commerce.price(),
			paymentMethod: faker.helpers.arrayElement(Object.values(PaymentMethod))
		}))
	});
};

await init()
