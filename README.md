
## Run Locally

**Prerequisites:**  Node.js


Run the app:
   `npm run dev`

Run the quiz API in another terminal:
   `npm run api`

## Login and Security Notes

The app now has a standalone login page at `/login`.

Security protections added:

- Passwords are stored with `bcrypt` instead of plain text or fast SHA256 hashes.
- Login and registration endpoints are rate-limited to reduce brute-force attacks.
- The API signs a JWT token after login, and quiz history endpoints require `Authorization: Bearer <token>`.
- Students can only read or save quiz attempts for their own account.
- Helmet adds common HTTP security headers, and Express JSON body size is limited.

Before deployment, set a long random `JWT_SECRET` in `.env`.
