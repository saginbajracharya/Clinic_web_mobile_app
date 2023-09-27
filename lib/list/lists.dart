//Appointments List
var appointmentList = [
  {
    'doctorName' : 'Sayhul Magar',
    'patientName' : 'Pratima Magar',
    'dateTime' : '26 Aug 2023\n11::00 AM',
    'patientType' : 'Old Patient',
    'amount' : 'Rs 800',
    'patientAge' : '20',
    'patientAddress' : 'Mangalbazar,Patan',
    'phone' : '98324234235',
  },
  {
    'doctorName' : 'Karina Gurung',
    'patientName' : 'Jasmine Shrestha',
    'dateTime' : '25 Aug 2023\n11:00 AM',
    'patientType' : 'New Patient',
    'amount' : 'Rs 800',
    'patientAge' : '20',
    'patientAddress' : 'Mangalbazar,Patan',
    'phone' : '98324234235',
  },
  {
    'doctorName' : 'Amit Karki',
    'patientName' : 'Aayush Oli',
    'dateTime' : '28 Aug 2023\n11::00 AM',
    'patientType' : 'Old Patient',
    'amount' : 'Rs 800',
    'patientAge' : '20',
    'patientAddress' : 'Mangalbazar,Patan',
    'phone' : '98324234235',
  },
  {
    'doctorName' : 'Anik Shakya',
    'patientName' : 'Muna Thapa',
    'dateTime' : '19 Aug 2023\n11::00 AM',
    'patientType' : 'New Patient',
    'amount' : 'Rs 800',
    'patientAge' : '20',
    'patientAddress' : 'Mangalbazar,Patan',
    'phone' : '98324234235',
  },
  {
    'doctorName' : 'Rilon Maharjan',
    'patientName' : 'Bibisa Gururg',
    'dateTime' : '08 Sep 2023\n11::00 AM',
    'patientType' : 'New Patient',
    'amount' : 'Rs 800',
    'patientAge' : '20',
    'patientAddress' : 'Mangalbazar,Patan',
    'phone' : '98324234235',
  },
  {
    'doctorName' : 'Sajjan Raj',
    'patientName' : 'Shyam Budathoki',
    'dateTime' : '30 Aug 2023\n11::00 AM',
    'patientType' : 'Old Patient',
    'amount' : 'Rs 800',
    'patientAge' : '20',
    'patientAddress' : 'Mangalbazar,Patan',
    'phone' : '98324234235',
  },
  {
    'doctorName' : 'Narayan Gopal',
    'patientName' : 'Safal Hyozu',
    'dateTime' : '29 Aug 2023\n11::00 AM',
    'patientType' : 'Old Patient',
    'amount' : 'Rs 800',
    'patientAge' : '20',
    'patientAddress' : 'Mangalbazar,Patan',
    'phone' : '98324234235',
  },
];

//doctors List
var doctorsList = [
    {
        'doctorName': 'Rillo',
        'speciality': 'Dentist',
        'location': 'Cityville Dental Clinic',
        'contactNumber': '+1 (123) 456-7890',
        'email': 'rillo@example.com',
        'yearsOfExperience': 12,
        'education': 'DDS, University of Dental Sciences',
        'ratings' : 3
    },
    {
        'doctorName': 'Smith',
        'speciality': 'Pediatrician',
        'location': 'KidzCare Pediatrics',
        'contactNumber': '+1 (987) 654-3210',
        'email': 'smith@example.com',
        'yearsOfExperience': 20,
        'education': 'MD, Childrens Hospital University',
        'ratings' : 2
    },
    {
        'doctorName': 'Johnson',
        'speciality': 'Cardiologist',
        'location': 'Heart Health Clinic',
        'contactNumber': '+1 (555) 123-4567',
        'email': 'johnson@example.com',
        'yearsOfExperience': 15,
        'education': 'MD, Cardiology Institute',
        'ratings' : 4
    },
    {
        'doctorName': 'Brown',
        'speciality': 'Dermatologist',
        'location': 'SkinCare Clinic',
        'contactNumber': '+1 (789) 012-3456',
        'email': 'brown@example.com',
        'yearsOfExperience': 18,
        'education': 'MD, Dermatology School',
        'ratings' : 1
    },
    {
        'doctorName': 'Garcia',
        'speciality': 'Orthopedic Surgeon',
        'location': 'OrthoCare Hospital',
        'contactNumber': '+1 (234) 567-8901',
        'email': 'garcia@example.com',
        'yearsOfExperience': 22,
        'education': 'MD, Orthopedics University',
        'ratings' : 2
    },
    {
        'doctorName': 'Davis',
        'speciality': 'Obstetrician',
        'location': 'Maternity Clinic',
        'contactNumber': '+1 (567) 890-1234',
        'email': 'davis@example.com',
        'yearsOfExperience': 14,
        'education': 'MD, Obstetrics College',
        'ratings' : 3
    },
    {
        'doctorName': 'Wilson',
        'speciality': 'Ophthalmologist',
        'location': 'EyeCare Center',
        'contactNumber': '+1 (321) 234-5678',
        'email': 'wilson@example.com',
        'yearsOfExperience': 17,
        'education': 'MD, Ophthalmology School',
        'ratings' : 5
    }
];

//patient List
var patientsList = [
    {
        'patientName': 'Alice Johnson',
        'age': 32,
        'gender': 'Female',
        'contactNumber': '+1 (123) 456-7890',
        'email': 'alice@example.com',
        'address': '123 Elm Street, Cityville',
        'medicalHistory': 'Hypertension, Allergies',
        'insuranceProvider': 'Blue Cross Blue Shield',
        'patientType' : 'New Patient',
    },
    {
        'patientName': 'Bob Smith',
        'age': 45,
        'gender': 'Male',
        'contactNumber': '+1 (987) 654-3210',
        'email': 'bob@example.com',
        'address': '456 Oak Avenue, Townsville',
        'medicalHistory': 'Diabetes, Asthma',
        'insuranceProvider': 'Aetna',
        'patientType' : 'Old Patient',
    },
    {
        'patientName': 'Charlie Brown',
        'age': 28,
        'gender': 'Male',
        'contactNumber': '+1 (555) 123-4567',
        'email': 'charlie@example.com',
        'address': '789 Maple Lane, Villageton',
        'medicalHistory': 'Allergies, Migraines',
        'insuranceProvider': 'Cigna',
        'patientType' : 'New Patient',
    },
    {
        'patientName': 'David Garcia',
        'age': 50,
        'gender': 'Male',
        'contactNumber': '+1 (789) 012-3456',
        'email': 'david@example.com',
        'address': '101 Pine Road, Countyville',
        'medicalHistory': 'Arthritis, High Cholesterol',
        'insuranceProvider': 'UnitedHealthcare',
        'patientType' : 'New Patient',
    },
    {
        'patientName': 'Eve Davis',
        'age': 35,
        'gender': 'Female',
        'contactNumber': '+1 (234) 567-8901',
        'email': 'eve@example.com',
        'address': '202 Cedar Street, Villagetown',
        'medicalHistory': 'Pregnancy, Anemia',
        'insuranceProvider': 'Medicare',
        'patientType' : 'Old Patient',
    },
    {
        'patientName': 'Frank Wilson',
        'age': 60,
        'gender': 'Male',
        'contactNumber': '+1 (567) 890-1234',
        'email': 'frank@example.com',
        'address': '303 Birch Lane, Hamletsville',
        'medicalHistory': 'Glaucoma, Hypertension',
        'insuranceProvider': 'Humana',
        'patientType' : 'New Patient',
    },
    {
        'patientName': 'Grace Taylor',
        'age': 22,
        'gender': 'Female',
        'contactNumber': '+1 (321) 234-5678',
        'email': 'grace@example.com',
        'address': '404 Willow Road, Countryside',
        'medicalHistory': 'Asthma, Allergies',
        'insuranceProvider': 'Kaiser Permanente',
        'patientType' : 'Old Patient',
    }
];

//services List
List serviceList = [
  'Medical Check', 
  'Immunization', 
  'Lab', 
  'Follow Up', 
  'Appointment', 
  'Feeding'
];

//immunization lists
List immmunizationList = [
  {
  'title' : 'BCG',
  'duration' : 'At Birth, till 45 days',
  'status' : 'Completed',
  'date' : '2023-09-01'
  },
  {
  'title' : 'Pavement + OPV + PCV 10 +1',
  'duration' : '5 weeks',
  'status' : 'Pending',
  'date' : '2023-09-01',
  },
  {
  'title' : 'Pavement + OPV + PCV 10 +1',
  'duration' : '14 weeks',
  'status' : 'Pending',
  'date' : '2023-09-01',
  },
  {
  'title' : 'Pentavalent - III + OPV - III + IPV',
  'duration' : '14 weeks',
  'status' : 'Pending',
  'date' : '2023-09-01',
  },
  {
  'title' : 'MR + PCV-10 booster',
  'duration' : '2 months',
  'status' : 'Pending',
  'date' : '2023-09-01',
  },
  {
  'title' : 'JE',
  'duration' : '12-23 months',
  'status' : 'Pending',
  'date' : '2023-09-01',
  },
];

//vaccines List
List additionalVaccines = [
  {
  'title' : 'Rotavirus-I',
  'date' : '2 months (6 weeks - 12 weeks)'
  },
  {
  'title' : 'Rotavirus-II',
  'date' : '4 months'
  },
  {
  'title' : 'Rotavirus-V',
  'date' : '5 months'
  },
  {
  'title' : 'Rotavirus-IV',
  'date' : '14 weeks'
  },
  
  {
  'title' : 'Rotavirus-I',
  'date' : '14 weeks'
  },
  {
  'title' : 'Rotavirus-III',
  'date' : '14 weeks'
  },
];



