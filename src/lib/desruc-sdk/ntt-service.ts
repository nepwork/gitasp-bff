import { prisma } from '../../../prisma/db-utils';
import type { NTTKey } from './zen/entities-type';


export const mapper = {
	Principal: prisma.principal,
	Account: prisma.account,
	Session: prisma.session,
	VerificationToken: prisma.verificationToken,
	Authenticator: prisma.authenticator,
	Payment: prisma.payment,
	Appointment: prisma.appointment,
	AppointmentType: prisma.appointmentType,
	Location: prisma.location,
	Patient: prisma.patient,
	Equipment: prisma.equipment,
	Service: prisma.service,
	Provider: prisma.provider,
	Form: prisma.form,
	FormEncounter: prisma.formEncounter,
	FormResource: prisma.formResource,
	FormSubmission: prisma.formSubmission,
	Field: prisma.field,
	FieldAnswer: prisma.fieldAnswer,
	FieldOption: prisma.fieldOption,
	Encounter: prisma.encounter,
	EncounterType: prisma.encounterType,
	Obs: prisma.obs,
	Order: prisma.order,
	OrderFrequency: prisma.orderFrequency,
	OrderRoute: prisma.orderRoute,
	OrderType: prisma.orderType,
	OrderUnit: prisma.orderUnit,
	Concept: prisma.concept,
	ConceptAnswer: prisma.conceptAnswer,
	ConceptClass: prisma.conceptClass,
	ConceptDatatype: prisma.conceptDatatype,
	ConceptMap: prisma.conceptMap,
	ConceptName: prisma.conceptName,
	ConceptNumeric: prisma.conceptNumeric,
	ConceptProposal: prisma.conceptProposal,
	ConceptSet: prisma.conceptSet,
	ConceptSource: prisma.conceptSource,
	ConceptWord: prisma.conceptWord,
	Resource: prisma.resource,
	BlogPost: prisma.blogPost,
	BlogPostTag: prisma.blogPostTag,
	BlogPostTagArrow: prisma.blogPostTagArrow,
	BlogPostAuthor: prisma.blogPostAuthor,
	SpaceTimeCoordinates: prisma.spaceTimeCoordinates,
	BudgetEntry: prisma.budgetEntry,
	BudgetService: prisma.budgetService,
	Budget: prisma.budget,
	Report: prisma.report,
	BudUser: prisma.budUser,
	BudgetBudUser: prisma.budgetBudUser,
	BudEvent: prisma.budEvent,
} as const;

type Delegate = typeof mapper[keyof typeof mapper];


export function getDelegate(key: NTTKey): Delegate | undefined {
	// eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
	const delegate = mapper[key];
	if (!delegate) return undefined;
	// eslint-disable-next-line @typescript-eslint/no-unsafe-return
	return delegate;
}
