import type { Prisma } from "@prisma/client";
import type { NTTKey } from "./entities-type";

export interface AggregateArgs {
    User: Prisma.UserAggregateArgs;
    Account: Prisma.AccountAggregateArgs;
    Session: Prisma.SessionAggregateArgs;
    VerificationToken: Prisma.VerificationTokenAggregateArgs;
    Authenticator: Prisma.AuthenticatorAggregateArgs;
    Payment: Prisma.PaymentAggregateArgs;
    Appointment: Prisma.AppointmentAggregateArgs;
    AppointmentType: Prisma.AppointmentTypeAggregateArgs;
    Location: Prisma.LocationAggregateArgs;
    Patient: Prisma.PatientAggregateArgs;
    Provider: Prisma.ProviderAggregateArgs;
    Form: Prisma.FormAggregateArgs;
    FormEncounter: Prisma.FormEncounterAggregateArgs;
    FormResource: Prisma.FormResourceAggregateArgs;
    FormSubmission: Prisma.FormSubmissionAggregateArgs;
    Field: Prisma.FieldAggregateArgs;
    FieldAnswer: Prisma.FieldAnswerAggregateArgs;
    FieldOption: Prisma.FieldOptionAggregateArgs;
    Encounter: Prisma.EncounterAggregateArgs;
    EncounterType: Prisma.EncounterTypeAggregateArgs;
    Obs: Prisma.ObsAggregateArgs;
    Order: Prisma.OrderAggregateArgs;
    OrderFrequency: Prisma.OrderFrequencyAggregateArgs;
    OrderRoute: Prisma.OrderRouteAggregateArgs;
    OrderType: Prisma.OrderTypeAggregateArgs;
    OrderUnit: Prisma.OrderUnitAggregateArgs;
    Concept: Prisma.ConceptAggregateArgs;
    ConceptAnswer: Prisma.ConceptAnswerAggregateArgs;
    ConceptClass: Prisma.ConceptClassAggregateArgs;
    ConceptDatatype: Prisma.ConceptDatatypeAggregateArgs;
    ConceptMap: Prisma.ConceptMapAggregateArgs;
    ConceptName: Prisma.ConceptNameAggregateArgs;
    ConceptNumeric: Prisma.ConceptNumericAggregateArgs;
    ConceptProposal: Prisma.ConceptProposalAggregateArgs;
    ConceptSet: Prisma.ConceptSetAggregateArgs;
    ConceptSource: Prisma.ConceptSourceAggregateArgs;
    ConceptWord: Prisma.ConceptWordAggregateArgs;
    Resource: Prisma.ResourceAggregateArgs;
    BlogPost: Prisma.BlogPostAggregateArgs;
    BlogPostTag: Prisma.BlogPostTagAggregateArgs;
    BlogPostTagArrow: Prisma.BlogPostTagArrowAggregateArgs;
    BlogPostAuthor: Prisma.BlogPostAuthorAggregateArgs;
    SpaceTimeCoordinates: Prisma.SpaceTimeCoordinatesAggregateArgs;
    BudgetEntry: Prisma.BudgetEntryAggregateArgs;
    Service: Prisma.ServiceAggregateArgs;
    Budget: Prisma.BudgetAggregateArgs;
    Report: Prisma.ReportAggregateArgs;
    BudUser: Prisma.BudUserAggregateArgs;
    BudgetBudUser: Prisma.BudgetBudUserAggregateArgs;
    BudEvent: Prisma.BudEventAggregateArgs;
}

export type AggregateArgType<T extends NTTKey> = AggregateArgs[T];
