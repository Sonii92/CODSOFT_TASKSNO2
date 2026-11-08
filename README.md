# JobSphere - Modern Full-Stack Job Board Platform

JobSphere is a production-grade, responsive job board platform built with **React**, **Node.js (Express)**, and a **Document/PostgreSQL-compatible database**. It connects job seekers with top employers, supporting resume uploads, live application tracking, automated email notifications, and candidate review workflows.

---

## 🌟 Key Features

### 1. Home Page
- **Hero & Search Header**: Quick search by keyword (title, skills, company) and location.
- **Popular Tags**: 1-click searches for `React`, `Remote`, `Node.js`, `DevOps`, `TypeScript`, `AI & ML`.
- **Platform Statistics**: Live counters for active jobs, hiring companies, candidate pool, and response rates.
- **Category Explorer**: Browse jobs across Software Engineering, Product Design, DevOps & Cloud, Data & AI, and Product Management.
- **Featured Jobs Carousel**: Curated high-salary and remote positions.
- **Step-by-Step Walkthrough**: Explaining how JobSphere works for candidates and recruiters.

### 2. Job Listings Page (`/jobs`)
- **Advanced Multi-Filter Engine**:
  - Filter by Category
  - Filter by Job Type (Full-time, Part-time, Contract, Internship)
  - Filter by Experience Level (Entry Level, Mid-Level, Senior Level, Lead / Principal)
  - Remote-only instant toggle
  - Minimum Salary filter
  - Sorting: Newest First, Highest Salary, Most Popular
- **Interactive Job Cards**: Bookmarking/saving, tags, salary, company logos, and quick apply modal.

### 3. Job Detail Page (`/jobs/:id`)
- Comprehensive job specifications: Title, Company Name, Logo, Location, Work Type, Salary.
- Sections:
  - Role Overview
  - Key Responsibilities
  - Required Qualifications & Technical Skills
  - Perks & Benefits
- About the Company card with website link.
- Action Buttons: **"Apply for this Position"**, **"Save Job"** bookmarking, and **"Share Job"** link.
- Similar openings recommendations.

### 4. Job Application Process & Resume Upload
- Intuitive modal application form.
- Pre-fills candidate contact info and links if authenticated.
- **Resume Upload**: File dropzone supporting PDF, DOC, DOCX, TXT (up to 10MB) stored securely in `server/uploads/resumes/`.
- Cover note / pitch textarea.
- **Automated Dual-Email Notification Trigger**:
  1. Instant confirmation email dispatched to Candidate.
  2. Instant alert email dispatched to Employer.

### 5. Employer Dashboard (`/employer/dashboard`)
- **Recruitment Analytics**: Active Postings, Total Applicants, Pending Reviews, Interviews Set.
- **Job Posting Studio (`/employer/post-job`)**: Full form with title, category, type, remote toggle, salary range, responsibilities, requirements, benefits, and skills tags.
- **Posted Jobs Manager**: Active/Closed status, applicant counts, direct view and delete actions.
- **Applicant Review Tracker**:
  - Filter applicants by specific job opening or view all.
  - Candidate details: Name, Email, Phone, Cover Note, Resume download link.
  - Status management dropdown: `Submitted` ➔ `Under Review` ➔ `Interview Scheduled` ➔ `Offer Extended` ➔ `Declined`.
  - Updating status automatically notifies candidate via email!

### 6. Candidate Dashboard (`/candidate/dashboard`)
- Profile overview: Name, Headline, Bio, Skills tags, Phone, Location, Portfolio/LinkedIn.
- Profile Edit Modal for updating candidate details.
- **Applications Status Tracker**: Displays all applied positions with live status badges and recruiter review notes.
- **Saved Jobs**: Quick access to bookmarked jobs with 1-click apply.

### 7. Email Notifications & In-App Activity Center
- Real-time notification bell with unread badge in navigation bar.
- Slide-over notification drawer with two tabs:
  1. **In-App Alerts**: Mark as read, direct links to applications and jobs.
  2. **Sent Emails Log**: Inspect all automated emails dispatched by Nodemailer with full HTML rendering preview.

### 8. User Authentication & Security
- Role-based accounts: `candidate` vs `employer`.
- Password hashing with `bcryptjs`.
- JWT token authentication with role-based route protection.

---

## 📂 Project Architecture

```
d:\Sales\job_board\
├── server\
│   ├── config\
│   │   └── db.js               # Document database with MongoDB/PostgreSQL compatibility
│   ├── middleware\
│   │   ├── auth.js             # JWT authentication & role-based access control
│   │   └── upload.js           # Multer resume upload configuration (PDF/DOC/DOCX)
│   ├── models\
│   │   └── mongoSchemas.js     # Mongoose models for MongoDB deployment
│   ├── routes\
│   │   ├── authRoutes.js       # Register, Login, Profile
│   │   ├── jobRoutes.js        # Search, filters, details, post job, bookmarks
│   │   ├── applicationRoutes.js# Apply with resume, status update, candidate/employer queries
│   │   ├── employerRoutes.js   # Employer dashboard metrics and jobs
│   │   ├── candidateRoutes.js  # Candidate dashboard metrics and saved jobs
│   │   └── notificationRoutes.js# In-app notifications & email logs
│   ├── services\
│   │   └── emailService.js     # Automated Nodemailer HTML notifications
│   ├── seeds\
│   │   └── seedJobs.js         # Pre-seeded employers, candidates, and job postings
│   ├── schema.sql              # Production PostgreSQL DDL schema
│   ├── server.js               # Express application entrypoint & static SPA server
│   └── package.json
│
├── client\
│   ├── src\
│   │   ├── components\
│   │   │   ├── Navbar.jsx      # Navigation, role switcher, notification bell
│   │   │   ├── Footer.jsx      # Platform footer
│   │   │   ├── JobCard.jsx     # Job card with badges, salary, and quick apply
│   │   │   ├── ApplyModal.jsx  # Resume upload & application form
│   │   │   └── NotificationDrawer.jsx # In-app alerts & HTML email preview modal
│   │   ├── context\
│   │   │   ├── AuthContext.jsx # Global user authentication state
│   │   │   └── NotificationContext.jsx # Real-time notifications and email logs
│   │   ├── pages\
│   │   │   ├── HomePage.jsx    # Hero search, categories, featured jobs, CTAs
│   │   │   ├── JobListingsPage.jsx # Multi-filter search catalog
│   │   │   ├── JobDetailPage.jsx # Full job specifications and application
│   │   │   ├── EmployerDashboard.jsx # Recruitment metrics & applicant tracker
│   │   │   ├── PostJobPage.jsx # Job creation form
│   │   │   ├── CandidateDashboard.jsx # Profile manager & application tracking
│   │   │   ├── LoginPage.jsx   # 1-click demo logins & sign in
│   │   │   └── RegisterPage.jsx# Candidate & employer registration
│   │   ├── App.jsx             # React Router routing
│   │   └── main.jsx
│   ├── dist\                   # Production React build (ready to serve)
│   ├── index.html
│   └── package.json
│
└── README.md
```

---

## 🚀 Running the Application

### Option A: Unified Full-Stack Server (Recommended)
The Express backend is configured to serve both the REST API and the compiled React production client on port **4000**:

```powershell
cd d:\Sales\job_board\server
node server.js
```

Open your browser to:
👉 **`http://localhost:4000`**

---

### Option B: Development Mode (Vite HMR + Express)
Run the backend and frontend concurrently:

**Terminal 1 (Backend API):**
```powershell
cd d:\Sales\job_board\server
node server.js
```

**Terminal 2 (React Frontend with Vite):**
```powershell
cd d:\Sales\job_board\client
npm run dev
```

---

## 🔑 Pre-Seeded Demo Accounts

You can log in instantly using the 1-click buttons on the Login page or with these credentials:

| Role | Email | Password | Details |
| :--- | :--- | :--- | :--- |
| **Employer** | `employer@jobsphere.com` | `password123` | Sarah Connor, Head of People at Stripe |
| **Candidate** | `candidate@jobsphere.com` | `password123` | Alex Rivera, Senior Full Stack Developer |
