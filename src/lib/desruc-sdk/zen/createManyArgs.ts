import type { Prisma } from "@prisma/client";
import type { NTTKey } from "./entities-type";

export interface CreateManyArgs {
    Principal: Prisma.PrincipalCreateManyArgs;
    Account: Prisma.AccountCreateManyArgs;
    Session: Prisma.SessionCreateManyArgs;
    VerificationToken: Prisma.VerificationTokenCreateManyArgs;
    Authenticator: Prisma.AuthenticatorCreateManyArgs;
    Payment: Prisma.PaymentCreateManyArgs;
    Appointment: Prisma.AppointmentCreateManyArgs;
    AppointmentType: Prisma.AppointmentTypeCreateManyArgs;
    Location: Prisma.LocationCreateManyArgs;
    Patient: Prisma.PatientCreateManyArgs;
    Equipment: Prisma.EquipmentCreateManyArgs;
    Service: Prisma.ServiceCreateManyArgs;
    Provider: Prisma.ProviderCreateManyArgs;
    Form: Prisma.FormCreateManyArgs;
    FormEncounter: Prisma.FormEncounterCreateManyArgs;
    FormResource: Prisma.FormResourceCreateManyArgs;
    FormSubmission: Prisma.FormSubmissionCreateManyArgs;
    Field: Prisma.FieldCreateManyArgs;
    FieldAnswer: Prisma.FieldAnswerCreateManyArgs;
    FieldOption: Prisma.FieldOptionCreateManyArgs;
    Encounter: Prisma.EncounterCreateManyArgs;
    EncounterType: Prisma.EncounterTypeCreateManyArgs;
    Obs: Prisma.ObsCreateManyArgs;
    Order: Prisma.OrderCreateManyArgs;
    OrderFrequency: Prisma.OrderFrequencyCreateManyArgs;
    OrderRoute: Prisma.OrderRouteCreateManyArgs;
    OrderType: Prisma.OrderTypeCreateManyArgs;
    OrderUnit: Prisma.OrderUnitCreateManyArgs;
    Concept: Prisma.ConceptCreateManyArgs;
    ConceptAnswer: Prisma.ConceptAnswerCreateManyArgs;
    ConceptClass: Prisma.ConceptClassCreateManyArgs;
    ConceptDatatype: Prisma.ConceptDatatypeCreateManyArgs;
    ConceptMap: Prisma.ConceptMapCreateManyArgs;
    ConceptName: Prisma.ConceptNameCreateManyArgs;
    ConceptNumeric: Prisma.ConceptNumericCreateManyArgs;
    ConceptProposal: Prisma.ConceptProposalCreateManyArgs;
    ConceptSet: Prisma.ConceptSetCreateManyArgs;
    ConceptSource: Prisma.ConceptSourceCreateManyArgs;
    ConceptWord: Prisma.ConceptWordCreateManyArgs;
    Resource: Prisma.ResourceCreateManyArgs;
    BlogPost: Prisma.BlogPostCreateManyArgs;
    BlogPostTag: Prisma.BlogPostTagCreateManyArgs;
    BlogPostTagArrow: Prisma.BlogPostTagArrowCreateManyArgs;
    BlogPostAuthor: Prisma.BlogPostAuthorCreateManyArgs;
    SpaceTimeCoordinates: Prisma.SpaceTimeCoordinatesCreateManyArgs;
    BudgetEntry: Prisma.BudgetEntryCreateManyArgs;
    BudgetService: Prisma.BudgetServiceCreateManyArgs;
    Budget: Prisma.BudgetCreateManyArgs;
    Report: Prisma.ReportCreateManyArgs;
    BudUser: Prisma.BudUserCreateManyArgs;
    BudgetBudUser: Prisma.BudgetBudUserCreateManyArgs;
    BudEvent: Prisma.BudEventCreateManyArgs;
}

export type CreateManyArgType<T extends NTTKey> = CreateManyArgs[T];
