# Custom ERP System

A modern, full-featured Enterprise Resource Planning (ERP) system built with React, TypeScript, and Supabase. This system is designed to help businesses manage their operations efficiently with modules for leads, sales, inventory, purchases, accounting, and HR management.

## Features

- 🔐 **Secure Authentication** - Role-based access control with JWT
- 📊 **Dashboard** - Real-time overview of business metrics
- 👥 **Leads Management** - Track and manage potential customers
- 📦 **Inventory Management** - Stock tracking with reorder notifications
- 💰 **Sales Management** - Quotations and order processing
- 🛍️ **Purchase Management** - Purchase orders and vendor management
- 📑 **Accounting** - Financial tracking and reporting
- 👨‍💼 **HR Management** - Employee records and payroll
- 📱 **Responsive Design** - Works on desktop and mobile devices
- 🎨 **Modern UI** - Clean interface with Tailwind CSS

## Tech Stack

- **Frontend**: React, TypeScript, Tailwind CSS
- **State Management**: Zustand
- **API Client**: Axios, TanStack Query
- **Database**: Supabase
- **Icons**: Lucide React
- **Date Handling**: date-fns
- **Form Validation**: Zod

## Getting Started

### Prerequisites

- Node.js (v18 or higher)
- npm or yarn
- Supabase account

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd custom-erp-system
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
Create a `.env` file in the root directory with the following variables:
```env
VITE_API_URL=your_api_url
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

4. Start the development server:
```bash
npm run dev
```

### Building for Production

```bash
npm run build
```

## Project Structure

```
src/
├── components/     # Reusable UI components
├── pages/         # Page components
├── stores/        # Zustand state management
├── types/         # TypeScript type definitions
├── lib/           # Utility functions and API client
└── main.tsx       # Application entry point
```

## Authentication

The system uses Supabase Authentication with the following roles:
- Superadmin
- Admin
- Manager
- User

Each role has specific permissions and access levels to different modules.

## Database Schema

The database is structured with the following main tables:
- Users (managed by Supabase Auth)
- Leads
- Sales
- Inventory
- Purchases
- Accounting
- HR
