import { faArrowCircleUp, faAsterisk, faCalendarAlt, faContactBook, faCreditCard, faHeart, faIdBadge, faMedkit, faMinusCircle, faPassport, faPhoneAlt, faPlus, faReceipt, faStethoscope, faUserCircle, faUserDoctor, faUserGroup, faUserPen, faUtensils, faWallet } from "@fortawesome/free-solid-svg-icons";
import type { SidebarNavItem } from "../constants";

export const sidebarPatientNav: SidebarNavItem[] = [
  {
    title: "Payments",
    href: "/cliniq/payment",
    icon: faWallet,
    items: [
      {
        title: "Visits",
        href: "/cliniq/payment/visit",
        icon: faReceipt,
      },
      {
        title: "Individuals",
        href: "/cliniq/payment/individual",
        icon: faIdBadge,
      },
      {
        title: "Hospitals",
        href: "/cliniq/payment/hospital",
        icon: faArrowCircleUp,
      },
      {
        title: "Discounts",
        href: "/cliniq/payment/discount",
        icon: faMinusCircle,
      },
    ],
  },
  {
    title: "Appointments",
    href: "/cliniq/appointment",
    icon: faCalendarAlt,
    items: [
			{
        title: "Availability",
        href: "/cliniq/appointment/availability",
        icon: faCalendarAlt,
      },
      {
        title: "Clinic Visits",
        href: "/cliniq/appointment/clinic",
        icon: faCreditCard,
      },
      {
        title: "Home Visits",
        href: "/cliniq/appointment/home",
        icon: faAsterisk,
      },
      {
        title: "Telemed Calls",
        href: "/cliniq/appointment/call",
        icon: faPhoneAlt,
      }
    ],
  },
  {
    title: "Patients",
    href: "/cliniq/patient",
    icon: faContactBook,
    items: [
      {
        title: "Accounts",
        href: "/cliniq/patient/account",
        icon: faUserDoctor,
      },
      {
        title: "Patient Records",
        href: "/cliniq/patient/record",
        icon: faUserPen,
      },
      {
        title: "Organizations",
        href: "/cliniq/patient/organization",
        icon: faUserGroup,
      },
      {
        title: "Memberships",
        href: "/cliniq/patient/member",
        icon: faUserCircle,
      },
    ],
  },
  {
    title: "Equipments",
    href: "/cliniq/equipment",
    icon: faUtensils,
    items: [
      {
        title: "Purchase",
        href: "/cliniq/equipment/purchase",
        icon: faPlus,
      },
      {
        title: "Available",
        href: "/cliniq/equipment/available",
        icon: faArrowCircleUp,
      },
      {
        title: "Prepare",
        href: "/cliniq/equipment/prepare",
        icon: faUtensils,
      },
    ],
  },

  {
    title: "Services",
    href: "/cliniq/service/list",
    icon: faPassport,
    items: [
      {
        title: "Treatments",
        href: "/cliniq/service/treatment",
        icon: faStethoscope,
      },
      {
        title: "Surgeries",
        href: "/cliniq/service/surgery",
        icon: faHeart,
      },
      {
        title: "Therapies",
        href: "/cliniq/service/therapy",
        icon: faArrowCircleUp,
      },
      {
        title: "Medications",
        href: "/cliniq/service/medication",
        icon: faMedkit,
      },
    ],
  },

];
