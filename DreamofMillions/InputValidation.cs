using System;


namespace DreamofMillions
{
    public class InputValidation
    {
        public static bool ValidateUserName(String input)
        {
            bool pass = true;
            var positiveIntRegex = new System.Text.RegularExpressions.Regex(@"^[a-zA-Z0-9]*$");

            if (positiveIntRegex.IsMatch(input) == false)
            {
                pass = false;
            }

            if (input.Trim().Length < 1)
            {
                pass = false;
            }
            if (input.Length < 8 || input.Length > 15)
            {
                pass = false;
            }
            return pass;

        }
        public static bool ValidatePassword(String Password, String PasswordConfirm)
        {
            bool pass = true;
            if (Password.Equals(PasswordConfirm)==false)
            {
                pass = false;
            }
            return pass;
        }
    }
}