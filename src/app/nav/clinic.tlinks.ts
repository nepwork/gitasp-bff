import { faArrowCircleUp, faAsterisk, faCalendarAlt, faClose, faContactBook, faCreditCard, faHeart, faIdBadge, faMedkit, faMinusCircle, faPassport, faPhoneAlt, faPlus, faPlusCircle, faReceipt, faStethoscope, faUserCircle, faUserDoctor, faUserGroup, faUserPen, faUtensils, faWallet } from "@fortawesome/free-solid-svg-icons";
import { SidebarNavItem } from "../constants";

export const sidebarPatientNav: SidebarNavItem[] = [
  {
    title: "Payments",
    href: "/cliniq/payment-list",
    icon: faWallet,
    items: [
      {
        title: "Visits",
        href: "/cliniq/visit-payments",
        icon: faReceipt,
      },
      {
        title: "Individuals",
        href: "/cliniq/indie-pending-payments",
        icon: faIdBadge,
      },
      {
        title: "Hospitals",
        href: "/cliniq/org-pending-payments",
        icon: faArrowCircleUp,
      },
      {
        title: "CSR Discounts",
        href: "/cliniq/special-discount-payments",
        icon: faMinusCircle,
      },
    ],
  },
  {
    title: "Appointments",
    href: "/cliniq/appointment-list",
    icon: faCalendarAlt,
    items: [
      {
        title: "Clinic Visits",
        href: "/cliniq/clinic-appointment-list",
        icon: faCreditCard,
      },
      {
        title: "Home Visits",
        href: "/cliniq/phone-appointment-list",
        icon: faAsterisk,
      },
      {
        title: "Telemed Calls",
        href: "/cliniq/card-limit-list",
        icon: faPhoneAlt,
      },
      {
        title: "Availability",
        href: "/cliniq/card-limit-list",
        icon: faCalendarAlt,
      },
    ],
  },
  {
    title: "Patients",
    href: "/cliniq/patient-list",
    icon: faContactBook,
    items: [
      {
        title: "Accounts",
        href: "/cliniq/patient-list",
        icon: faUserDoctor,
      },
      {
        title: "Patient Details",
        href: "/cliniq/patient-detail-list",
        icon: faUserPen,
      },
      {
        title: "Organizations",
        href: "/cliniq/patient-org-list",
        icon: faUserGroup,
      },
      {
        title: "Memberships",
        href: "/cliniq/user-asset-list",
        icon: faUserCircle,
      },
    ],
  },


  {
    title: "Service Catalogs",
    href: "/cliniq/catalogs",
    icon: faPassport,
    items: [
      {
        title: "Treatments",
        href: "/cliniq/card-issuance-request-list",
        icon: faStethoscope,
      },
      {
        title: "Surgeries",
        href: "/cliniq/card-application-review-list",
        icon: faHeart,
      },
      {
        title: "Therapies",
        href: "/cliniq/card-update-request-list",
        icon: faArrowCircleUp,
      },
      {
        title: "Medications",
        href: "/cliniq/card-closing-request-list",
        icon: faMedkit,
      },
    ],
  },
  {
    title: "Equipments",
    href: "/cliniq/payment-list",
    icon: faUtensils,
    items: [
      {
        title: "Issue Request",
        href: "/cliniq/card-issuance-request-list",
        icon: faPlus,
      },
      {
        title: "Request Review",
        href: "/cliniq/card-application-review-list",
        icon: faPlusCircle,
      },
      {
        title: "Update Request",
        href: "/cliniq/card-update-request-list",
        icon: faArrowCircleUp,
      },
      {
        title: "Closing Request",
        href: "/cliniq/card-closing-request-list",
        icon: faClose,
      },
    ],
  },
];
