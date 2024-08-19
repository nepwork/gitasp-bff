import { faker } from '@faker-js/faker';
import { Gender, DiscountType, PaymentMethod } from '@prisma/client';
import { prisma } from './db-utils';

export const init = async (cleanupFirst = false) => {

	if (cleanupFirst) {
		await prisma.principal.deleteMany({});
		await prisma.patient.deleteMany({});
		await prisma.patient.deleteMany({});
		await prisma.appointment.deleteMany({});
	}

	const persons = await prisma.principal.createManyAndReturn({
		data: Array(50).fill(1).map(_ => ({
			username: faker.internet.userName(),
			firstName: faker.person.firstName(),
			lastName: faker.person.lastName(),
			phoneNumber: faker.number.int({ min: 9000000000}).toString(10),
			payerType: faker.helpers.objectValue(DiscountType)
		})),
		select: {
			id: true
		}
	});

	const receiverIdList = persons
		.map(p => p.id);

	const patients = await prisma.patient.createManyAndReturn({
		data: Array(50).fill(1).map(_ => ({
			givenName: faker.person.firstName(),
			middleName: faker.person.middleName(),
			familyName: faker.person.lastName(),
			phoneNumber: faker.phone.number(),
			image: faker.image.avatar(),
			streetName: `${faker.location.county()  } ${  faker.helpers.arrayElement(["Street", "Marg", "Tole"])}`,
			city: faker.location.city(),
			areaCode: faker.location.zipCode(),
			email: faker.internet.email(),
			gender: faker.helpers.arrayElement(Object.values(Gender)),
			birthdate: faker.date.birthdate()
		})),
		select: {
			id: true
		}
	})
	

	const payerIdList = patients
		.map(p => p.id);

	await prisma.payment.createMany({
		data: Array(50).fill(1).map(_ => ({
			payerId: faker.helpers.arrayElement(payerIdList),
			receiverId: faker.helpers.arrayElement(receiverIdList),
			reasonForVisit: faker.person.jobDescriptor(),
			totalPayableAmount: faker.number.int({ min: 100, max: 100000}),
			paidAmount: faker.number.int({ min: 100, max: 100000}),
			paymentMethod: faker.helpers.arrayElement(Object.values(PaymentMethod))
		}))
	});	


	await prisma.appointment.createMany({
		data: Array(50).fill(1).map(_ => ({
			date: faker.date.soon({days: 7}),
			startDatetime: faker.date.future({ refDate: new Date()}),
			uuid: faker.string.uuid(),
			endDatetime: faker.date.future({ refDate: new Date().getTime() + 30 * 60 * 1000 }),
			patientId: faker.helpers.arrayElement(patients.map(p => p.id))
		}))})

	await prisma.equipment.createMany({
		data: Array(50).fill(1).map(_ => ({
			name: faker.hacker.noun(),
			price: faker.number.int({ min: 100, max: 100000}),
			count: faker.number.int({ min: 1, max: 240})
		}))
	})

	await prisma.service.createMany({
		data: Array(50).fill(1).map(_ => ({
			name: faker.hacker.noun(),
			price: faker.number.int({ min: 100, max: 100000}),
			description: faker.hacker.phrase()
		}))
	})
};

await init()
