import { faker } from '@faker-js/faker';
import { DiscountType, PaymentMethod } from '@prisma/client';
import { prisma } from './db-utils';

export const init = async (cleanupFirst = false) => {

	if (cleanupFirst) {
		await prisma.principal.deleteMany({});
		await prisma.patient.deleteMany({});
		await prisma.patient.deleteMany({});
		await prisma.appointment.deleteMany({});
	}

	const persons = await prisma.principal.createManyAndReturn({
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
		.map(p => p.id);

	const patients = await prisma.patient.createManyAndReturn({
		data: Array(50).fill(1).map(_ => ({
			givenName: faker.name.firstName(),
			middleName: faker.name.middleName(),
			familyName: faker.name.lastName(),
			phoneNumber: faker.phone.number(),
			image: faker.image.avatar(),
			streetName: `${faker.random.word()  } ${  faker.helpers.arrayElement(["Street", "Marg", "Tole"])}`,
			city: faker.address.city(),
			areaCode: faker.address.zipCode(),
			email: faker.internet.email(),
			gender: faker.helpers.arrayElement(["Male", "Female", "Other"]),
			birthdate: faker.date.past(80)
		})),
		select: {
			id: true
		}
	})


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


	await prisma.appointment.createMany({
		data: Array(50).fill(1).map(_ => ({
			startDatetime: faker.date.soon(7),
			uuid: faker.datatype.uuid(),
			endDatetime: faker.date.soon(7.1),
			patientId: faker.helpers.arrayElement(patients.map(p => p.id))
		}))})

	await prisma.equipment.createMany({
		data: Array(50).fill(1).map(_ => ({
			name: faker.hacker.noun(),
			price: faker.commerce.price(),
			count: faker.datatype.number({ min: 1, max: 24})
		}))
	})

	await prisma.service.createMany({
		data: Array(50).fill(1).map(_ => ({
			name: faker.hacker.noun(),
			price: faker.commerce.price(),
			description: faker.hacker.phrase()
		}))
	})
};

await init()
