export interface Equipment {
  id: string;
  name: string;
  nameZh: string;
  category: 'Microscopy' | 'Centrifugation' | 'Molecular' | 'General' | 'Glassware' | 'Safety';
  description: string;
  descriptionZh: string;
  image: string;
  usage: string;
  usageZh: string;
  scenarios: string;
  scenariosZh: string;
  steps: string[];
  stepsZh: string[];
  safetyTips: string[];
  safetyTipsZh: string[];
  // Technical fields inspired by ZJU/Fudan references
  model?: string;
  manufacturer?: string;
  location?: string;
  locationZh?: string;
  status: 'Available' | 'In Use' | 'Maintenance';
  assetId?: string;
  videoUrl?: string;      // 英文版视频URL

}

export interface Tutorial {
  id: string;
  title: string;
  titleZh: string;
  equipmentId: string;
  steps: {
    title: string;
    titleZh: string;
    description: string;
    descriptionZh: string;
  }[];
}

export interface SafetyRule {
  id: string;
  title: string;
  titleZh: string;
  content: string;
  contentZh: string;
  icon: string;
}

export interface QuizQuestion {
  id: string;
  question: string;
  questionZh: string;
  options: string[];
  optionsZh: string[];
  correctAnswer: number;
  explanation: string;
  explanationZh: string;
}

export interface Message {
  role: 'user' | 'model';
  content: string;
}

export interface Student {
  id: number;
  studentNumber: string;
  name: string;
}

export interface QuizAttemptSummary {
  id: number;
  score: number;
  totalQuestions: number;
  submittedAt: string;
}
