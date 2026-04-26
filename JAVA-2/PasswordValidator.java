import java.util.Scanner;

public class PasswordValidator {

    public static boolean validatePassword(String password) {
        boolean hasUppercase = false;
        boolean hasLowercase = false;
        boolean hasDigit = false;
        boolean hasSpecialChar = false;

        String specialCharacters = "!@#$%^&*()-_+=<>?/{}[]|";

        for (int i = 0; i < password.length(); i++) {
            char ch = password.charAt(i);

            if (Character.isUpperCase(ch)) {
                hasUppercase = true;
            } else if (Character.isLowerCase(ch)) {
                hasLowercase = true;
            } else if (Character.isDigit(ch)) {
                hasDigit = true;
            } else if (specialCharacters.indexOf(ch) != -1) {
                hasSpecialChar = true;
            }
        }

        boolean isValid = true;

        if (password.length() < 8) {
            System.out.println("Suggestion: Password is too short. Use at least 8 characters.");
            isValid = false;
        }

        if (!hasUppercase) {
            System.out.println("Suggestion: Add at least one uppercase letter.");
            isValid = false;
        }

        if (!hasLowercase) {
            System.out.println("Suggestion: Add at least one lowercase letter.");
            isValid = false;
        }

        if (!hasDigit) {
            System.out.println("Suggestion: Add at least one number.");
            isValid = false;
        }

        if (!hasSpecialChar) {
            System.out.println("Suggestion: Add at least one special character like @, #, $, or %.");
            isValid = false;
        }

        return isValid;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("===== SafeLog Password Validator =====");

        while (true) {
            System.out.print("Enter password: ");
            String password = sc.nextLine();

            if (validatePassword(password)) {
                System.out.println("Password accepted. Strong password!");
                break;
            } else {
                System.out.println("Invalid password. Please try again.\n");
            }
        }

        sc.close();
    }
}