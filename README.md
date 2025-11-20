#  My Pocket Wallet  
*A Flutter + Firebase Mobile Banking Application*

My Pocket Wallet is a modern mobile banking application built with **Flutter** and **Firebase Authentication**.  
It provides secure login, smooth navigation, clean UI components, and essential wallet functionalities such as transfers, withdrawals, mobile recharge, and card management.

---

##  Features

###  Authentication
- Login & Register with **Firebase Auth**
- Error handling and styled input fields
- Secure session management

### Home Screen
- Personalized greeting
- Wallet overview card
- Interactive grid menu (Transfer, Withdraw, Recharge, Cards)

###  Account & Cards
- View card details
- Add a new card with validation
- Real-time form feedback

###  Transactions

#### Withdraw Money
- Dropdown selection
- Full form validation
- Successful action feedback

#### Mobile Recharge
- Search and pick contact/recipient
- Recharge confirmation

#### Transfer Funds
- Enter amount and confirm details
- Smooth navigation
- Success screen with icon + buttons

---

## UI & Design Principles

- **Primary Color:** Deep Blue `#001F3F`  
- **Accent Color:** OrangeAccent  
- Rounded corners, shadows & smooth gradients  
- Reusable widgets for text fields, buttons, tiles  
- Animations using:
  - `AnimatedContainer`
  - `AnimatedOpacity`
- Clean and consistent user experience across screens

---

## Form Validation & User Feedback

- Uses `Form` + `GlobalKey<FormState>`
- Empty field & formatting validation
- `SnackBar` for user feedback
- Proper clearing of fields on success

---

##  Tech Stack

| Technology | Purpose |
|-----------|----------|
| **Flutter** | Frontend UI & app logic |
| **Dart** | Programming language |
| **Firebase Authentication** | User login & registration |
| **Navigator API** | Screen transitions |
| **Animated Widgets** | UI animations |

### Dependencies (`pubspec.yaml`)
```yaml
firebase_core: 3.8.1
firebase_auth: 5.3.4
