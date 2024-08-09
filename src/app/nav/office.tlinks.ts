import { faArrowCircleUp, faAsterisk, faCalendarAlt, faClose, faCreditCard, faIdBadge, faMinusCircle, faPhoneAlt, faPlus, faPlusCircle, faReceipt, faUtensils, faWallet } from "@fortawesome/free-solid-svg-icons";
import { SidebarNavItem } from "../constants";

export const sidebarOfficeNav: SidebarNavItem[] = [
  {
    title: "Travel & Boarding",
    href: "/cliniq/payment-list",
    icon: faWallet,
    items: [
      {
        title: "Before Visits",
        href: "/cliniq/before-visit-payments",
        icon: faReceipt,
      },
      {
        title: "Individual Trips",
        href: "/cliniq/indie-pending-payments",
        icon: faIdBadge,
      },
      {
        title: "Team Trips",
        href: "/cliniq/org-pending-payments",
        icon: faArrowCircleUp,
      },
      {
        title: "Health Camps",
        href: "/cliniq/special-discount-payments",
        icon: faMinusCircle,
      },
    ],
  },
  {
    title: "Meeting Bookings",
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
        title: "Schedules",
        href: "/cliniq/card-limit-list",
        icon: faCalendarAlt,
      },
    ],
  },
  {
    title: "Meal Reservations",
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
