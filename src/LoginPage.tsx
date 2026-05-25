import React from 'react';
import { Beaker, LockKeyhole, LogIn, ShieldCheck, UserPlus } from 'lucide-react';

type AuthMode = 'login' | 'register';

interface LoginPageProps {
  authMode: AuthMode;
  authMessage: string;
  isLoggingIn: boolean;
  loginError: string;
  password: string;
  registerName: string;
  studentNumber: string;
  onAuthModeChange: (mode: AuthMode) => void;
  onLogin: (event: React.FormEvent) => void;
  onPasswordChange: (value: string) => void;
  onRegister: (event: React.FormEvent) => void;
  onRegisterNameChange: (value: string) => void;
  onStudentNumberChange: (value: string) => void;
}

export default function LoginPage({
  authMode,
  authMessage,
  isLoggingIn,
  loginError,
  password,
  registerName,
  studentNumber,
  onAuthModeChange,
  onLogin,
  onPasswordChange,
  onRegister,
  onRegisterNameChange,
  onStudentNumberChange
}: LoginPageProps) {
  const isRegistering = authMode === 'register';

  return (
    <main className="min-h-screen bg-[#F8FAFC] text-slate-900 grid lg:grid-cols-[1.05fr_0.95fr]">
      <section className="hidden lg:flex bg-[#003366] text-white p-12 xl:p-16 flex-col justify-between relative overflow-hidden">
        <div className="relative z-10">
          <div className="flex items-center gap-3 mb-14">
            <div className="bg-white/10 p-3 rounded-xl border border-white/15">
              <Beaker className="w-7 h-7 text-[#C5B358]" />
            </div>
            <div>
              <p className="font-bold text-xl leading-tight">WKU BioLab</p>
              <p className="text-xs uppercase tracking-[0.25em] text-[#C5B358]">Secure Portal</p>
            </div>
          </div>
          <h1 className="text-5xl font-bold leading-tight max-w-xl">
            BioLab Equipment Management System
          </h1>
          <p className="mt-6 text-blue-100 leading-8 max-w-xl">
            Students sign in before accessing equipment records, safety tutorials, and quiz history.
          </p>
        </div>

        <div className="relative z-10 grid gap-4 max-w-xl">
          {[
            'Password hashes are stored securely with bcrypt.',
            'Protected quiz APIs require a signed login token.',
            'Login attempts are rate-limited to slow brute-force attacks.'
          ].map((item) => (
            <div key={item} className="flex items-center gap-3 text-sm text-blue-50">
              <ShieldCheck className="w-5 h-5 text-[#C5B358]" />
              <span>{item}</span>
            </div>
          ))}
        </div>
      </section>

      <section className="flex items-center justify-center px-5 py-10">
        <form
          onSubmit={isRegistering ? onRegister : onLogin}
          className="w-full max-w-md bg-white border border-slate-200 shadow-xl rounded-3xl p-7 sm:p-9"
        >
          <div className="flex items-center justify-between gap-4 mb-8">
            <div>
              <p className="text-xs font-bold uppercase tracking-[0.2em] text-[#C5B358]">WKU BioLab</p>
              <h2 className="text-2xl font-bold text-slate-950 mt-2">
                {isRegistering ? 'Create student account' : 'Student login'}
              </h2>
            </div>
            <div className="w-12 h-12 rounded-2xl bg-blue-50 text-[#003366] flex items-center justify-center">
              {isRegistering ? <UserPlus size={22} /> : <LogIn size={22} />}
            </div>
          </div>

          <div className="space-y-4">
            {isRegistering && (
              <label className="block">
                <span className="block text-sm font-semibold text-slate-700 mb-2">Full name</span>
                <input
                  value={registerName}
                  onChange={(event) => onRegisterNameChange(event.target.value)}
                  autoComplete="name"
                  className="w-full px-4 py-3 rounded-xl border border-slate-200 outline-none focus:border-[#003366] focus:ring-4 focus:ring-blue-100"
                  placeholder="Your name"
                  required
                />
              </label>
            )}

            <label className="block">
              <span className="block text-sm font-semibold text-slate-700 mb-2">Student number</span>
              <input
                value={studentNumber}
                onChange={(event) => onStudentNumberChange(event.target.value)}
                autoComplete="username"
                className="w-full px-4 py-3 rounded-xl border border-slate-200 outline-none focus:border-[#003366] focus:ring-4 focus:ring-blue-100"
                placeholder="20260001"
                required
              />
            </label>

            <label className="block">
              <span className="block text-sm font-semibold text-slate-700 mb-2">Password</span>
              <div className="relative">
                <LockKeyhole className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                <input
                  value={password}
                  onChange={(event) => onPasswordChange(event.target.value)}
                  type="password"
                  autoComplete={isRegistering ? 'new-password' : 'current-password'}
                  minLength={8}
                  className="w-full pl-11 pr-4 py-3 rounded-xl border border-slate-200 outline-none focus:border-[#003366] focus:ring-4 focus:ring-blue-100"
                  placeholder="At least 8 characters"
                  required
                />
              </div>
            </label>
          </div>

          {loginError && <p className="mt-4 text-sm font-medium text-rose-600">{loginError}</p>}
          {authMessage && <p className="mt-4 text-sm font-medium text-emerald-700">{authMessage}</p>}

          <button
            disabled={isLoggingIn}
            className="w-full mt-6 bg-[#003366] text-white py-3.5 rounded-xl font-bold hover:bg-[#004d99] disabled:opacity-60 transition-colors"
          >
            {isLoggingIn ? 'Please wait...' : isRegistering ? 'Register and enter' : 'Login'}
          </button>

          <button
            type="button"
            onClick={() => onAuthModeChange(isRegistering ? 'login' : 'register')}
            className="w-full mt-4 text-sm font-bold text-[#003366] hover:underline"
          >
            {isRegistering ? 'Already have an account? Login' : 'No account? Register here'}
          </button>
        </form>
      </section>
    </main>
  );
}
