/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState, useEffect } from 'react';
import { 
  Beaker, 
  Microscope, 
  ShieldCheck, 
  Search, 
  ChevronRight, 
  X, 
  Info,
  AlertTriangle,
  BookOpen,
  Menu,
  Trash2,
  Waves,
  CheckCircle2,
  HelpCircle,
  ArrowRight,
  Home as HomeIcon,
  GraduationCap,
  LogIn,
  LogOut,
  UserRound,
  Trophy,
  Play
} from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';
import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';
import { equipmentData } from './data/equipment';
import { tutorialData, safetyRules, quizSets } from './data/content';
import { Equipment, QuizAttemptSummary, Student, QuizSet, QuizQuestion } from './types';
import LoginPage from './LoginPage';

function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

type Tab = 'home' | 'equipment' | 'tutorials' | 'safety' | 'quiz';

const STUDENT_STORAGE_KEY = 'wku-student';
const TOKEN_STORAGE_KEY = 'wku-auth-token';

export default function App() {
  const [language, setLanguage] = useState<'en' | 'zh'>('en');

  const t = <T,>(en: T, zh: T): T => language === 'en' ? en : zh;

  const [activeTab, setActiveTab] = useState<Tab>(() => {
  return (localStorage.getItem('wku-active-tab') as Tab) || 'home';
  });
  const [selectedCategory, setSelectedCategory] = useState<string>('All');
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedEquipment, setSelectedEquipment] = useState<Equipment | null>(null);
  const [isFunctionOpen, setIsFunctionOpen] = useState(true);   // 默认展开
  const [isVideoOpen, setIsVideoOpen] = useState(false);//新增

  // Quiz State
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
  const [quizScore, setQuizScore] = useState(0);
  const [showQuizResult, setShowQuizResult] = useState(false);
  const [selectedAnswer, setSelectedAnswer] = useState<number | null>(null);
  const [isAnswerCorrect, setIsAnswerCorrect] = useState<boolean | null>(null);
  const [currentPath, setCurrentPath] = useState(() => window.location.pathname);
  const [student, setStudent] = useState<Student | null>(() => {
    const saved = localStorage.getItem(STUDENT_STORAGE_KEY);
    return saved ? JSON.parse(saved) : null;
  });
  const [authToken, setAuthToken] = useState(() => localStorage.getItem(TOKEN_STORAGE_KEY) || '');
  const [studentNumber, setStudentNumber] = useState('');
  const [password, setPassword] = useState('');
  const [loginError, setLoginError] = useState('');
  const [isLoggingIn, setIsLoggingIn] = useState(false);
  const [authMode, setAuthMode] = useState<'login' | 'register'>('login');
  const [registerName, setRegisterName] = useState('');
  const [authMessage, setAuthMessage] = useState('');
  const [attempts, setAttempts] = useState<QuizAttemptSummary[]>([]);
  const [answers, setAnswers] = useState<{ questionId: string; selectedAnswer: number; isCorrect: boolean }[]>([]);
  const [isSavingAttempt, setIsSavingAttempt] = useState(false);
  const [selectedQuizSet, setSelectedQuizSet] = useState<QuizSet | null>(null);
  const [activeQuizQuestions, setActiveQuizQuestions] = useState<QuizQuestion[]>([]);

  const getRandomQuestions = (questions: QuizQuestion[], count = 5) => {
  return [...questions]
    .sort(() => Math.random() - 0.5)
    .slice(0, Math.min(count, questions.length));
};

const currentQuizQuestions = activeQuizQuestions;

  const categories = ['All', 'Microscopy', 'Centrifugation', 'Molecular', 'General', 'Glassware', 'Safety'];
  const authHeaders = authToken ? { Authorization: `Bearer ${authToken}` } : {};

  const goTo = (path: string) => {
    window.history.pushState({}, '', path);
    setCurrentPath(path);
  };

  const filteredEquipment = equipmentData.filter(item => {
    const matchesCategory = selectedCategory === 'All' || item.category === selectedCategory;
    const query = searchQuery.toLowerCase();
    const matchesSearch = item.name.toLowerCase().includes(query) || 
                         item.nameZh.includes(query) ||
                         item.description.toLowerCase().includes(query) ||
                         item.descriptionZh.includes(query) ||
                         item.model?.toLowerCase().includes(query) ||
                         item.assetId?.toLowerCase().includes(query);
    return matchesCategory && matchesSearch;
  });

  useEffect(() => {
    const handlePopState = () => setCurrentPath(window.location.pathname);
    window.addEventListener('popstate', handlePopState);
    return () => window.removeEventListener('popstate', handlePopState);
  }, []);

  useEffect(() => {
  localStorage.setItem('wku-active-tab', activeTab);
  }, [activeTab]);

  useEffect(() => {
    if ((!student || !authToken) && currentPath !== '/login') {
      goTo('/login');
    }

    if (student && authToken && currentPath === '/login') {
      goTo('/');
    }
  }, [student, authToken, currentPath]);

  useEffect(() => {
    if (!student || !authToken) return;
    fetch(`/api/students/${student.id}/attempts`, { headers: authHeaders })
      .then(res => {
        if (res.status === 401 || res.status === 403) {
          throw new Error('Unauthorized');
        }
        return res.json();
      })
      .then(data => setAttempts(data.attempts || []))
      .catch(() => setAttempts([]));
  }, [student, authToken]);

  const handleQuizAnswer = (optionIndex: number) => {
    if (selectedAnswer !== null) return;
    
    setSelectedAnswer(optionIndex);
    const correct = optionIndex === currentQuizQuestions[currentQuestionIndex].correctAnswer;
    setIsAnswerCorrect(correct);
    if (correct) setQuizScore(prev => prev + 1);
    setAnswers(prev => [
      ...prev,
      {
        questionId: currentQuizQuestions[currentQuestionIndex].id,
        selectedAnswer: optionIndex,
        isCorrect: correct
      }
    ]);
  };

  const saveAttempt = async () => {
    if (!student) return;
    setIsSavingAttempt(true);

    try {
      await fetch('/api/quiz-attempts', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', ...authHeaders },
        body: JSON.stringify({
          studentId: student.id,
          quizType: selectedQuizSet?.id,
          score: quizScore,
          totalQuestions: currentQuizQuestions.length,
          answers
        })
      });
      const res = await fetch(`/api/students/${student.id}/attempts`, { headers: authHeaders });
      const data = await res.json();
      setAttempts(data.attempts || []);
    } finally {
      setIsSavingAttempt(false);
    }
  };

  const nextQuestion = async () => {
    if (currentQuestionIndex < currentQuizQuestions.length - 1) {
      setCurrentQuestionIndex(prev => prev + 1);
      setSelectedAnswer(null);
      setIsAnswerCorrect(null);
    } else {
      setShowQuizResult(true);
      await saveAttempt();
    }
  };

  const resetQuiz = () => {
    setCurrentQuestionIndex(0);
    setQuizScore(0);
    setShowQuizResult(false);
    setSelectedAnswer(null);
    setIsAnswerCorrect(null);
    setAnswers([]);
  };

  const handleLogin = async (event: React.FormEvent) => {
  event.preventDefault();

  setIsLoggingIn(true);
  setLoginError('');

  try {
    const res = await fetch('/api/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        studentNumber,
        password
      })
    });

    const data = await res.json();

    if (!res.ok) {
      throw new Error(data.message || 'Login failed');
    }

    setStudent(data.student);
    setAuthToken(data.token);

    localStorage.setItem(
      STUDENT_STORAGE_KEY,
      JSON.stringify(data.student)
    );
    localStorage.setItem(TOKEN_STORAGE_KEY, data.token);

    setStudentNumber('');
    setPassword('');
    goTo('/');
  } catch (error) {
    if (error instanceof Error) {
      setLoginError(error.message);
      return;
    }
    setLoginError(
      t(
        'Incorrect student number or password.',
        '学号或密码错误。'
      )
    );
  } finally {
    setIsLoggingIn(false);
  }
};

  const handleRegister = async (event: React.FormEvent) => {
  event.preventDefault();
  setIsLoggingIn(true);
  setLoginError('');
  setAuthMessage('');

  try {
    const res = await fetch('/api/register', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        studentNumber,
        name: registerName,
        password
      })
    });

    const data = await res.json();

    if (!res.ok) {
      throw new Error(data.message || 'Registration failed');
    }

    setStudent(data.student);
    setAuthToken(data.token);
    localStorage.setItem(STUDENT_STORAGE_KEY, JSON.stringify(data.student));
    localStorage.setItem(TOKEN_STORAGE_KEY, data.token);
    setStudentNumber('');
    setPassword('');
    setRegisterName('');
    goTo('/');
  } catch (error) {
    if (error instanceof Error) {
      setLoginError(error.message);
      return;
    }
    setLoginError(t(
      'Registration failed. The student number may already exist.',
      '注册失败。该学号可能已经被注册。'
    ));
  } finally {
    setIsLoggingIn(false);
  }
};

  const handleLogout = () => {
    setStudent(null);
    setAuthToken('');
    setAttempts([]);
    setActiveTab('home');
    setSelectedQuizSet(null);

    localStorage.removeItem(STUDENT_STORAGE_KEY);
    localStorage.removeItem(TOKEN_STORAGE_KEY);
    localStorage.removeItem('wku-active-tab');

    resetQuiz();
    goTo('/login');
  };

  const renderAuthPage = () => (
  <div className="min-h-screen bg-[#F8FAFC] flex items-center justify-center px-4">
    <form
      onSubmit={authMode === 'login' ? handleLogin : handleRegister}
      className="bg-white rounded-3xl p-8 md:p-10 shadow-xl border border-slate-100 w-full max-w-md"
    >
      <div className="w-14 h-14 bg-emerald-100 text-emerald-600 rounded-2xl flex items-center justify-center mb-6">
        <LogIn size={24} />
      </div>

      <h1 className="text-2xl font-bold text-slate-900 mb-2">
        {authMode === 'login'
          ? t('Student Login', '学生登录')
          : t('Create Student Account', '创建学生账号')}
      </h1>

      <p className="text-slate-500 mb-6">
        {t('Please log in or register before using the BioLab system.', '请先登录或注册后再使用生物实验室系统。')}
      </p>

      <div className="space-y-4">
        {authMode === 'register' && (
          <input
            value={registerName}
            onChange={e => setRegisterName(e.target.value)}
            placeholder={t('Full name', '姓名')}
            className="w-full px-4 py-4 rounded-2xl border border-slate-200 outline-none focus:border-emerald-400"
          />
        )}

        <input
          value={studentNumber}
          onChange={e => setStudentNumber(e.target.value)}
          placeholder={t('Student number', '学号')}
          className="w-full px-4 py-4 rounded-2xl border border-slate-200 outline-none focus:border-emerald-400"
        />

        <input
          value={password}
          onChange={e => setPassword(e.target.value)}
          type="password"
          placeholder={t('Password', '密码')}
          className="w-full px-4 py-4 rounded-2xl border border-slate-200 outline-none focus:border-emerald-400"
        />
      </div>

      {loginError && <p className="text-sm text-rose-600 mt-4">{loginError}</p>}
      {authMessage && <p className="text-sm text-emerald-600 mt-4">{authMessage}</p>}

      <button
        disabled={isLoggingIn}
        className="w-full mt-6 bg-slate-900 text-white py-4 rounded-2xl font-bold hover:bg-slate-800 disabled:opacity-60"
      >
        {isLoggingIn
          ? t('Please wait...', '请稍候...')
          : authMode === 'login'
            ? t('Login', '登录')
            : t('Register and Enter', '注册并进入')}
      </button>

      <button
        type="button"
        onClick={() => {
          setAuthMode(authMode === 'login' ? 'register' : 'login');
          setLoginError('');
          setAuthMessage('');
        }}
        className="w-full mt-4 text-sm font-bold text-[#003366] hover:underline"
      >
        {authMode === 'login'
          ? t('No account? Register here', '没有账号？点击注册')
          : t('Already have an account? Login here', '已有账号？点击登录')}
      </button>
    </form>
  </div>
);

  const renderHome = () => (
    <div className="space-y-12">
      <section className="bg-[#003366] rounded-3xl p-8 md:p-16 text-white relative overflow-hidden shadow-2xl border-b-8 border-[#C5B358]">
        <div className="relative z-10 max-w-3xl">
          <div className="inline-flex items-center gap-2 bg-white/10 backdrop-blur-md px-4 py-2 rounded-full text-xs font-bold tracking-widest uppercase mb-6 border border-white/20">
            <span className="w-2 h-2 bg-[#C5B358] rounded-full animate-pulse"></span>
            {t('Wenzhou-Kean University', '温州肯恩大学')}
          </div>
          <h1 className="text-4xl md:text-6xl font-bold mb-6 leading-tight">
            {t('BioLab Equipment', '生物实验室器材')}<br/>{t('Management System', '管理系统')}
          </h1>
          <p className="text-blue-100 text-lg mb-10 opacity-90 leading-relaxed max-w-2xl">
            {t('A centralized portal for WKU students and faculty to explore laboratory resources, access technical specifications, and master experimental protocols.', '为温肯师生提供的中心化门户，用于探索实验室资源、获取技术规格并掌握实验方案。')}
          </p>
          <div className="flex flex-wrap gap-4">
            <button 
              onClick={() => setActiveTab('equipment')}
              className="bg-[#C5B358] text-[#003366] px-8 py-4 rounded-2xl font-bold hover:bg-[#b3a24f] transition-all flex items-center gap-2 shadow-lg"
            >
              <BookOpen size={20} />
              {t('Equipment Catalog', '器材目录')}
            </button>
            <button 
              onClick={() => setActiveTab('safety')}
              className="bg-white/10 backdrop-blur-sm border border-white/20 text-white px-8 py-4 rounded-2xl font-bold hover:bg-white/20 transition-all flex items-center gap-2"
            >
              <ShieldCheck size={20} />
              {t('Safety Protocols', '安全规范')}
            </button>
          </div>
        </div>
        <div className="absolute top-[-10%] right-[-5%] w-96 h-96 bg-blue-400/10 rounded-full blur-3xl"></div>
        <div className="absolute bottom-[-10%] left-[-5%] w-64 h-64 bg-[#C5B358]/10 rounded-full blur-3xl"></div>
        <Microscope className="absolute right-12 bottom-12 text-white/5 w-80 h-80 hidden lg:block" />
      </section>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {categories.filter(c => c !== 'All').map((cat, i) => (
          <button
            key={cat}
            onClick={() => {
              setSelectedCategory(cat);
              setActiveTab('equipment');
            }}
            className="group bg-white p-6 rounded-3xl border border-slate-200 shadow-sm hover:shadow-xl hover:border-[#003366]/20 transition-all text-left"
          >
            <div className="bg-slate-50 w-14 h-14 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#003366] group-hover:text-white transition-all">
              {cat === 'Microscopy' && <Microscope size={28} />}
              {cat === 'Centrifugation' && <Waves size={28} />}
              {cat === 'Molecular' && <Beaker size={28} />}
              {cat === 'General' && <Info size={28} />}
              {cat === 'Glassware' && <Beaker size={28} />}
              {cat === 'Safety' && <ShieldCheck size={28} />}
            </div>
            <h3 className="text-lg font-bold text-slate-900 mb-2 group-hover:text-[#003366]">
              {t(cat, cat === 'Microscopy' ? '显微镜' : cat === 'Centrifugation' ? '离心' : cat === 'Molecular' ? '分子' : cat === 'General' ? '通用' : cat === 'Glassware' ? '玻璃器皿' : '安全')}
            </h3>
            <p className="text-slate-500 text-sm">
              {t(`Explore specialized ${cat.toLowerCase()} instruments and tools.`, `探索专业的${t(cat, cat === 'Microscopy' ? '显微镜' : cat === 'Centrifugation' ? '离心' : cat === 'Molecular' ? '分子' : cat === 'General' ? '通用' : cat === 'Glassware' ? '玻璃器皿' : '安全')}仪器和工具。`)}
            </p>
          </button>
        ))}
      </div>

      <section className="grid grid-cols-1 md:grid-cols-3 gap-8 pt-8 border-t border-slate-200">
        {[
          { icon: <GraduationCap className="text-[#003366]" />, title: t('Technical Specs', '技术规格'), desc: t('Access detailed model information, manufacturer details, and real-time status.', '获取详细的型号信息、制造商详情和实时状态。') },
          { icon: <ShieldCheck className="text-[#003366]" />, title: t('Standardized Safety', '标准化安全'), desc: t('Compliant with WKU and international laboratory safety standards.', '符合温肯及国际实验室安全标准。') },
          { icon: <Trophy className="text-[#003366]" />, title: t('Learning Records', '学习记录'), desc: t('Track quiz performance and reinforce laboratory safety knowledge over time.', '记录测试表现，并持续巩固实验室安全知识。') },
        ].map((feature, i) => (
          <div key={i} className="flex gap-6">
            <div className="bg-blue-50 w-14 h-14 rounded-2xl flex-shrink-0 flex items-center justify-center">
              {feature.icon}
            </div>
            <div>
              <h3 className="text-lg font-bold text-slate-900 mb-2">{feature.title}</h3>
              <p className="text-slate-500 text-sm leading-relaxed">{feature.desc}</p>
            </div>
          </div>
        ))}
      </section>
    </div>
  );

  const renderEquipment = () => (
    <div className="space-y-8">
      <div className="flex flex-col md:flex-row gap-4 items-center justify-between">
        <div className="flex gap-2 overflow-x-auto pb-2 w-full md:w-auto no-scrollbar">
          {categories.map(cat => (
            <button
              key={cat}
              onClick={() => setSelectedCategory(cat)}
              className={cn(
                "px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap transition-all",
                selectedCategory === cat 
                  ? "bg-emerald-600 text-white shadow-lg shadow-emerald-200" 
                  : "bg-white text-slate-600 border border-slate-200 hover:border-emerald-300"
              )}
            >
              {t(cat, cat === 'All' ? '全部' : cat === 'Microscopy' ? '显微镜' : cat === 'Centrifugation' ? '离心' : cat === 'Molecular' ? '分子' : cat === 'General' ? '通用' : cat === 'Glassware' ? '玻璃器皿' : '安全')}
            </button>
          ))}
        </div>
        <div className="relative w-full md:w-80">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 w-4 h-4" />
          <input 
            type="text" 
            placeholder={t("Search equipment name or usage...", "搜索器材名称或用途...")}
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="w-full pl-10 pr-4 py-2 bg-white border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-500/20 focus:border-emerald-500 transition-all"
          />
        </div>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
        <AnimatePresence mode="popLayout">
          {filteredEquipment.map((item) => (
            <motion.div
              layout
              key={item.id}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, scale: 0.95 }}
              whileHover={{ y: -4 }}
              className="bg-white rounded-2xl border border-slate-200 overflow-hidden group cursor-pointer shadow-sm hover:shadow-xl transition-all"
              onClick={() => setSelectedEquipment(item)}
            >
              <div className="aspect-[4/3] overflow-hidden relative">
                <img 
                  src={item.image} 
                  alt={t(item.name, item.nameZh)}
                  className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                  referrerPolicy="no-referrer"
                />
                <div className="absolute top-3 left-3">
                  <span className="bg-white/90 backdrop-blur-sm px-2 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider text-emerald-700 border border-emerald-100">
                    {t(item.category, item.category === 'Microscopy' ? '显微镜' : item.category === 'Centrifugation' ? '离心' : item.category === 'Molecular' ? '分子' : item.category === 'General' ? '通用' : item.category === 'Glassware' ? '玻璃器皿' : '安全')}
                  </span>
                </div>
              </div>
              <div className="p-5">
                <div className="flex items-center justify-between mb-2">
                  <span className={cn(
                    "text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wider",
                    item.status === 'Available' ? "bg-emerald-100 text-emerald-700" :
                    item.status === 'In Use' ? "bg-amber-100 text-amber-700" : "bg-rose-100 text-rose-700"
                  )}>
                    {t(item.status, item.status === 'Available' ? '可用' : item.status === 'In Use' ? '使用中' : '维护中')}
                  </span>
                  <span className="text-[10px] font-mono text-slate-400">{item.assetId}</span>
                </div>
                <h3 className="font-bold text-slate-900 mb-1 group-hover:text-[#003366] transition-colors">{t(item.name, item.nameZh)}</h3>
                <p className="text-slate-500 text-xs mb-4 line-clamp-1">{item.model}</p>
                <div className="flex items-center justify-between pt-4 border-t border-slate-100">
                  <span className="text-xs font-bold text-[#003366] flex items-center gap-1">
                    {t('View Specs', '查看规格')} <ChevronRight size={14} />
                  </span>
                </div>
              </div>
            </motion.div>
          ))}
        </AnimatePresence>
      </div>
    </div>
  );

  const renderTutorials = () => (
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
      {tutorialData.map((tutorial) => (
        <div key={tutorial.id} className="bg-white rounded-3xl border border-slate-100 p-8 shadow-sm">
          <div className="flex items-center gap-3 mb-6">
            <div className="bg-emerald-100 p-3 rounded-2xl">
              <GraduationCap className="text-emerald-600" />
            </div>
            <div>
              <h3 className="text-2xl font-bold text-slate-900">{t(tutorial.title, tutorial.titleZh)}</h3>
            </div>
          </div>
          <div className="space-y-6">
            {tutorial.steps.map((step, i) => (
              <div key={i} className="flex gap-4 group">
                <div className="flex flex-col items-center">
                  <div className="w-8 h-8 rounded-full bg-emerald-50 text-emerald-600 flex items-center justify-center font-bold text-sm border border-emerald-100 group-hover:bg-emerald-600 group-hover:text-white transition-all">
                    {i + 1}
                  </div>
                  {i < tutorial.steps.length - 1 && <div className="w-0.5 h-full bg-slate-100 my-1"></div>}
                </div>
                <div className="pb-4">
                  <h4 className="font-bold text-slate-900 mb-1">{t(step.title, step.titleZh)}</h4>
                  <p className="text-slate-500 text-sm leading-relaxed">{t(step.description, step.descriptionZh)}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      ))}
    </div>
  );

  const renderSafety = () => (
    <div className="space-y-12">
      <div className="text-center max-w-2xl mx-auto">
        <h2 className="text-3xl font-bold text-slate-900 mb-4">{t('Laboratory Safety Protocols', '实验室安全规范')}</h2>
        <p className="text-slate-500">{t('Before entering the WKU Biology Laboratory, please familiarize yourself with and strictly follow these safety guidelines.', '在进入温州肯恩大学生物实验室之前，请熟悉并严格遵守这些安全指南。')}</p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {safetyRules.map((rule) => {
          const IconComponent = {
            ShieldCheck: ShieldCheck,
            AlertTriangle: AlertTriangle,
            Trash2: Trash2,
            Waves: Waves
          }[rule.icon] || Info;

          return (
            <div key={rule.id} className="bg-white p-6 rounded-3xl border border-slate-100 shadow-sm hover:shadow-md transition-all">
              <div className="bg-emerald-50 w-12 h-12 rounded-2xl flex items-center justify-center mb-6">
                <IconComponent className="text-emerald-600" />
              </div>
              <h3 className="text-lg font-bold text-slate-900 mb-2">{t(rule.title, rule.titleZh)}</h3>
              <p className="text-slate-500 text-sm leading-relaxed">{t(rule.content, rule.contentZh)}</p>
            </div>
          );
        })}
      </div>
      <div className="bg-amber-50 rounded-3xl p-8 border border-amber-100 flex flex-col md:flex-row gap-8 items-center">
        <div className="bg-amber-100 p-4 rounded-2xl">
          <AlertTriangle className="text-amber-600 w-8 h-8" />
        </div>
        <div>
          <h4 className="text-xl font-bold text-amber-900 mb-2">{t('Emergency Procedures', '紧急程序')}</h4>
          <p className="text-amber-800 text-sm leading-relaxed">
            {t('In case of chemical spills, fire, or injury, notify the lab instructor or technician immediately. Familiarize yourself with the location of eye wash stations, emergency showers, and fire extinguishers.', '如果发生化学品泄漏、火灾或受伤，请立即通知实验室讲师或技术人员。熟悉洗眼站、紧急淋浴器和灭火器的位置。')}
          </p>
        </div>
      </div>
    </div>
  );

  const renderQuiz = () => {
    if (!student) {
      return (
        <div className="max-w-5xl mx-auto grid grid-cols-1 lg:grid-cols-[1.1fr_0.9fr] gap-6 items-stretch">
          <div className="bg-[#003366] text-white rounded-3xl p-8 md:p-10 shadow-xl overflow-hidden relative">
            <div className="absolute -right-10 -top-10 w-40 h-40 bg-white/10 rounded-full" />
            <div className="absolute -left-8 -bottom-10 w-32 h-32 bg-emerald-400/20 rounded-full" />
            <div className="relative">
              <span className="inline-flex items-center gap-2 text-xs font-bold uppercase tracking-widest text-emerald-200 mb-5">
                <Trophy size={14} />
                {t('Student Assessment', '学生答题')}
              </span>
              <h2 className="text-3xl md:text-4xl font-bold mb-4">
                {t('Every student keeps their own learning record.', '每位学生都保留自己的学习记录。')}
              </h2>
              <p className="text-blue-100 leading-7 max-w-xl">
                {t(
                  'Log in to complete quizzes independently, save your score, and review recent attempts over time.',
                  '登录后即可独立完成测试、保存成绩，并查看自己的近期作答记录。'
                )}
              </p>
            </div>
          </div>

          <form onSubmit={handleLogin} className="bg-white rounded-3xl p-8 md:p-10 shadow-xl border border-slate-100">
            <div className="w-14 h-14 bg-emerald-100 text-emerald-600 rounded-2xl flex items-center justify-center mb-6">
              <LogIn size={24} />
            </div>
            <h3 className="text-2xl font-bold text-slate-900 mb-2">{t('Student Login', '学生登录')}</h3>
            <p className="text-slate-500 mb-6">{t('Use your student account to begin.', '使用学生账号开始答题。')}</p>
            <div className="space-y-4">
              <input value={studentNumber} onChange={e => setStudentNumber(e.target.value)} placeholder={t('Student number', '学号')} className="w-full px-4 py-4 rounded-2xl border border-slate-200 outline-none focus:border-emerald-400" />
              <input value={password} onChange={e => setPassword(e.target.value)} type="password" placeholder={t('Password', '密码')} className="w-full px-4 py-4 rounded-2xl border border-slate-200 outline-none focus:border-emerald-400" />
            </div>
            {loginError && <p className="text-sm text-rose-600 mt-4">{loginError}</p>}
            <button disabled={isLoggingIn} className="w-full mt-6 bg-slate-900 text-white py-4 rounded-2xl font-bold hover:bg-slate-800 disabled:opacity-60">
              {isLoggingIn ? t('Signing in...', '登录中...') : t('Enter Quiz', '进入测试')}
            </button>
          </form>
        </div>
      );
    }

    if (!selectedQuizSet) {
  return (
    <div className="space-y-8">
      <div className="text-center max-w-2xl mx-auto">
        <h2 className="text-3xl font-bold text-slate-900 mb-4">
          {t('Choose a Quiz', '选择考试类型')}
        </h2>
        <p className="text-slate-500">
          {t('Select one test category to start. Your score will be saved after completion.', '选择一个考试类型开始作答。完成后系统会保存你的成绩。')}
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {quizSets.map((quizSet) => (
          <button
            key={quizSet.id}
            onClick={() => {
              setSelectedQuizSet(quizSet);
              setActiveQuizQuestions(getRandomQuestions(quizSet.questions, 5));
              resetQuiz();
            }}
            className="bg-white p-8 rounded-3xl border border-slate-100 shadow-sm hover:shadow-xl hover:border-[#003366]/20 transition-all text-left"
          >
            <div className="w-14 h-14 bg-blue-50 text-[#003366] rounded-2xl flex items-center justify-center mb-6">
              <Trophy size={26} />
            </div>
            <h3 className="text-xl font-bold text-slate-900 mb-3">
              {t(quizSet.title, quizSet.titleZh)}
            </h3>
            <p className="text-sm text-slate-500 leading-relaxed mb-5">
              {t(quizSet.description, quizSet.descriptionZh)}
            </p>
            <span className="text-xs font-bold text-emerald-600">
              {t(`${quizSet.questions.length} questions`, `${quizSet.questions.length} 题`)}
            </span>
          </button>
        ))}
      </div>

      <div className="bg-white rounded-3xl p-8 shadow-sm border border-slate-100">
        <h3 className="font-bold text-slate-900 mb-5 flex items-center gap-2">
          <UserRound size={18} />
          {t('Recent Quiz Records', '近期考试记录')}
        </h3>

        <div className="space-y-3">
          {attempts.length === 0 ? (
            <p className="text-sm text-slate-500">
              {t('No saved attempts yet.', '还没有保存的成绩。')}
            </p>
          ) : attempts.map(attempt => {
            const quizInfo = quizSets.find(q => q.id === attempt.quizType);

            return (
              <div key={attempt.id} className="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3">
                <div>
                  <div className="font-bold text-slate-900">
                    {quizInfo ? t(quizInfo.title, quizInfo.titleZh) : attempt.quizType}
                  </div>
                  <div className="text-xs text-slate-400">
                    {new Date(attempt.submittedAt).toLocaleString()}
                  </div>
                </div>
                <span className="text-sm font-bold text-emerald-600">
                  {attempt.score} / {attempt.totalQuestions}
                </span>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}

    if (showQuizResult) {
      const passed =
        currentQuizQuestions.length > 0 &&
        quizScore / currentQuizQuestions.length >= 0.9;
      return (
        <div className="max-w-4xl mx-auto grid grid-cols-1 lg:grid-cols-[1fr_0.8fr] gap-6">
          <div className="bg-white rounded-3xl p-12 text-center shadow-xl border border-slate-100">
            <div className="w-20 h-20 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center mx-auto mb-6">
              <CheckCircle2 size={40} />
            </div>
            <h2 className="text-3xl font-bold text-slate-900 mb-2">{t('Quiz Completed!', '测试完成！')}</h2>
            <p className="text-slate-500 mb-4">
              {t(
                `Your score is ${quizScore} / ${currentQuizQuestions.length}`,
                `你的得分是 ${quizScore} / ${currentQuizQuestions.length}`
              )}
            </p>

            <div
              className={cn(
                "inline-flex items-center px-6 py-2 rounded-full text-lg font-bold mb-4",
                passed
                  ? "bg-emerald-100 text-emerald-700"
                  : "bg-rose-100 text-rose-700"
              )}
            >
              {passed ? t('PASS', '通过') : t('FAIL', '未通过')}
            </div>

            <p className="text-sm text-slate-500 mb-8">
              {t(
                'A score of 90% or above is required to pass this assessment.',
                '本测试需要达到 90% 或以上才算通过。'
              )}
            </p>
            <button 
              onClick={() => {
                if (selectedQuizSet) {
                  setActiveQuizQuestions(
                    getRandomQuestions(selectedQuizSet.questions, 5)
                  );
                }
                resetQuiz();
              }}
              className="bg-emerald-600 text-white px-8 py-3 rounded-2xl font-bold hover:bg-emerald-700 transition-all"
            >
              {t('Restart Quiz', '重新开始')}
            </button>
            <button
              onClick={() => {
                setSelectedQuizSet(null);
                setActiveQuizQuestions([]);
                resetQuiz();
              }}
            className="ml-3 bg-slate-100 text-slate-700 px-8 py-3 rounded-2xl font-bold hover:bg-slate-200 transition-all"
            >
            {t('Back to Quiz List', '返回考试列表')}
        </button>
          </div>

          <div className="bg-white rounded-3xl p-8 shadow-xl border border-slate-100">
            <h3 className="font-bold text-slate-900 mb-5 flex items-center gap-2">
              <UserRound size={18} />
              {student.name}
            </h3>
            <div className="space-y-3">
              {attempts.length === 0 ? (
                <p className="text-sm text-slate-500">{t('No saved attempts yet.', '还没有保存的成绩。')}</p>
              ) : attempts.map(attempt => (
                <div key={attempt.id} className="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3">
                  <div>
                    <div className="font-bold text-slate-900">{attempt.score} / {attempt.totalQuestions}</div>
                    <div className="text-xs text-slate-400">{new Date(attempt.submittedAt).toLocaleString()}</div>
                  </div>
                  <span className="text-xs font-bold text-emerald-600">{t('Saved', '已保存')}</span>
                </div>
              ))}
            </div>
            {isSavingAttempt && <p className="text-sm text-slate-500 mt-4">{t('Saving result...', '正在保存成绩...')}</p>}
          </div>
        </div>
      );
    }

    const question = currentQuizQuestions[currentQuestionIndex];

    return (
      <div className="max-w-4xl mx-auto grid grid-cols-1 lg:grid-cols-[1fr_260px] gap-6">
        <div className="bg-white rounded-3xl p-8 md:p-12 shadow-xl border border-slate-100">
        <div className="flex justify-between items-center mb-8">
          <span className="text-xs font-bold text-emerald-600 uppercase tracking-widest">
            {t(`Question ${currentQuestionIndex + 1} of ${currentQuizQuestions.length}`, `第 ${currentQuestionIndex + 1} 题，共 ${currentQuizQuestions.length} 题`)}
          </span>
          <div className="flex gap-1">
            {currentQuizQuestions.map((_, i) => (
              <div key={i} className={cn("w-8 h-1 rounded-full", i <= currentQuestionIndex ? "bg-emerald-600" : "bg-slate-100")} />
            ))}
          </div>
        </div>
        <h3 className="text-2xl font-bold text-slate-900 mb-8">{t(question.question, question.questionZh)}</h3>
        <div className="space-y-4 mb-8">
          {t(question.options, question.optionsZh).map((option, i) => (
            <button
              key={i}
              onClick={() => handleQuizAnswer(i)}
              disabled={selectedAnswer !== null}
              className={cn(
                "w-full p-4 rounded-2xl text-left border-2 transition-all flex items-center justify-between",
                selectedAnswer === null ? "border-slate-100 hover:border-emerald-200 hover:bg-emerald-50" : 
                i === question.correctAnswer ? "border-emerald-500 bg-emerald-50 text-emerald-900" :
                selectedAnswer === i ? "border-rose-500 bg-rose-50 text-rose-900" : "border-slate-100 opacity-50"
              )}
            >
              <span className="font-medium">{option}</span>
              {selectedAnswer !== null && i === question.correctAnswer && <CheckCircle2 size={20} className="text-emerald-500" />}
              {selectedAnswer === i && i !== question.correctAnswer && <X size={20} className="text-rose-500" />}
            </button>
          ))}
        </div>
        
        <AnimatePresence>
          {selectedAnswer !== null && (
            <motion.div 
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              className="space-y-6"
            >
              <div className={cn("p-4 rounded-2xl text-sm", isAnswerCorrect ? "bg-emerald-50 text-emerald-800" : "bg-rose-50 text-rose-800")}>
                <p className="font-bold mb-1">{isAnswerCorrect ? t('Correct!', '正确！') : t('Incorrect', '错误')}</p>
                <p>{t(question.explanation, question.explanationZh)}</p>
              </div>
              <button 
                onClick={nextQuestion}
                className="w-full bg-slate-900 text-white py-4 rounded-2xl font-bold hover:bg-slate-800 transition-all flex items-center justify-center gap-2"
              >
                {currentQuestionIndex === currentQuizQuestions.length - 1 ? t('View Results', '查看结果') : t('Next Question', '下一题')}
                <ArrowRight size={20} />
              </button>
            </motion.div>
          )}
        </AnimatePresence>
        </div>
        <aside className="bg-white rounded-3xl p-6 shadow-xl border border-slate-100 h-fit">
          <div className="flex items-center justify-between mb-5">
            <div>
              <p className="text-xs uppercase tracking-widest text-slate-400">{t('Student', '学生')}</p>
              <h3 className="font-bold text-slate-900">{student.name}</h3>
            </div>
            <button onClick={handleLogout} className="text-slate-400 hover:text-rose-500">
              <LogOut size={18} />
            </button>
          </div>
          <div className="rounded-2xl bg-slate-50 p-4">
            <p className="text-xs text-slate-400 mb-1">{t('Current score', '当前得分')}</p>
            <p className="text-3xl font-bold text-slate-900">{quizScore}</p>
          </div>
        </aside>
      </div>
    );
  };

  if (!student || !authToken || currentPath === '/login') {
    return (
      <LoginPage
        authMode={authMode}
        authMessage={authMessage}
        isLoggingIn={isLoggingIn}
        loginError={loginError}
        password={password}
        registerName={registerName}
        studentNumber={studentNumber}
        onAuthModeChange={(mode) => {
          setAuthMode(mode);
          setLoginError('');
          setAuthMessage('');
        }}
        onLogin={handleLogin}
        onPasswordChange={setPassword}
        onRegister={handleRegister}
        onRegisterNameChange={setRegisterName}
        onStudentNumberChange={setStudentNumber}
      />
    );
  }

  return (
    <div className="min-h-screen bg-[#F8FAFC] text-slate-900 font-sans">
      {/* Navigation */}
      <nav className="sticky top-0 z-40 bg-white/80 backdrop-blur-md border-b border-slate-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="flex justify-between h-16 items-center">
            <div className="flex items-center gap-3 cursor-pointer" onClick={() => setActiveTab('home')}>
              <div className="bg-[#003366] p-2 rounded-lg shadow-lg">
                <Beaker className="text-white w-6 h-6" />
              </div>
              <div className="flex flex-col">
                <span className="font-bold text-lg leading-tight tracking-tight text-[#003366]">WKU BioLab</span>
                <span className="text-[10px] font-bold text-[#C5B358] uppercase tracking-[0.2em]">
                  {t('Management System', '管理系统')}
                </span>
              </div>
            </div>
            <div className="hidden md:flex items-center gap-6">
              {[
                { id: 'home', label: t('Home', '首页'), icon: <HomeIcon size={16} /> },
                { id: 'equipment', label: t('Catalog', '器材库'), icon: <Microscope size={16} /> },
                { id: 'tutorials', label: t('Tutorials', '教学'), icon: <GraduationCap size={16} /> },
                { id: 'safety', label: t('Safety', '安全'), icon: <ShieldCheck size={16} /> },
                { id: 'quiz', label: t('Quiz', '测试'), icon: <HelpCircle size={16} /> },
              ].map(tab => (
                <button
                  key={tab.id}
                  onClick={() => setActiveTab(tab.id as Tab)}
                  className={cn(
                    "text-sm font-bold flex items-center gap-2 px-3 py-2 rounded-xl transition-all",
                    activeTab === tab.id ? "text-[#003366] bg-blue-50" : "text-slate-500 hover:text-[#003366] hover:bg-slate-50"
                  )}
                >
                  {tab.icon}
                  {tab.label}
                </button>
              ))}
              <div className="flex items-center gap-3 border-l border-slate-200 pl-6 ml-2">
                <button
                  onClick={() => setLanguage(language === 'en' ? 'zh' : 'en')}
                  className="text-xs font-bold px-3 py-1.5 rounded-lg border border-slate-200 hover:bg-slate-50 transition-all text-slate-600 flex items-center gap-2"
                >
                  <Waves size={14} className="text-[#C5B358]" />
                  {language === 'en' ? '中文' : 'English'}
                </button>
                <button
                  onClick={handleLogout}
                  className="text-xs font-bold px-3 py-1.5 rounded-lg border border-slate-200 hover:bg-rose-50 hover:text-rose-600 transition-all text-slate-600 flex items-center gap-2"
                >
                  <LogOut size={14} />
                  {t('Logout', '退出登录')}
                </button>
              </div>
            </div>
            <div className="md:hidden">
              <Menu className="text-slate-600" />
            </div>
          </div>
        </div>
      </nav>

      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <AnimatePresence mode="wait">
          <motion.div
            key={activeTab}
            initial={{ opacity: 0, x: 10 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -10 }}
            transition={{ duration: 0.2 }}
          >
            {activeTab === 'home' && renderHome()}
            {activeTab === 'equipment' && renderEquipment()}
            {activeTab === 'tutorials' && renderTutorials()}
            {activeTab === 'safety' && renderSafety()}
            {activeTab === 'quiz' && renderQuiz()}
          </motion.div>
        </AnimatePresence>
      </main>

      {/* Equipment Detail Modal */}
      <AnimatePresence>
        {selectedEquipment && (
          <div className="fixed inset-0 z-50 flex items-center justify-center p-4 sm:p-6">
            <motion.div 
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              onClick={() => setSelectedEquipment(null)}
              className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm"
            />
            <motion.div 
              initial={{ opacity: 0, scale: 0.9, y: 20 }}
              animate={{ opacity: 1, scale: 1, y: 0 }}
              exit={{ opacity: 0, scale: 0.9, y: 20 }}
              className="relative w-full max-w-4xl bg-white rounded-3xl shadow-2xl overflow-hidden flex flex-col md:flex-row max-h-[90vh]"
            >
              <button 
                onClick={() => setSelectedEquipment(null)}
                className="absolute top-4 right-4 z-10 bg-white/80 backdrop-blur-sm p-2 rounded-full text-slate-600 hover:text-slate-900 transition-colors"
              >
                <X size={20} />
              </button>

              <div className="w-full md:w-1/2 bg-slate-100">
                <img 
                  src={selectedEquipment.image} 
                  alt={selectedEquipment.name}
                  className="w-full h-full object-cover"
                  referrerPolicy="no-referrer"
                />
              </div>

              <div className="w-full md:w-1/2 p-8 overflow-y-auto custom-scrollbar">
                <div className="mb-8">
                  <div className="flex items-center justify-between mb-4">
                    <span className="text-[#003366] text-xs font-bold uppercase tracking-widest">
                      {t(selectedEquipment.category, selectedEquipment.category === 'Microscopy' ? '显微镜' : selectedEquipment.category === 'Centrifugation' ? '离心' : selectedEquipment.category === 'Molecular' ? '分子' : selectedEquipment.category === 'General' ? '通用' : selectedEquipment.category === 'Glassware' ? '玻璃器皿' : '安全')}
                    </span>
                    <span className={cn(
                      "text-xs font-bold px-3 py-1 rounded-full uppercase tracking-wider",
                      selectedEquipment.status === 'Available' ? "bg-emerald-100 text-emerald-700" :
                      selectedEquipment.status === 'In Use' ? "bg-amber-100 text-amber-700" : "bg-rose-100 text-rose-700"
                    )}>
                      {t(selectedEquipment.status, selectedEquipment.status === 'Available' ? '可用' : selectedEquipment.status === 'In Use' ? '使用中' : '维护中')}
                    </span>
                  </div>
                  <h2 className="text-3xl font-bold text-slate-900 mb-2">{t(selectedEquipment.name, selectedEquipment.nameZh)}</h2>
                  <p className="text-slate-600 leading-relaxed mb-8">{t(selectedEquipment.description, selectedEquipment.descriptionZh)}</p>
                </div>
                {selectedEquipment.videoUrl && (
  <div className="mb-8">
    <button
      onClick={() => setIsVideoOpen(!isVideoOpen)}
      className="w-full flex items-center justify-between text-left py-3 px-2 bg-slate-50 hover:bg-slate-100 rounded-xl transition-all"
    >
      <span className="flex items-center gap-2 font-semibold text-slate-800">
        <Play size={18} className="text-[#003366]" />
        {t('📺 Operation Video', '📺 操作视频')}
      </span>
      <span className={`transform transition-transform duration-300 text-slate-500 ${isVideoOpen ? 'rotate-180' : ''}`}>
        ▼
      </span>
    </button>

    <AnimatePresence>
      {isVideoOpen && (
        <motion.div
          initial={{ height: 0, opacity: 0 }}
          animate={{ height: 'auto', opacity: 1 }}
          exit={{ height: 0, opacity: 0 }}
          className="overflow-hidden"
        >
          <div className="pt-4 pb-2">
            <div className="aspect-video rounded-xl overflow-hidden shadow-md bg-slate-900">
              <iframe
                src={selectedEquipment.videoUrl}  // ← 直接使用，不需要判断语言
                className="w-full h-full"
                title={`${t(selectedEquipment.name, selectedEquipment.nameZh)} - Operation Tutorial`}
                frameBorder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                referrerPolicy="strict-origin-when-cross-origin"
                allowFullScreen
              />
            </div>
            <p className="text-xs text-slate-400 mt-2 text-center">
              {t('Video tutorial from YouTube', '视频教程来自 YouTube')}
            </p>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  </div>
)}

               {/* Function / 功能用途（Bullet Points） */}
<div className="mb-8">
  <button
    onClick={() => setIsFunctionOpen(!isFunctionOpen)}
    className="w-full flex items-center justify-between text-left text-xl font-semibold py-4 border-b border-slate-100 hover:bg-slate-50 rounded-xl px-2 transition-all"
  >
    <span className="flex items-center gap-2">
      <GraduationCap size={22} className="text-[#003366]" />
      {t('Function', '功能用途')}
    </span>
    <span className={`transition-transform duration-300 ${isFunctionOpen ? 'rotate-180' : ''}`}>
      ▼
    </span>
  </button>

  <AnimatePresence>
    {isFunctionOpen && (
      <motion.div
        initial={{ height: 0, opacity: 0 }}
        animate={{ height: 'auto', opacity: 1 }}
        exit={{ height: 0, opacity: 0 }}
        className="overflow-hidden"
      >
        <div className="pt-5 pb-2 text-slate-600 leading-relaxed">
          <ul className="space-y-3 list-disc list-outside pl-5">
            {t(selectedEquipment.usage, selectedEquipment.usageZh)
              ?.split('\n')
              .filter(item => item.trim() !== '')
              .map((item: string, index: number) => (
                <li key={index} className="pl-2">{item}</li>
              ))}
          </ul>
        </div>
      </motion.div>
    )}
  </AnimatePresence>
</div>

                <div className="space-y-8">
                  {/* Technical Specs Table - ZJU Style */}
                  <div>
                    <h4 className="font-bold text-slate-900 mb-4 flex items-center gap-2 border-b border-slate-100 pb-2">
                      <Info size={18} className="text-[#003366]" />
                      {t('Technical Specifications', '技术规格')}
                    </h4>
                    <div className="grid grid-cols-2 gap-y-3 text-sm">
                      <div className="text-slate-500">{t('Model', '型号')}</div>
                      <div className="font-medium text-slate-900">{selectedEquipment.model || 'N/A'}</div>
                      <div className="text-slate-500">{t('Manufacturer', '制造商')}</div>
                      <div className="font-medium text-slate-900">{selectedEquipment.manufacturer || 'N/A'}</div>
                      <div className="text-slate-500">{t('Location', '位置')}</div>
                      <div className="font-medium text-slate-900">{t(selectedEquipment.location, selectedEquipment.locationZh) || 'N/A'}</div>
                      <div className="text-slate-500">{t('Asset ID', '资产编号')}</div>
                      <div className="font-mono text-slate-900">{selectedEquipment.assetId || 'N/A'}</div>
                    </div>
                  </div>

                  <div>
                    <h4 className="font-bold text-slate-900 mb-4 flex items-center gap-2 border-b border-slate-100 pb-2">
                      <GraduationCap size={18} className="text-[#003366]" />
                      {t('Operation Guide', '操作指南')}
                    </h4>
                    <ul className="space-y-4">
                      {t(selectedEquipment.steps, selectedEquipment.stepsZh).map((step, i) => (
                        <li key={i} className="flex gap-4 text-sm text-slate-600">
                          <span className="flex-shrink-0 w-6 h-6 bg-blue-50 text-[#003366] rounded-lg flex items-center justify-center text-xs font-bold border border-blue-100">
                            {i + 1}
                          </span>
                          <span className="pt-0.5">{step}</span>
                        </li>
                      ))}
                    </ul>
                  </div>

                  <div className="bg-amber-50 rounded-2xl p-6 border border-amber-100">
                    <h4 className="font-bold text-amber-900 mb-3 flex items-center gap-2">
                      <AlertTriangle size={18} className="text-amber-500" />
                      {t('Safety Precautions', '安全注意事项')}
                    </h4>
                    <ul className="space-y-2">
                      {t(selectedEquipment.safetyTips, selectedEquipment.safetyTipsZh).map((tip, i) => (
                        <li key={i} className="text-sm text-amber-800 flex gap-3">
                          <span className="text-amber-400 font-bold">•</span>
                          {tip}
                        </li>
                      ))}
                    </ul>
                  </div>
                </div>
              </div>
            </motion.div>
          </div>
        )}
      </AnimatePresence>

      {/* Footer */}
      <footer className="bg-white border-t border-slate-200 py-12 mt-12">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div className="col-span-1 md:col-span-2">
              <div className="flex items-center gap-3 mb-4">
                <div className="bg-[#003366] p-1.5 rounded-lg">
                  <Beaker className="text-white w-5 h-5" />
                </div>
                <span className="font-bold text-xl tracking-tight text-[#003366]">WKU BioLab</span>
              </div>
              <p className="text-slate-500 text-sm max-w-sm">
                {t('The official BioLab Equipment Management System of Wenzhou-Kean University. Providing technical excellence and safety in laboratory education.', '温州肯恩大学官方生物实验室器材管理系统。在实验室教育中提供卓越的技术和安全保障。')}
              </p>
            </div>
            <div>
              <h4 className="font-bold text-slate-900 mb-4">{t('Quick Links', '快速链接')}</h4>
              <ul className="space-y-2 text-sm text-slate-500">
                <li><button onClick={() => setActiveTab('equipment')} className="hover:text-emerald-600">{t('Equipment Wiki', '器材维基')}</button></li>
                <li><button onClick={() => setActiveTab('tutorials')} className="hover:text-emerald-600">{t('Tutorials', '教学')}</button></li>
                <li><button onClick={() => setActiveTab('safety')} className="hover:text-emerald-600">{t('Safety Protocols', '安全规范')}</button></li>
              </ul>
            </div>
            <div>
              <h4 className="font-bold text-slate-900 mb-4">{t('Contact Us', '联系我们')}</h4>
              <ul className="space-y-2 text-sm text-slate-500">
                <li>{t('Wenzhou-Kean University, Biology Department', '温州肯恩大学，生物系')}</li>
                <li>{t('Science Building, C101', '理学楼，C101')}</li>
                <li>lab-support@wku.edu.cn</li>
              </ul>
            </div>
          </div>
          <div className="border-t border-slate-100 mt-12 pt-8 flex flex-col md:flex-row justify-between items-center gap-4">
            <p className="text-xs text-slate-400">© 2026 Wenzhou-Kean University. {t('Web Design Course Project.', '网页设计课程项目。')}</p>
          </div>
        </div>
      </footer>
    </div>
  );
}
