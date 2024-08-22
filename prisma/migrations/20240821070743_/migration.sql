-- CreateEnum
CREATE TYPE "time_of_day" AS ENUM ('AM_0900', 'AM_0930', 'AM_1000', 'AM_1030', 'AM_1100', 'AM_1130', 'PM_1200', 'PM_1230', 'PM_0100', 'PM_0130', 'PM_0200', 'PM_0230', 'PM_0300', 'PM_0330', 'PM_0400', 'PM_0430', 'PM_0500', 'PM_0530', 'PM_0600');

-- CreateEnum
CREATE TYPE "gender" AS ENUM ('Male', 'Female', 'Other');

-- CreateEnum
CREATE TYPE "country" AS ENUM ('Nepal', 'Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Antigua', 'Argentina', 'Armenia', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bhutan', 'Bolivia', 'Bosnia', 'Botswana', 'Brazil', 'Brunei', 'Bulgaria', 'Burkina', 'Burundi', 'Cote', 'Cabo', 'Cambodia', 'Cameroon', 'Canada', 'Central', 'Chad', 'Chile', 'China', 'Colombia', 'Comoros', 'Congo', 'Costa', 'Croatia', 'Cuba', 'Cyprus', 'Czechia', 'Democratic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican', 'Ecuador', 'Egypt', 'El', 'Equatorial', 'Eritrea', 'Estonia', 'Eswatini', 'Ethiopia', 'Fiji', 'Finland', 'France', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Greece', 'Grenada', 'Guatemala', 'Guinea', 'Guyana', 'Haiti', 'Holy', 'Honduras', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Luxembourg', 'Lithuania', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'MarshallIslands', 'Mauritania', 'Mauritius', 'Mexico', 'Micronesia', 'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nauru', 'Netherlands', 'New_Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'North_Korea', 'North_Macedonia', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Palestine_State', 'Panama', 'Papua_New_Guinea', 'Paraguay', 'Peru', 'Philippines', 'Poland', 'Portugal', 'Qatar', 'Romania', 'Russia', 'Rwanda', 'Saint_Kitts_and_Nevis', 'Saint_Lucia', 'Saint_Vincent_and_the_Grenadines', 'Samoa', 'San_Marino', 'Sao_Tome_and_Principe', 'Saudi_Arabia', 'Senegal', 'Serbia', 'Seychelles', 'Sierra_Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon_Islands', 'Somalia', 'South_Africa', 'South_Korea', 'South_Sudan', 'Spain', 'Sri_Lanka', 'Sudan', 'Suriname', 'Sweden', 'Switzerland', 'Syria', 'Tajikistan', 'Tanzania', 'Thailand', 'Timor_Leste', 'Togo', 'Tonga', 'Trinidad_and_Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Tuvalu', 'Uganda', 'Ukraine', 'United_Arab_Emirates', 'United_Kingdom', 'United_States_of_America', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Venezuela', 'Vietnam', 'Yemen', 'Zambia', 'Zimbabwe');

-- CreateEnum
CREATE TYPE "discount_type" AS ENUM ('FirstTimer', 'RegularMember', 'PremiumMember');

-- CreateEnum
CREATE TYPE "payment_method" AS ENUM ('CashAtCounter', 'CashPartial', 'QrCodeEsewa', 'QrCodeBank');

-- CreateTable
CREATE TABLE "principal" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "username" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT NOT NULL,
    "password" TEXT,
    "phoneCode" INTEGER DEFAULT 977,
    "phoneNumber" TEXT,
    "streetName" TEXT,
    "city" TEXT,
    "areaCode" TEXT,
    "country" "country" NOT NULL DEFAULT 'Nepal',
    "email" TEXT,
    "emailVerified" TIMESTAMP(3),
    "payerType" "discount_type" NOT NULL DEFAULT 'FirstTimer',
    "image" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,

    CONSTRAINT "principal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "account" (
    "userId" UUID NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "account_pkey" PRIMARY KEY ("provider","providerAccountId")
);

-- CreateTable
CREATE TABLE "session" (
    "sessionToken" TEXT NOT NULL,
    "userId" UUID NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "verification_token" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "verification_token_pkey" PRIMARY KEY ("identifier","token")
);

-- CreateTable
CREATE TABLE "authenticator" (
    "credentialID" TEXT NOT NULL,
    "userId" UUID NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "credentialPublicKey" TEXT NOT NULL,
    "counter" INTEGER NOT NULL,
    "credentialDeviceType" TEXT NOT NULL,
    "credentialBackedUp" BOOLEAN NOT NULL,
    "transports" TEXT,

    CONSTRAINT "authenticator_pkey" PRIMARY KEY ("userId","credentialID")
);

-- CreateTable
CREATE TABLE "payment" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "payerId" UUID NOT NULL,
    "receiverId" UUID NOT NULL,
    "paymentMethod" "payment_method" NOT NULL DEFAULT 'CashAtCounter',
    "totalPayableAmount" INTEGER NOT NULL,
    "discountApplied" INTEGER NOT NULL DEFAULT 0,
    "paidAmount" INTEGER NOT NULL,
    "reasonForVisit" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,

    CONSTRAINT "payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "appointment" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "date" TIMESTAMP(3) NOT NULL,
    "startTime" "time_of_day",
    "endTime" "time_of_day",
    "voided" BOOLEAN DEFAULT false,
    "voidedBy" TEXT,
    "dateVoided" TIMESTAMP(3),
    "voidReason" TEXT,
    "appointmentTypeId" UUID,
    "patientId" UUID NOT NULL,
    "locationId" UUID,
    "providerId" UUID,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,

    CONSTRAINT "appointment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "appointment_type" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "appointment_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "location" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "address1" TEXT NOT NULL,
    "address2" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "stateProvince" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "location_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "patient" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "givenName" TEXT NOT NULL,
    "middleName" TEXT NOT NULL,
    "familyName" TEXT NOT NULL,
    "gender" "gender" NOT NULL,
    "birthdate" TIMESTAMP(3),
    "phoneCode" INTEGER DEFAULT 977,
    "phoneNumber" TEXT,
    "image" TEXT,
    "streetName" TEXT,
    "city" TEXT,
    "areaCode" TEXT,
    "country" "country" NOT NULL DEFAULT 'Nepal',
    "email" TEXT,
    "emailVerified" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,

    CONSTRAINT "patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "equipment" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "count" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,

    CONSTRAINT "equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "service" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,

    CONSTRAINT "service_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "provider" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "identifier" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "voided" BOOLEAN NOT NULL DEFAULT false,
    "voidedBy" TEXT NOT NULL,
    "dateVoided" TIMESTAMP(3) NOT NULL,
    "voidReason" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "provider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "form" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "retired" BOOLEAN NOT NULL DEFAULT false,
    "retiredBy" TEXT NOT NULL,
    "dateRetired" TIMESTAMP(3) NOT NULL,
    "retiredReason" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,
    "fieldId" UUID,

    CONSTRAINT "form_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "form_encounter" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "formId" UUID NOT NULL,
    "encounterId" UUID NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "form_encounter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "form_resource" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "formId" UUID NOT NULL,
    "resourceId" UUID NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "form_resource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "form_submission" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "formId" UUID NOT NULL,
    "encounterId" UUID NOT NULL,
    "submissionDate" TIMESTAMP(3) NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "form_submission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "field" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "fieldType" TEXT NOT NULL,
    "conceptId" UUID NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "field_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "field_answer" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "formSubmissionId" UUID NOT NULL,
    "fieldId" UUID NOT NULL,
    "value" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "field_answer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "field_option" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "fieldId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "field_option_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "encounter" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "encounterTypeId" UUID NOT NULL,
    "patientId" UUID NOT NULL,
    "locationId" UUID NOT NULL,
    "formId" UUID NOT NULL,
    "providerId" UUID NOT NULL,
    "startDatetime" TIMESTAMP(3) NOT NULL,
    "endDatetime" TIMESTAMP(3) NOT NULL,
    "voided" BOOLEAN NOT NULL DEFAULT false,
    "voidedBy" TEXT NOT NULL,
    "dateVoided" TIMESTAMP(3) NOT NULL,
    "voidReason" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "encounter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "encounter_type" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "encounter_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "obs" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "conceptId" UUID NOT NULL,
    "encounterId" UUID NOT NULL,
    "obsDatetime" TIMESTAMP(3) NOT NULL,
    "valueDatetime" TIMESTAMP(3) NOT NULL,
    "valueNumeric" DOUBLE PRECISION NOT NULL,
    "valueText" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "obs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "conceptId" UUID NOT NULL,
    "encounterId" UUID NOT NULL,
    "orderDatetime" TIMESTAMP(3) NOT NULL,
    "instructions" TEXT NOT NULL,
    "dosage" TEXT NOT NULL,
    "route" TEXT NOT NULL,
    "frequency" TEXT NOT NULL,
    "asNeeded" BOOLEAN NOT NULL DEFAULT false,
    "prn" BOOLEAN NOT NULL DEFAULT false,
    "quantity" INTEGER NOT NULL,
    "units" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,
    "orderFrequencyId" UUID,
    "orderRouteId" UUID,
    "orderTypeId" UUID,
    "orderUnitId" UUID,

    CONSTRAINT "order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order_frequency" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "order_frequency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order_route" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "order_route_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order_type" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "order_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order_unit" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "order_unit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "dataType" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "isRetired" BOOLEAN NOT NULL DEFAULT false,
    "retiredBy" TEXT NOT NULL,
    "dateRetired" TIMESTAMP(3) NOT NULL,
    "retiredReason" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,
    "conceptClassId" UUID,
    "conceptDatatypeId" UUID,
    "conceptMapId" UUID,
    "conceptSetId" UUID,
    "conceptSourceId" UUID,

    CONSTRAINT "concept_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_answer" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "conceptId" UUID NOT NULL,
    "answerConceptId" UUID NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_answer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_class" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_class_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_data_type" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_data_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_map" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_map_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_name" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "conceptId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "locale" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_name_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_numeric" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "conceptId" UUID NOT NULL,
    "hiAbsolute" DOUBLE PRECISION NOT NULL,
    "hiCritical" DOUBLE PRECISION NOT NULL,
    "hiNormal" DOUBLE PRECISION NOT NULL,
    "lowAbsolute" DOUBLE PRECISION NOT NULL,
    "lowCritical" DOUBLE PRECISION NOT NULL,
    "lowNormal" DOUBLE PRECISION NOT NULL,
    "units" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_numeric_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_proposal" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "conceptId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_proposal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_set" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_set_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_source" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_source_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "concept_word" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "conceptId" UUID NOT NULL,
    "word" TEXT NOT NULL,
    "locale" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "concept_word_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "resource" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "creator" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL,
    "lastChangedBy" TEXT NOT NULL,
    "lastChangedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "resource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blog_post" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "context" JSONB NOT NULL,
    "authorId" UUID NOT NULL,
    "spaceTimeCoordinatesId" UUID NOT NULL,

    CONSTRAINT "blog_post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blog_post_tag" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "descriptor" TEXT,

    CONSTRAINT "blog_post_tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blog_post_tag_arrow" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "postId" UUID NOT NULL,
    "tagId" UUID NOT NULL,

    CONSTRAINT "blog_post_tag_arrow_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blog_post_author" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,

    CONSTRAINT "blog_post_author_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "space_time_coordinates" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "startTime" DOUBLE PRECISION NOT NULL,
    "pauseTime" DOUBLE PRECISION,
    "stopTime" DOUBLE PRECISION NOT NULL,
    "timezone" TEXT NOT NULL,
    "blogPostId" UUID NOT NULL,

    CONSTRAINT "space_time_coordinates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "budget_entry" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "serviceId" UUID NOT NULL,
    "cost" DOUBLE PRECISION NOT NULL,
    "discount" DOUBLE PRECISION NOT NULL,
    "promotion" DOUBLE PRECISION NOT NULL,
    "subtotal" DOUBLE PRECISION NOT NULL,
    "percentChange" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "budgetId" UUID NOT NULL,

    CONSTRAINT "budget_entry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "budget_service" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "description" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "metadata" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "budget_service_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "budget" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "fiscalYear" INTEGER NOT NULL,
    "reportId" UUID,

    CONSTRAINT "budget_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "report" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "budgetId" UUID NOT NULL,
    "totalCost" DOUBLE PRECISION NOT NULL,
    "totalDiscount" DOUBLE PRECISION NOT NULL,
    "totalPromotion" DOUBLE PRECISION NOT NULL,
    "totalSubtotal" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "report_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bud_user" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "bud_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "budget_bud_user" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "userId" UUID NOT NULL,
    "budgetId" UUID NOT NULL,
    "role" TEXT NOT NULL,
    "ability" TEXT NOT NULL,
    "category" TEXT NOT NULL,

    CONSTRAINT "budget_bud_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bud_event" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "type" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "categoryList" TEXT[],
    "metadata" JSONB NOT NULL,
    "budUserId" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "bud_event_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "principal_username_key" ON "principal"("username");

-- CreateIndex
CREATE UNIQUE INDEX "principal_email_key" ON "principal"("email");

-- CreateIndex
CREATE INDEX "principal_firstName_lastName_phoneNumber_idx" ON "principal"("firstName", "lastName", "phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "session_sessionToken_key" ON "session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "authenticator_credentialID_key" ON "authenticator"("credentialID");

-- CreateIndex
CREATE UNIQUE INDEX "appointment_uuid_key" ON "appointment"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "appointment_patientId_locationId_providerId_key" ON "appointment"("patientId", "locationId", "providerId");

-- CreateIndex
CREATE UNIQUE INDEX "appointment_type_uuid_key" ON "appointment_type"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "location_uuid_key" ON "location"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "patient_uuid_key" ON "patient"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "patient_email_key" ON "patient"("email");

-- CreateIndex
CREATE INDEX "patient_givenName_middleName_familyName_phoneNumber_idx" ON "patient"("givenName", "middleName", "familyName", "phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "provider_uuid_key" ON "provider"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "form_uuid_key" ON "form"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "form_encounter_uuid_key" ON "form_encounter"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "form_resource_uuid_key" ON "form_resource"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "form_submission_uuid_key" ON "form_submission"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "field_uuid_key" ON "field"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "field_answer_uuid_key" ON "field_answer"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "field_option_uuid_key" ON "field_option"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "encounter_uuid_key" ON "encounter"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "encounter_type_uuid_key" ON "encounter_type"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "obs_uuid_key" ON "obs"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "order_uuid_key" ON "order"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "order_frequency_uuid_key" ON "order_frequency"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "order_route_uuid_key" ON "order_route"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "order_type_uuid_key" ON "order_type"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "order_unit_uuid_key" ON "order_unit"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_uuid_key" ON "concept"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_answer_uuid_key" ON "concept_answer"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_class_uuid_key" ON "concept_class"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_data_type_uuid_key" ON "concept_data_type"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_map_uuid_key" ON "concept_map"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_name_uuid_key" ON "concept_name"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_numeric_uuid_key" ON "concept_numeric"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_proposal_uuid_key" ON "concept_proposal"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_set_uuid_key" ON "concept_set"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_source_uuid_key" ON "concept_source"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "concept_word_uuid_key" ON "concept_word"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "resource_uuid_key" ON "resource"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "blog_post_spaceTimeCoordinatesId_key" ON "blog_post"("spaceTimeCoordinatesId");

-- CreateIndex
CREATE UNIQUE INDEX "blog_post_tag_arrow_postId_tagId_key" ON "blog_post_tag_arrow"("postId", "tagId");

-- CreateIndex
CREATE UNIQUE INDEX "report_budgetId_key" ON "report"("budgetId");

-- CreateIndex
CREATE UNIQUE INDEX "bud_user_email_key" ON "bud_user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "budget_bud_user_userId_budgetId_key" ON "budget_bud_user"("userId", "budgetId");

-- AddForeignKey
ALTER TABLE "principal" ADD CONSTRAINT "principal_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "principal" ADD CONSTRAINT "principal_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "principal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "principal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "authenticator" ADD CONSTRAINT "authenticator_userId_fkey" FOREIGN KEY ("userId") REFERENCES "principal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_payerId_fkey" FOREIGN KEY ("payerId") REFERENCES "patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_receiverId_fkey" FOREIGN KEY ("receiverId") REFERENCES "principal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_appointmentTypeId_fkey" FOREIGN KEY ("appointmentTypeId") REFERENCES "appointment_type"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "location"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "provider"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "patient" ADD CONSTRAINT "patient_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "patient" ADD CONSTRAINT "patient_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "service" ADD CONSTRAINT "service_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "service" ADD CONSTRAINT "service_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "principal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "form" ADD CONSTRAINT "form_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "field"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "form_encounter" ADD CONSTRAINT "form_encounter_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "form_encounter" ADD CONSTRAINT "form_encounter_formId_fkey" FOREIGN KEY ("formId") REFERENCES "form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "form_resource" ADD CONSTRAINT "form_resource_formId_fkey" FOREIGN KEY ("formId") REFERENCES "form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "form_resource" ADD CONSTRAINT "form_resource_resourceId_fkey" FOREIGN KEY ("resourceId") REFERENCES "resource"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "form_submission" ADD CONSTRAINT "form_submission_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "form_submission" ADD CONSTRAINT "form_submission_formId_fkey" FOREIGN KEY ("formId") REFERENCES "form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field" ADD CONSTRAINT "field_conceptId_fkey" FOREIGN KEY ("conceptId") REFERENCES "concept"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field_answer" ADD CONSTRAINT "field_answer_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "field"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field_answer" ADD CONSTRAINT "field_answer_formSubmissionId_fkey" FOREIGN KEY ("formSubmissionId") REFERENCES "form_submission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field_option" ADD CONSTRAINT "field_option_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "field"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encounter" ADD CONSTRAINT "encounter_encounterTypeId_fkey" FOREIGN KEY ("encounterTypeId") REFERENCES "encounter_type"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encounter" ADD CONSTRAINT "encounter_formId_fkey" FOREIGN KEY ("formId") REFERENCES "form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encounter" ADD CONSTRAINT "encounter_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "location"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encounter" ADD CONSTRAINT "encounter_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encounter" ADD CONSTRAINT "encounter_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "provider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "obs" ADD CONSTRAINT "obs_conceptId_fkey" FOREIGN KEY ("conceptId") REFERENCES "concept"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "obs" ADD CONSTRAINT "obs_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_conceptId_fkey" FOREIGN KEY ("conceptId") REFERENCES "concept"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_orderFrequencyId_fkey" FOREIGN KEY ("orderFrequencyId") REFERENCES "order_frequency"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_orderRouteId_fkey" FOREIGN KEY ("orderRouteId") REFERENCES "order_route"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_orderTypeId_fkey" FOREIGN KEY ("orderTypeId") REFERENCES "order_type"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_orderUnitId_fkey" FOREIGN KEY ("orderUnitId") REFERENCES "order_unit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept" ADD CONSTRAINT "concept_conceptClassId_fkey" FOREIGN KEY ("conceptClassId") REFERENCES "concept_class"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept" ADD CONSTRAINT "concept_conceptDatatypeId_fkey" FOREIGN KEY ("conceptDatatypeId") REFERENCES "concept_data_type"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept" ADD CONSTRAINT "concept_conceptMapId_fkey" FOREIGN KEY ("conceptMapId") REFERENCES "concept_map"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept" ADD CONSTRAINT "concept_conceptSetId_fkey" FOREIGN KEY ("conceptSetId") REFERENCES "concept_set"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept" ADD CONSTRAINT "concept_conceptSourceId_fkey" FOREIGN KEY ("conceptSourceId") REFERENCES "concept_source"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept_answer" ADD CONSTRAINT "concept_answer_answerConceptId_fkey" FOREIGN KEY ("answerConceptId") REFERENCES "concept"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept_answer" ADD CONSTRAINT "concept_answer_conceptId_fkey" FOREIGN KEY ("conceptId") REFERENCES "concept"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept_name" ADD CONSTRAINT "concept_name_conceptId_fkey" FOREIGN KEY ("conceptId") REFERENCES "concept"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept_numeric" ADD CONSTRAINT "concept_numeric_conceptId_fkey" FOREIGN KEY ("conceptId") REFERENCES "concept"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept_proposal" ADD CONSTRAINT "concept_proposal_conceptId_fkey" FOREIGN KEY ("conceptId") REFERENCES "concept"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "concept_word" ADD CONSTRAINT "concept_word_conceptId_fkey" FOREIGN KEY ("conceptId") REFERENCES "concept"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog_post" ADD CONSTRAINT "blog_post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "blog_post_author"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog_post" ADD CONSTRAINT "blog_post_spaceTimeCoordinatesId_fkey" FOREIGN KEY ("spaceTimeCoordinatesId") REFERENCES "space_time_coordinates"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog_post_tag_arrow" ADD CONSTRAINT "blog_post_tag_arrow_postId_fkey" FOREIGN KEY ("postId") REFERENCES "blog_post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog_post_tag_arrow" ADD CONSTRAINT "blog_post_tag_arrow_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "blog_post_tag"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_entry" ADD CONSTRAINT "budget_entry_budgetId_fkey" FOREIGN KEY ("budgetId") REFERENCES "budget"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_entry" ADD CONSTRAINT "budget_entry_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "budget_service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "report" ADD CONSTRAINT "report_budgetId_fkey" FOREIGN KEY ("budgetId") REFERENCES "budget"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_bud_user" ADD CONSTRAINT "budget_bud_user_budgetId_fkey" FOREIGN KEY ("budgetId") REFERENCES "budget"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_bud_user" ADD CONSTRAINT "budget_bud_user_userId_fkey" FOREIGN KEY ("userId") REFERENCES "bud_user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bud_event" ADD CONSTRAINT "bud_event_budUserId_fkey" FOREIGN KEY ("budUserId") REFERENCES "bud_user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
