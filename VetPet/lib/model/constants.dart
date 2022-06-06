const splashScreen = "/";
const login = "/login";
const register = "/register";
const otp = "/otp";
const home = "/home";
const forgotpassword = "/forgotpassword";
const USER_PREF = "user_profile";

enum AlertType { error, success, info, warning, none }

/// Alert animation types
enum AnimationType { fromRight, fromLeft, fromTop, fromBottom, grow, shrink }

const String imagePath = "assets";

enum INPUT_TYPE { email_type, passwordType, normatText, phoneNumber, multiline }

enum API_RESPONSE_TYPE { SUCCESS, ERROR, LOADING, NO_DATA }

enum KEYBOARD_ACTION { ACTION_DONE, ACTION_NEXT, ACTION_SEARCH }

enum FORM_TYPE { FORM_TYPE_UNDERLINE, FORM_TYPE_BORDER }

enum BUTTON_ACTION_TYPE { BUTTON_CANCEL, BUTTON_SUBMIT }

enum USER_FLOW { FORGOT_PASSWORD, REGISTER, USER }

enum anim_type { SLIDE, FADE }

const String sign_in = "Sign In";
const String create_account = "Create an account";
const String proceed_btn = "Proceed";
const String welcome = "Welcome!";
const String sing_in_to_continue = "Sign in to continue";
const String mobile_number = "Mobile Number";
const String password = "Password";
const String req_otp = "Request Otp";
const String change_password = "Change Password";
const String forgot_password = "Forgot password?";
const String enter_otp = "Enter OTP";

const String first_name = "First Name";
const String full_name = "Full Name";
const String last_name = "Last Name";
const String email_id = "E-Mail Id";
const String phone_number = "Phone Number";
const String old_password = "Enter old password";
const String new_password = "Enter new password";
const String repeat_new_password = "Repeat new password";
const String please_enter_mobile_number = "Please enter 10 digit mobile number";
const String password_min_length = "Minimum password length is 6";
const String forgot_password_heading = "Forgot Password?";
const String change_passwrord_heading = "Change Password";
const String forgot_password_desc = "Please enter your mobile number";
const String change_password_desc = "Change password from here";
const String success = "Success!";

const String please_enter_6_digit_otp = "Please enter 6 digit otp";
const String please_enter_first_name = "Please enter first name";
const String please_enter_last_name = "Please enter last name";
const String please_enter_email_name = "Please enter valid email Id";
const String please_enter_valid_mobile_number =
    "Please enter valid mobile Number";
const String please_enter_valid_password = "Minimum Password length is 6";
const String please_enter_valid_old_password =
    "Please enter valid old password";
const String please_enter_valid_new_password =
    "Please enter valid new password";
const String please_enter_valid_repeat_password =
    "Please enter valid repeat password";
const String new_repeat_password_mismatch =
    "New password and repeat password doesn't match";
const String baseUrl = "";

const String cancel = "Cancel";
const String ok = "OK";
const String logout = "Logout";

const prefixMob = "+91";
