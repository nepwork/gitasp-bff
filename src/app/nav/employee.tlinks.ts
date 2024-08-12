import { faArrowCircleUp, faAsterisk, faClose, faCreditCard, faCreditCardAlt, faListNumeric, faMoneyBillTransfer, faMoneyBillTrendUp, faPlus, faPlusCircle, faPortrait, faUserCircle, faUserGroup, faUserPen } from "@fortawesome/free-solid-svg-icons";
import type { SidebarNavItem } from "../constants";

export const sidebarEmployeeNav: SidebarNavItem[] = [
  {
    title: "User Accounts",
    href: "/cardman/user-list",
    icon: faUserGroup,
    items: [
      {
        title: "Users",
        href: "/cardman/user-list",
        icon: faUserCircle,
        label: "All Users"
      },
      {
        title: "User Profiles",
        href: "/cardman/user-profile-list",
        icon: faPortrait,
      },
      {
        title: "User Groups",
        href: "/cardman/user-group-list",
        icon: faUserCircle,
      },
      {
        title: "User Assets",
        href: "/cardman/user-asset-list",
        icon: faUserPen,
      },
    ],
  },
  {
    title: "Cards & Keys",
    href: "/cardman/card-list",
    icon: faCreditCardAlt,
    items: [
      {
        title: "Cards",
        href: "/cardman/card-list",
        icon: faCreditCard,
      },
      {
        title: "Credit Scores",
        href: "/cardman/card-score-list",
        icon: faListNumeric,
      },
      {
        title: "Prepaid Limits",
        href: "/cardman/card-limit-list",
        icon: faAsterisk,
      },
      {
        title: "Issue Request",
        href: "/cardman/card-issuance-request-list",
        icon: faPlus,
      },
      {
        title: "Request Review",
        href: "/cardman/card-application-review-list",
        icon: faPlusCircle,
      },
      {
        title: "Update Request",
        href: "/cardman/card-update-request-list",
        icon: faArrowCircleUp,
      },
      {
        title: "Closing Request",
        href: "/cardman/card-closing-request-list",
        icon: faClose,
      },
    ],
  },
  {
    title: "Expense Reports",
    href: "/cardman/expense-list",
    icon: faMoneyBillTransfer,
    items: [
      {
        title: "Cards",
        href: "/cardman/expense-list",
        icon: faCreditCard,
      },
      {
        title: "Credit Scores",
        href: "/cardman/expense-score-list",
        icon: faListNumeric,
      },
      {
        title: "Monthly Limits",
        href: "/cardman/expense-limit-list",
        icon: faAsterisk,
      },
      {
        title: "Issue Request",
        href: "/cardman/expense-issuance-request-list",
        icon: faPlus,
      },
      {
        title: "Request Review",
        href: "/cardman/expense-application-review-list",
        icon: faPlusCircle,
      },
      {
        title: "Update Request",
        href: "/cardman/expense-update-request-list",
        icon: faArrowCircleUp,
      },
      {
        title: "Closing Request",
        href: "/cardman/expense-closing-request-list",
        icon: faClose,
      },
    ],
  },
  {
    title: "Budget Proposals",
    href: "/cardman/budget-list",
    icon: faMoneyBillTrendUp,
    items: [
      {
        title: "Cards",
        href: "/cardman/budget-list",
        icon: faCreditCard,
      },
      {
        title: "Credit Scores",
        href: "/cardman/budget-score-list",
        icon: faListNumeric,
      },
      {
        title: "Monthly Limits",
        href: "/cardman/budget-limit-list",
        icon: faAsterisk,
      },
      {
        title: "Issue Request",
        href: "/cardman/budget-issuance-request-list",
        icon: faPlus,
      },
      {
        title: "Request Review",
        href: "/cardman/budget-application-review-list",
        icon: faPlusCircle,
      },
      {
        title: "Update Request",
        href: "/cardman/budget-update-request-list",
        icon: faArrowCircleUp,
      },
      {
        title: "Closing Request",
        href: "/cardman/budget-closing-request-list",
        icon: faClose,
      },
    ],
  },
];
