class EndPoints {
  static const String register = '/admin-register';
  static const String login = '/admin-login';

  //Dashboard
  static const String newCaretakers = '/new-caretakers';
  static const String approveCaretakers = '/approved-caretaker';
  static const String rejectCaretakers = '/reject-caretaker';
  static const String allAppointments = '/all-todays-appointments';

  //Users
  static const String customers = '/customers';
  static const String caretaker = '/caretakers';
  static const String customerDetails = '/get-customer';
  static const String caretakerDetails = '/get-caretaker';
  static const String deactiveCustomer = '/deactive-customer';
  static const String activateCustomer = '/active-customer';
  static const String deleteCustomer = '/delete-customer';
  static const String deactiveCaretaker = '/deactive-caretaker';
  static const String activateCaretaker = '/active-caretaker';
  static const String deleteCaretaker = '/delete-caretaker';

  //Appointment
  static const String upcomingAppt = '/all-upcoming-appointments';
  static const String pastAppt = '/all-past-appointments';
  static const String todayAppt = '/all-todays-appointments';
  static const String apptDetails = '/get-appointment';

  //Reports
  static const String salesReport = '/getSalesReport';
  static const String caretakerReport = '/getCaretakerReport';
  static const String caretakerList = '/getCaretakerList';
}
